package com.escom.tt.controlador;

import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import com.escom.tt.modelo.Usuario;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.escom.tt.modelo.Correo;
import com.escom.tt.modelo.Escuela;
import com.escom.tt.repositorio.CorreoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

@Controller
public class CorreoControlador {
	@Autowired
	private CorreoRepositorio correoRepositorio;
	
	@Autowired
	private UsuarioRepositorio usuarioRepositorio;
	
	@RequestMapping(value="/correo/crear", method = RequestMethod.GET)
	public String crear(Model modelo, Principal principal){

		String nombre = principal.getName();
		String nombre2 = null;
		Usuario usuarioExistente = new Usuario();
		usuarioExistente = usuarioRepositorio.buscarPorCorreo(nombre);
		
		nombre2 = usuarioExistente.getNombreUsuario();
		
		modelo.addAttribute("usuarioReceptorList", usuarioRepositorio.obtenerTodos());
		modelo.addAttribute("usuarioEmisorList", usuarioRepositorio.obtenerTodos());
		modelo.addAttribute("correo", new Correo());
		modelo.addAttribute("nombre", nombre);
		modelo.addAttribute("nombre2", nombre2);
		modelo.addAttribute("usuarioId", usuarioExistente.getIdUsuarios());
		
		
		
		

		return "correo/correo-crear";
	}
	
