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

import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.EscuelaRepositorio;
import com.escom.tt.repositorio.GradoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;



@Controller
public class UsuarioControlador {

	@Autowired
	private UsuarioRepositorio usuarioRepositorio;

	@Autowired
	private EscuelaRepositorio escuelaRepositorio;

	@Autowired
	private GradoRepositorio gradoRepositorio;

	@RequestMapping(value="/registro", method = RequestMethod.GET)
	public String registrarse(Model modelo){

		modelo.addAttribute("usuario", new Usuario());
		modelo.addAttribute("escuelaList", escuelaRepositorio.obtenerTodos());
		modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
		return "registro";
	}
	@RequestMapping(value="/usuario/crear", method = RequestMethod.POST)
	public String crear(@ModelAttribute("usuario") @Valid Usuario usuario, BindingResult validacion, Model modelo) {
		String ruta = null;
		
		if (validacion.hasErrors()){
			System.err.println(validacion.getAllErrors());
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("escuelaList", escuelaRepositorio.obtenerTodos());
			modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
			ruta = "registro";
		}else{
			usuario.setEvaluacion(10);
			usuario.setActivo(true);
			usuario.setRol("ROL_ADMIN");
			Integer id = usuarioRepositorio.crearUsuario(usuario);
			System.err.println("NO HUBO ERRORES");
			ruta = "redirect:/login/?creado=true";
		}
		return ruta;
	}

	@RequestMapping(value="/usuario/guardarCambios", method = RequestMethod.POST)
	public String actualizar(@ModelAttribute("usuario") @Valid Usuario usuario, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("usuario", usuario);
			ruta = "usuario/usuario-editar";
		}else{
			Integer id = usuarioRepositorio.actualizarUsuario(usuario);
			ruta = "redirect:/usuario/ver/" + usuario.getIdUsuarios() + "/?actualizado=true";
		}
		return ruta;
	}
	@RequestMapping(value="/usuario/{usuarioId:[0-9]+}/editar", method = RequestMethod.GET)
	public String actualizar(@PathVariable Integer usuarioId,Model modelo) {
		Usuario usuario = null;
		String ruta = null;
		usuario = usuarioRepositorio.buscarPorId(usuarioId);

		if (usuario != null) {
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("escuelaList", escuelaRepositorio.obtenerTodos());
			modelo.addAttribute("gradoList", gradoRepositorio.obtenerTodos());
			
			ruta = "usuario/usuario-editar";
		}
		else
			ruta = "redirect:/usuario";

		return ruta;
	}
	@RequestMapping(value="/usuario/ver/{usuarioId:[0-9]+}")
	public String ver(@PathVariable Integer usuarioId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Usuario usuario= null;

		usuario = usuarioRepositorio.buscarPorId(usuarioId);
		if (usuario != null) {
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "usuario/usuario-ver";
		}else
			ruta = "redirect:/usuario";

		return ruta;
	}
	@RequestMapping(value="/usuario/eliminar/{usuarioId:[0-9]+}")
	public String eliminar(@PathVariable Integer usuarioId, Model modelo) {

		usuarioRepositorio.eliminarUsuario(usuarioRepositorio.buscarPorId(usuarioId));
		modelo.addAttribute("mensaje", "Se ha eliminado el usuario");
		return "usuario/usuario-eliminar";
	}
	@RequestMapping(value="/usuario")
	public String verTodos(Model modelo) {

		List<Usuario> usuarioList = null;

		usuarioList = usuarioRepositorio.obtenerTodos();

		modelo.addAttribute("usuarioList", usuarioList);

		return "usuario/usuario-todos";
	}
	
	@RequestMapping(value="/usuario/perfil/{usuarioId:[0-9]+}")
	public String verMiPerfil(@PathVariable Integer usuarioId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Usuario usuario= null;

		usuario = usuarioRepositorio.buscarPorId(usuarioId);
		if (usuario != null) {
			modelo.addAttribute("usuario", usuario);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "usuario/usuario-perfil";
		}else
			ruta = "redirect:/usuario";

		return ruta;
	}
	

	

	
}
