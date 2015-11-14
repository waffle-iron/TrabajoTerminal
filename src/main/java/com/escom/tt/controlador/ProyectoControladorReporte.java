package com.escom.tt.controlador;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Tarea;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.ProyectoRepositorio;
import com.escom.tt.repositorio.TareaRepositorio;

@Controller
public class ProyectoControladorReporte {

	@Autowired
	ProyectoRepositorio proyectoRepositorio;
	@Autowired
	TareaRepositorio tareaRepositorio;
	
	@RequestMapping(value="/proyecto/reporte/{proyectoId:[0-9]+}",method=RequestMethod.GET)
	public String verReporte(@PathVariable Integer proyectoId,  Model modelo){
		String ruta = null;
		Proyecto proyecto = null;
		Calendar fechaActual = new GregorianCalendar();
		String dia="", mes="", anio="", fecha="";
		dia = Integer.toString(fechaActual.get(Calendar.DATE));
		mes = Integer.toString(fechaActual.get(Calendar.MONTH));
		anio = Integer.toString(fechaActual.get(Calendar.YEAR));
		fecha = dia+"/"+mes+"/"+anio; 
		modelo.addAttribute("fecha",fecha);			
		
		proyecto = proyectoRepositorio.buscarPorId(proyectoId);
		List<Tarea> listaTareasDeProyecto = new ArrayList();
		listaTareasDeProyecto = tareaRepositorio.obtenerPorProy(proyecto);
		int totalTareasPorProy = listaTareasDeProyecto.size();
		List<ColaboradorProyecto> colaboradoresProyecto = new ArrayList();
		colaboradoresProyecto = proyecto.getColaboradorProyectos();
		int totalColaboradoresPorProyecto = colaboradoresProyecto.size();
		
		modelo.addAttribute("totalColaboradoresPorProyecto",totalColaboradoresPorProyecto);						
		modelo.addAttribute("totalTareasPorProy",totalTareasPorProy);				
		modelo.addAttribute("listaTareasDeProyecto",listaTareasDeProyecto);		
		modelo.addAttribute("colaboradoresProyecto",colaboradoresProyecto);				
		modelo.addAttribute("proyecto",proyecto);		
		
		
		return "proyecto/proyecto-reporte";
	}
}
