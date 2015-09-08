package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.Nivel;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Idioma;
import com.escom.tt.repositorio.AreaRepositorio;
import com.escom.tt.repositorio.EscuelaRepositorio;
import com.escom.tt.repositorio.NivelRepositorio;

@Controller
public class EscuelaControlador {
	@Autowired
	private EscuelaRepositorio escuelaRepositorio;
	
	@Autowired
	private AreaRepositorio areaRepositorio;
	
	@Autowired
	private NivelRepositorio nivelRepositorio;
	
	@RequestMapping(value="/escuela/crear", method = RequestMethod.GET)
	public String crear(Model modelo){

		modelo.addAttribute("areaList", areaRepositorio.obtenerTodos());
		modelo.addAttribute("nivelList", nivelRepositorio.obtenerTodos());
		modelo.addAttribute("escuela", new Escuela());

		return "escuela-crear";
	}
	
	@RequestMapping(value="/escuela/crear", method = RequestMethod.POST)
	public String crear(@ModelAttribute("escuela") @Valid Escuela escuela, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("escuela", escuela);
			ruta = "escuela-crear";
		}else{
			Integer id = escuelaRepositorio.crearEscuela(escuela);
			ruta = "redirect:/escuela/ver/" + escuela.getId()+ "/?creado=true";
		}
		return ruta;
	}

	
	@RequestMapping(value="/escuela/guardarCambios", method = RequestMethod.POST)
	public String actualizar(@ModelAttribute("escuela") @Valid Escuela escuela, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("escuela", escuela);
			ruta = "escuela-editar";
		}else{
			Integer id = escuelaRepositorio.actualizarEscuela(escuela);
			ruta = "redirect:/escuela/ver/" + escuela.getId() + "/?actualizado=true";
		}
		return ruta;
	}

	@RequestMapping(value="/escuela/{escuelaId:[0-9]+}/editar", method = RequestMethod.GET)
	public String actualizar(@PathVariable Integer escuelaId,Model modelo) {
		Escuela escuela = null;
		String ruta = null;
		escuela = escuelaRepositorio.buscarPorId(escuelaId);

		if (escuela != null) {
			modelo.addAttribute("areaList", areaRepositorio.obtenerTodos());
			modelo.addAttribute("nivelList", nivelRepositorio.obtenerTodos());
			modelo.addAttribute("escuela", escuela);
			ruta = "escuela-editar";
		}
		else
			ruta = "redirect:/escuela";

		return ruta;
	}

	@RequestMapping(value="/escuela/ver/{escuelaId:[0-9]+}")
	public String ver(@PathVariable Integer escuelaId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Escuela escuela= null;

		escuela = escuelaRepositorio.buscarPorId(escuelaId);
		if (escuela != null) {
			modelo.addAttribute("escuela", escuela);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "escuela-ver";
		}else
			ruta = "redirect:/escuela";

		return ruta;
	}

	@RequestMapping(value="/escuela/eliminar/{escuelaId:[0-9]+}")
	public String eliminar(@PathVariable Integer escuelaId, Model modelo) {
		Boolean eliminado;
		Escuela escuela = null;
		escuela = escuelaRepositorio.buscarPorId(escuelaId);

		if(escuela != null){
			escuelaRepositorio.eliminarEscuela(escuela);
			eliminado = true;
		}else{
			eliminado = false;
		}

		return "redirect:/escuela?eliminado=" + eliminado;
	}

	@RequestMapping(value="/escuela")
	public String verTodos(Model modelo,Boolean eliminado) {

		List<Escuela> escuelaList = null;

		escuelaList = escuelaRepositorio.obtenerTodos();

		modelo.addAttribute("escuelasList", escuelaList);
		modelo.addAttribute("eliminado", eliminado);

		return "escuela-todos";
	}
	
	
	
}
	




