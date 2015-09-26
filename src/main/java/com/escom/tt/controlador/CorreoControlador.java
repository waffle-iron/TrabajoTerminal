package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.Correo;
import com.escom.tt.modelo.Escuela;
import com.escom.tt.repositorio.CorreoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

@Controller
public class CorreoControlador {
	@Autowired
	private CorreoRepositorio correoRepositorio;
	
	@Autowired
	private UsuarioRepositorio usuarioRepositorioReceptor;
	
	@Autowired
	private UsuarioRepositorio usuarioRepositorioEmisor;
	
	@RequestMapping(value="/correo/crear", method = RequestMethod.GET)
	public String crear(Model modelo){

		modelo.addAttribute("usuarioReceptorList", usuarioRepositorioReceptor.obtenerTodos());
		modelo.addAttribute("usuarioEmisorList", usuarioRepositorioEmisor.obtenerTodos());
		modelo.addAttribute("correo", new Correo());

		return "correo-crear";
	}
	
	@RequestMapping(value="/correo/crear", method = RequestMethod.POST)
	public String crear(@ModelAttribute("correo") @Valid Correo correo, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("correo", correo);
			ruta = "correo-crear";
		}else{
			Integer id = correoRepositorio.crearCorreo(correo);
			ruta = "redirect:/correo/ver/" + correo.getIdCorreo()+ "/?creado=true";
		}
		return ruta;
	}
	
	@RequestMapping(value="/correo/guardarCambios", method = RequestMethod.POST)
	public String actualizar(@ModelAttribute("correo") @Valid Correo correo, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("correo", correo);
			ruta = "correo-editar";
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
			modelo.addAttribute("usuarioReceptorList", usuarioRepositorioReceptor.obtenerTodos());
			modelo.addAttribute("usuarioEmisorList", usuarioRepositorioEmisor.obtenerTodos());
			modelo.addAttribute("correo", correo);
			ruta = "correo-editar";
		}
		else
			ruta = "redirect:/correo";

		return ruta;
	}
	
	@RequestMapping(value="/correo/ver/{correoId:[0-9]+}")
	public String ver(@PathVariable Integer correoId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Correo correo= null;

		correo= correoRepositorio.buscarPorId(correoId);
		if (correo != null) {
			modelo.addAttribute("correo", correo);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "correo-ver";
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
	public String verTodos(Model modelo,Boolean eliminado) {

		List<Correo> correoList = null;

		correoList = correoRepositorio.obtenerTodos();

		modelo.addAttribute("correosList", correoList);
		modelo.addAttribute("eliminado", eliminado);

		return "correo-todos";
	}


}
