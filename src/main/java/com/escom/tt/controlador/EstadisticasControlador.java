package com.escom.tt.controlador;

import java.security.Principal;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.escom.tt.modelo.CadenaBusqueda;
import com.escom.tt.modelo.Grado;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.GradoRepositorio;
import com.escom.tt.repositorio.ProyectoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

@Controller
public class EstadisticasControlador {

	@Autowired
	ProyectoRepositorio proyectoRepositorio;
	@Autowired
	UsuarioRepositorio usuarioRepositorio;
	@Autowired	
	GradoRepositorio gradoRepositorio;
	
	@RequestMapping(value = "/estadisticas", method = RequestMethod.GET)
	public String resultadoBusqueda(Model modelo) {
		
		List<Proyecto> listProyMult=null;
		listProyMult = proyectoRepositorio.buscaTipoProyecto(1);
		modelo.addAttribute("listProyMult", listProyMult);
		modelo.addAttribute("TamlistProyMult", listProyMult.size());
		
		List<Proyecto> listProyProg=null;
		listProyProg = proyectoRepositorio.buscaTipoProyecto(2);
		modelo.addAttribute("listProyProg", listProyProg);
		modelo.addAttribute("TamlistProyProg", listProyProg.size());
		
		List<Proyecto> listProyProp=null;
		listProyProp = proyectoRepositorio.buscaTipoProyecto(3);
		modelo.addAttribute("listProyProp", listProyProp);
		modelo.addAttribute("TamlistProyProp", listProyProp.size());		
		
		List<Proyecto> listProyInd=null;
		listProyInd = proyectoRepositorio.buscaTipoProyecto(4);
		modelo.addAttribute("listProyInd", listProyInd);
		modelo.addAttribute("TamlistProyInd", listProyInd.size());
				
		List<Proyecto> listProyRed=null;
		listProyRed = proyectoRepositorio.buscaTipoProyecto(5);
		modelo.addAttribute("listProyRed", listProyRed);
		modelo.addAttribute("TamlistProyRed", listProyRed.size());
		
		List<Proyecto> listProyInv = null;
		listProyInv = proyectoRepositorio.buscaTipoProyecto(6);
		modelo.addAttribute("listProyInv", listProyInv);
		modelo.addAttribute("TamlistProyInv", listProyInv.size());
		
		List<Proyecto> listProyTT = null;
		listProyTT = proyectoRepositorio.buscaTipoProyecto(7);
		modelo.addAttribute("listProyTT", listProyTT);
		modelo.addAttribute("TamlistProyTT", listProyTT.size());
				
		List<Proyecto> listProyTodos = null;
		listProyTodos = proyectoRepositorio.obtenerTodos();
		int totalProy = listProyTodos.size();
		modelo.addAttribute("totalProy", totalProy);
		
		List<Usuario> listUsuTodos = null;
		listUsuTodos = usuarioRepositorio.obtenerTodos();
		int totalUsuarios = listUsuTodos.size();
		modelo.addAttribute("totalUsuarios", totalUsuarios);
		
		List<Grado> listaGradoAcadMS = null;
		listaGradoAcadMS = gradoRepositorio.buscaGradoAcademico("Medio Superior");
		int totalUsuariosMedioSuperior = listaGradoAcadMS .size();
		modelo.addAttribute("totalUsuariosMedioSuperior", totalUsuariosMedioSuperior);
		
		List<Grado> listaGradoAcadS = null;
		listaGradoAcadS = gradoRepositorio.buscaGradoAcademico("Superior");
		int totalUsuariosSuperior = listaGradoAcadS .size();
		modelo.addAttribute("totalUsuariosSuperior", totalUsuariosSuperior);
		
		List<Proyecto> proyectosPorGradoMedSup = null;
		proyectosPorGradoMedSup = proyectoRepositorio.obtenerTodosProyectosPorGradoMedSUp();
		int totalProyectosPorGradoMedSup = proyectosPorGradoMedSup.size();
		modelo.addAttribute("totalProyectosPorGradoMedSup", totalProyectosPorGradoMedSup);
		
		List<Proyecto> proyectosPorGradoSup = null;
		proyectosPorGradoSup = proyectoRepositorio.obtenerTodosProyectosPorGradoSUp();
		int totalProyectosPorGradoSup = proyectosPorGradoSup.size();
		modelo.addAttribute("totalProyectosPorGradoSup", totalProyectosPorGradoSup);
		
		
		
		
		
		

		return "estadisticas";

	}
	
}