	@RequestMapping(value="/correo/crear", method = RequestMethod.POST)
	public String crear(@ModelAttribute("correo") @Valid Correo correo, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("correo", correo);

		}else{
			correo.setFechaHora(new Date());
			Integer id = correoRepositorio.crearCorreo(correo);

		}
		ruta = "redirect:/chat/" + correo.getUsuarioReceptor().getIdUsuarios();
		return ruta;
	}
	
	@RequestMapping(value="/correo/guardarCambios", method = RequestMethod.POST)
	public String actualizar(@ModelAttribute("correo") @Valid Correo correo, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("correo", correo);
			ruta = "correo/correo-editar";
		}else{
			Integer id = correoRepositorio.actualizarCorreo(correo);
			ruta = "redirect:/correo/ver/" + correo.getIdCorreo() + "/?actualizado=true";
		}
		return ruta;
	}
	
	@RequestMapping(value="/correo/{correoId:[0-9]+}/editar", method = RequestMethod.GET)
	public String actualizar(@PathVariable Integer correoId,Model modelo) {
		Correo correo = null;
		String ruta = null;
		correo = correoRepositorio.buscarPorId(correoId);

		if (correo != null) {
			modelo.addAttribute("usuarioReceptorList", usuarioRepositorio.obtenerTodos());
			modelo.addAttribute("usuarioEmisorList", usuarioRepositorio.obtenerTodos());
			modelo.addAttribute("correo", correo);
			ruta = "correo/correo-editar";
		}
		else
			ruta = "redirect:/correo";

		return ruta;
	}
	
	@RequestMapping(value="/correo/ver/{correoId:[0-9]+}")
	public String ver(@PathVariable Integer correoId, Model modelo, Boolean actualizado, Boolean creado, Principal principal) {
		String ruta = null;
		Correo correo= null;
		String nombre = principal.getName();


		correo= correoRepositorio.buscarPorId(correoId);
		if (correo != null) {
			modelo.addAttribute("correo", correo);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			modelo.addAttribute("nombre", nombre);
			
			ruta = "correo/correo-ver";
		}else
			ruta = "redirect:/correo";

		return ruta;
	}
	
	@RequestMapping(value="/correo/eliminar/{correoId:[0-9]+}")
	public String eliminar(@PathVariable Integer correoId, Model modelo) {
		Boolean eliminado;
		Correo correo = null;
		correo= correoRepositorio.buscarPorId(correoId);

		if(correo != null){
			correoRepositorio.eliminarCorreo(correo);
			eliminado = true;
		}else{
			eliminado = false;
		}

		return "redirect:/correo?eliminado=" + eliminado;
	}
	
	@RequestMapping(value="/correo")
	public String verTodos(Model modelo,Boolean eliminado, Principal principal) {
		String nombre = principal.getName(); 
		Usuario usuario = new Usuario();
		usuario = usuarioRepositorio.buscarPorCorreo(nombre);
		List<Correo> correoListPropios = null;
		List<Correo> correoListRecibidos = null;
		
		correoListPropios = correoRepositorio.obtenerCorreosPropios(usuario);
		correoListRecibidos = correoRepositorio.obtenerCorreosPropiosRecibidos(usuario);
		
//		correoList = correoRepositorio.obtenerTodos();

		modelo.addAttribute("correosListPropios", correoListPropios);
		modelo.addAttribute("correosListRecibidos", correoListRecibidos );
		
		modelo.addAttribute("eliminado", eliminado);
		modelo.addAttribute("nombre", nombre);
		

		return "correo/correo-todos";
	}

	@RequestMapping(value="/chat/{usuarioId:[0-9]+}")
	public String chat(@PathVariable Integer usuarioId, Model modelo, Principal principal) {

		List<Correo> correoList = null;
		Usuario usuarioEnSesion = null;
		Usuario usuarioConChat = null;
		String nombre = principal.getName();

		if (principal != null)
			usuarioEnSesion = usuarioRepositorio.buscarPorCorreo(principal.getName());
		if (usuarioEnSesion != null)
			usuarioConChat = usuarioRepositorio.buscarPorId(usuarioId);
		if (usuarioConChat != null)
			correoList = correoRepositorio.chat(usuarioEnSesion, usuarioConChat);

		modelo.addAttribute("chat", correoList);
		modelo.addAttribute("principal", principal.getName());
		if (usuarioConChat != null) {
			modelo.addAttribute("receptor", usuarioConChat.getNombres() + " " + usuarioConChat.getaPaterno() + " " + usuarioConChat.getaMaterno());
			modelo.addAttribute("idReceptor", usuarioConChat.getIdUsuarios());
			modelo.addAttribute("idEmisor", usuarioEnSesion.getIdUsuarios());
			modelo.addAttribute("correo", new Correo());
			modelo.addAttribute("nombre", nombre);
			
			
		}
		else
			return "redirect:/";

		return "correo/correo-chat";
	}
	@RequestMapping(value="/correo/recibidos")
	public String verRecibidos(Model modelo,Boolean eliminado, Principal principal) {
		String nombre = principal.getName(); 
		Usuario usuario = new Usuario();
		usuario = usuarioRepositorio.buscarPorCorreo(nombre);
		List<Correo> correoListPropios = null;
		List<Correo> correoListRecibidos = null;
		
		correoListPropios = correoRepositorio.obtenerCorreosPropios(usuario);
		correoListRecibidos = correoRepositorio.obtenerCorreosPropiosRecibidos(usuario);
		
//		correoList = correoRepositorio.obtenerTodos();

		modelo.addAttribute("correosListPropios", correoListPropios);
		modelo.addAttribute("correosListRecibidos", correoListRecibidos );
		
		modelo.addAttribute("eliminado", eliminado);
		modelo.addAttribute("nombre", nombre);
		

		return "correo/correo-recibidos";
	}
	@RequestMapping(value="/correo/enviados")
	public String verEnviados(Model modelo,Boolean eliminado, Principal principal) {
		String nombre = principal.getName(); 
		Usuario usuario = new Usuario();
		usuario = usuarioRepositorio.buscarPorCorreo(nombre);
		List<Correo> correoListPropios = null;
		List<Correo> correoListRecibidos = null;
		int totalRecibidos = 0;
		correoListPropios = correoRepositorio.obtenerCorreosPropios(usuario);
		correoListRecibidos = correoRepositorio.obtenerCorreosPropiosRecibidos(usuario);
		totalRecibidos = correoListRecibidos.size();
//		correoList = correoRepositorio.obtenerTodos();

		modelo.addAttribute("correosListPropios", correoListPropios);
		modelo.addAttribute("correosListRecibidos", correoListRecibidos );
		
		modelo.addAttribute("eliminado", eliminado);
		modelo.addAttribute("nombre", nombre);
//		modelo.addAttribute("totalRecibidos", totalRecibidos);
//		session.setAttribute("totalRecibidos", totalRecibidos);

		return "correo/correo-enviados";
	}
	


}
