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

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.CadenaBusqueda;
import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Grado;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.AreaRepositorio;
import com.escom.tt.repositorio.EscuelaRepositorio;
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
	@Autowired		
	EscuelaRepositorio escuelaRepositorio;
	@Autowired			
	AreaRepositorio areaRepositorio;
	
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
		
//		List<Grado> listaGradoAcadMS = null;
//		listaGradoAcadMS = gradoRepositorio.buscaGradoAcademico("Medio Superior");
//		int totalUsuariosMedioSuperior = listaGradoAcadMS .size();
//		System.out.println("----------"+totalUsuariosMedioSuperior );
//		modelo.addAttribute("totalUsuariosMedioSuperior", totalUsuariosMedioSuperior);		
//		List<Grado> listaGradoAcadS = null;
//		listaGradoAcadS = gradoRepositorio.buscaGradoAcademico("Superior");
//		int totalUsuariosSuperior = listaGradoAcadS .size();
//		System.out.println("----------"+totalUsuariosSuperior);
//		modelo.addAttribute("totalUsuariosSuperior", totalUsuariosSuperior);
//		
		List<Proyecto> proyectosPorGradoMedSup = null;
		proyectosPorGradoMedSup = proyectoRepositorio.obtenerTodosProyectosPorGradoMedSUp();
		int totalProyectosPorGradoMedSup = proyectosPorGradoMedSup.size();
		modelo.addAttribute("totalProyectosPorGradoMedSup", totalProyectosPorGradoMedSup);
		
		List<Proyecto> proyectosPorGradoSup = null;
		proyectosPorGradoSup = proyectoRepositorio.obtenerTodosProyectosPorGradoSUp();
		int totalProyectosPorGradoSup = proyectosPorGradoSup.size();
		modelo.addAttribute("totalProyectosPorGradoSup", totalProyectosPorGradoSup);
		
		List<Usuario> usuariosPorGrado = null;
		usuariosPorGrado = usuarioRepositorio.usuarioPorGrado(1);
		int totalUsuGrado1 = usuariosPorGrado.size();
		modelo.addAttribute("totalUsuGrado1", totalUsuGrado1);		
		List<Usuario> usuariosPorGrado2 = null;
		usuariosPorGrado2 = usuarioRepositorio.usuarioPorGrado(2);
		int totalUsuGrado2 = usuariosPorGrado2.size();
		modelo.addAttribute("totalUsuGrado2", totalUsuGrado2);		
		List<Usuario> usuariosPorGrado3 = null;
		usuariosPorGrado3 = usuarioRepositorio.usuarioPorGrado(3);
		int totalUsuGrado3 = usuariosPorGrado3.size();
		modelo.addAttribute("totalUsuGrado3", totalUsuGrado3);
		
		
		
		List<Usuario> usuariosEscId1 = null;
		usuariosEscId1  = usuarioRepositorio.usuarioPorEscuela(1);
		int totalUsuEsc1 = usuariosEscId1.size();
		System.out.println();
		modelo.addAttribute("totalUsuEsc1", totalUsuEsc1);		
		List<Usuario> usuariosEsc2 = null;
		usuariosEsc2  = usuarioRepositorio.usuarioPorEscuela(2);
		int totalUsuEsc2 = usuariosEsc2.size();
		modelo.addAttribute("totalUsuEsc2", totalUsuEsc2);		
		List<Usuario> usuariosEsc3 = null;
		usuariosEsc2  = usuarioRepositorio.usuarioPorEscuela(3);
		int totalUsuEsc3 = usuariosEsc2.size();
		modelo.addAttribute("totalUsuEsc3", totalUsuEsc3);
		
		List<Proyecto> proyectosPorArea = null;		
		proyectosPorArea = proyectoRepositorio.obtenerProyectosPorArea(1);		
		int proyectosArea1 = proyectosPorArea.size();
		modelo.addAttribute("proyectosArea1", proyectosArea1);
		List<Proyecto> proyectosPorArea2 = null;		
		proyectosPorArea2 = proyectoRepositorio.obtenerProyectosPorArea(2);		
		int proyectosArea2 = proyectosPorArea2.size();
		modelo.addAttribute("proyectosArea2", proyectosArea2);
		List<Proyecto> proyectosPorArea3 = null;		
		proyectosPorArea3 = proyectoRepositorio.obtenerProyectosPorArea(3);		
		int proyectosArea3 = proyectosPorArea3.size();
		modelo.addAttribute("proyectosArea3", proyectosArea3);
		
		
		return "estadisticas";

	}
	
}
