package com.escom.tt.controlador;


import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		return "idioma-crear";
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
	
	
	
	
	
	

}
