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

import com.escom.tt.modelo.Direccion;
import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.DireccionRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

@Controller
public class DireccionControlador {
	@Autowired
	private DireccionRepositorio direccionRepositorio;
	
	@Autowired
	private UsuarioRepositorio usuarioRepositorio;
	
	@RequestMapping(value="/direccion/crear", method = RequestMethod.GET)
	public String crear(Model modelo){
		modelo.addAttribute("usuarioList", usuarioRepositorio.obtenerTodos());
		modelo.addAttribute("direccion", new Direccion());
		return "direccion-crear";
		
	}
	
	@RequestMapping(value = "/direccion/crear", method = RequestMethod.POST)
	public String crear (@ModelAttribute("direccion") @Valid Direccion direccion, BindingResult validacion, Model modelo){
		String ruta = null;
		if (validacion.hasErrors()){
			modelo.addAttribute("direccion", direccion);
			ruta = "direccion-crear";
		}else {
			Integer id = direccionRepositorio.crearDireccion(direccion);
			ruta = "redirect:/direccion/ver/" + direccion.getIdDireccion()+"/?creado=true";
		}
		return ruta;
		
	}
	@RequestMapping(value="/direccion/guardarCambios", method = RequestMethod.POST)
	public String actualizar(@ModelAttribute("direccion") @Valid Direccion direccion, BindingResult validacion, Model modelo) {
		String ruta = null;
		System.err.println(direccion+"antes");
		if (validacion.hasErrors()){
			modelo.addAttribute("direccion", direccion);
			ruta = "direccion-editar";
			System.err.println(direccion+"con erreres");
		}else{
			Integer id = direccionRepositorio.actualizarDireccion(direccion);
			ruta = "redirect:/direccion/ver/" + direccion.getIdDireccion() + "/?actualizado=true";
			
			System.err.println(direccion+"todo estabien");
		}
		return ruta;
	}

	@RequestMapping(value="/direccion/{direccionId:[0-9]+}/editar", method = RequestMethod.GET)
	public String actualizar(@PathVariable Integer direccionId,Model modelo) {
		Direccion direccion = null;
		String ruta = null;
		direccion= direccionRepositorio.buscarPorId(direccionId);

		if (direccion!= null) {
			modelo.addAttribute("usuarioList", usuarioRepositorio.obtenerTodos());
			modelo.addAttribute("direccion", direccion);
			ruta = "direccion-editar";
		}
		else
			ruta = "redirect:/direccion";

		return ruta;
	}
//
	@RequestMapping(value="/direccion/ver/{direccionId:[0-9]+}")
	public String ver(@PathVariable Integer direccionId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Direccion direccion= null;

		direccion = direccionRepositorio.buscarPorId(direccionId);
		if (direccion != null) {
			modelo.addAttribute("direccion", direccion);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			System.err.println(direccion);
			ruta = "direccion-ver";
		}else
			ruta = "redirect:/direccion";

		return ruta;
	}

	@RequestMapping(value="/direccion/eliminar/{direccionId:[0-9]+}")
	public String eliminar(@PathVariable Integer direccionId, Model modelo) {
			
		
		direccionRepositorio.eliminarDireccion(direccionRepositorio.buscarPorId(direccionId));
		modelo.addAttribute("mensaje", "Se ha eliminado la direccion");
		return "direccion-eliminar";
	}
//http://localhost:8080/trabajoterminal/idioma/
	@RequestMapping(value="/direccion")
	public String verTodos(Model modelo) {

		List<Direccion> direccionList = null;

		direccionList = direccionRepositorio.obtenerTodos();

		modelo.addAttribute("direcciones", direccionList);

		return "direccion-todos";
	}

}
