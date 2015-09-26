package com.escom.tt.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class BusquedaControlador {
	
	@RequestMapping(value = "/busqueda/bus")
	public String resultadoBusqueda(){
		return "ResultadosBusqueda";
	}
	
	
}
