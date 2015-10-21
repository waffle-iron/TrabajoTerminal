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
import org.springframework.web.context.request.RequestContextHolder;

import com.escom.tt.modelo.CadenaBusqueda;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.repositorio.BusquedaRepositorio;
import com.escom.tt.repositorio.ProyectoRepositorio;


@Controller
public class BusquedaControlador {
	
	@Autowired
	BusquedaRepositorio busquedaRepositorio;
	@Autowired
    private ProyectoRepositorio proyectoRepositorio;

	
	
//	@RequestMapping(value = "/busqueda/bus", method=RequestMethod.GET)
//	public String Busqueda(Model modelo){
//        List<Proyecto> proyectoList = null;
//        proyectoList = proyectoRepositorio.obtenerTodos();
//
//        modelo.addAttribute("proyectosList", proyectoList);                
//		return "ResultadosBusqueda";			
//	}
	@RequestMapping(value = "/busqueda/bus", method=RequestMethod.GET)
	public String resultadoBusqueda(@ModelAttribute("cadena") @Valid CadenaBusqueda cadenaBusqueda, BindingResult validacion, Model modelo, Principal principal){
		String nombreUsuario=principal.getName();
		Proyecto proyecto = null;
        String ruta = null;

        if (validacion.hasErrors()){
        	//modelo.addAttribute("error", "No fue encontrado");
            ruta = "ResultadosBusqueda";
        }else{
        	String cadenaObtenida=cadenaBusqueda.getCadenaBuscada();    		
            proyecto = busquedaRepositorio.buscarPorProyectoORNombreUsuario(cadenaObtenida);            
            modelo.addAttribute("proyecto",proyecto);
            List<Proyecto> proyectoList = null;
            proyectoList = proyectoRepositorio.obtenerTodos();

          modelo.addAttribute("proyectosList", proyectoList);                
          
            ruta = "ResultadosBusqueda";
        }
        return ruta;			
		
	}

	
	
	}
