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
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.ProyectoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

@Controller
public class BusquedaControlador {

	@Autowired
	UsuarioRepositorio usuarioRepositorio;
	@Autowired
	private ProyectoRepositorio proyectoRepositorio;

	@RequestMapping(value = "/busqueda/bus", method = RequestMethod.GET)
	public String resultadoBusqueda(
			@ModelAttribute("cadena") @Valid CadenaBusqueda cadenaBusqueda,
			@ModelAttribute("cadena2") @Valid CadenaBusqueda cadenaBusqueda2,
			BindingResult validacion, Model modelo, Principal principal) {
		// String nombreUsuario=principal.getName();
		Proyecto proyecto = null;
		String ruta = null;

		if (validacion.hasErrors()) {
			ruta = "ResultadosBusqueda";
		} else {
			

		}
		

		ruta = "ResultadosBusqueda";

		return ruta;

	}
	
	@RequestMapping(value="/buscar", method = RequestMethod.GET)
    public String buscar(@RequestParam(required = false) String cadena, Model modelo, Principal principal) {
		
		
		return "resultados-busqueda";
	}
	@RequestMapping(value="/buscar/noEncontrado", method = RequestMethod.GET)
    public String buscarNoEncontrado(@RequestParam(required = false) String cadena, Model modelo) {
		List<Proyecto> proyectos = null;
		List<Usuario> usuarios = null;
		String cadenaNoEncontrada = null;
		proyectos=proyectoRepositorio.buscarPorProyecto(cadena);
		usuarios=usuarioRepositorio.buscarPorUsuario(cadena);
		
		if(cadena != null){
				modelo.addAttribute("proyectos", proyectos);
				if (proyectos!=null) {
					System.out.println("*********************proyectos no es nulo");
				}
				modelo.addAttribute("usuarios",usuarios);
				if (usuarios!=null) {
					System.out.println("*********************usuarios no es nulo");
				}
		}
		if(proyectos.size()==0 && usuarios.size()==0){
			System.out.println("entrooo");
			cadenaNoEncontrada = "No se encontro";
			modelo.addAttribute("cadenaNoEncontrada",cadenaNoEncontrada);
			
		}
		
		return "resultados-busqueda";
	}
	
	
	
}
