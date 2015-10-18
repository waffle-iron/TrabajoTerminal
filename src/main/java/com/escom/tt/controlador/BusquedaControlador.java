package com.escom.tt.controlador;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;


@Controller
public class BusquedaControlador {
	
	
	
	
	@RequestMapping(value = "/busqueda/bus")
	public String resultadoBusqueda(@ModelAttribute("cadena") @Valid String cadena, BindingResult validacion, Model modelo, Principal principal){
		List<Proyecto> listaProyectos = null;
		List<Usuario> listausuarios = null;
		
		
		
		
		return "ResultadosBusqueda";				
		
	}
	
	
}
