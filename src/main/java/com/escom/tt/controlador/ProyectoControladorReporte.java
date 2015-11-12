package com.escom.tt.controlador;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProyectoControladorReporte {

	@RequestMapping(value="/reporte/proyecto",method=RequestMethod.GET)
	public String verReporte(Model modelo){
		
		Calendar fechaActual = new GregorianCalendar();
		String dia="", mes="", anio="", fecha="";
		dia = Integer.toString(fechaActual.get(Calendar.DATE));
		mes = Integer.toString(fechaActual.get(Calendar.MONTH));
		anio = Integer.toString(fechaActual.get(Calendar.YEAR));
		fecha = dia+"/"+mes+"/"+anio; 
		modelo.addAttribute("fecha",fecha);
		
		
		return "reporte-proyecto";
	}
}
