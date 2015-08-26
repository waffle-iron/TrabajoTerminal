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

import com.escom.tt.modelo.Nivel;
import com.escom.tt.repositorio.NivelRepositorio;;

@Controller
public class NivelContralador {

	@Autowired
	private NivelRepositorio nivelRepositorio;
	
	@RequestMapping(value="/nivel/crear", method = RequestMethod.GET)
	public String crear(Model modelo){
		modelo.addAttribute("nivel", new Nivel());
		return "nivel-crear";
	}
	
	@RequestMapping(value="/nivel/guardar", method = RequestMethod.POST)
	public String guardar(@ModelAttribute("nivel") @Valid Nivel nivel, BindingResult validacion, Model modelo){
		String ruta = null;
		if (validacion.hasErrors()){
			modelo.addAttribute("nivel", nivel);
		}else{
			Integer id = nivelRepositorio.crearNivel(nivel);
			ruta = "redirect:/nivel/ver/" + nivel.getIdNivel() + "/?creado=true";
		}
		return ruta;
	}
	
	@RequestMapping(value="/nivel/guardarCambios", method = RequestMethod.POST)
	public String guardarCambios(@ModelAttribute("nivel") @Valid Nivel nivel, BindingResult validacion, Model modelo){
		String ruta = null;
		
		if (validacion.hasErrors()){
			modelo.addAttribute("nivel", nivel);
			ruta = "nivel-editar";
		}else{
			Integer id = nivelRepositorio.actualizarNivel(nivel);
			ruta = "redirect:/nivel/ver/" + nivel.getIdNivel() + "/?actualizado=true";
		}
		return ruta;
			
		}
	
	@RequestMapping(value="/nivel/{nivelId:[0-9]+}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable Integer nivelId, Model modelo){
		String ruta = null;
		Nivel nivel = null;
		nivel = nivelRepositorio.buscarPorId(nivelId);
		
		if (nivel !=null){
			modelo.addAttribute("nivel", nivel);
			ruta = "nivel-editar";
		}else{
			ruta = "redirect:/nivel";
		}
		
		
		return ruta;
	}
	
	@RequestMapping(value="/nivel/ver/{nivelId:[0-9]+}")
	public String ver(@PathVariable Integer nivelId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Nivel nivel = null;
		nivel = nivelRepositorio.buscarPorId(nivelId);
		
		if(nivel != null){
			modelo.addAttribute("nivel", nivel);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "nivel-ver";
		}else{
			ruta = "redirect:/nivel";
		}
		return ruta;
	}
	
	@RequestMapping(value="/nivel/eliminar/{nivelId:[0-9]+}")
	public String eliminar (@PathVariable Integer nivelId, Model modelo){
		nivelRepositorio.eliminarNivel(nivelRepositorio.buscarPorId(nivelId));
		modelo.addAttribute("mensaje", "se ha eliminado el nivel");
		return "nivel-eliminar";
		
	}
	@RequestMapping(value = "/nivel")
	public String verTodos(Model modelo){
		List<Nivel> niveles = null;
		niveles= nivelRepositorio.obtenerTodos();
		modelo.addAttribute("niveles", niveles);
		return "nivel-todos";
				
	}
}
	
	
	
	
	
