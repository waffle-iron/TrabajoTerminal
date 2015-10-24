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
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.BusquedaRepositorio;
import com.escom.tt.repositorio.ProyectoRepositorio;


@Controller
public class BusquedaControlador {
	
	@Autowired
	BusquedaRepositorio busquedaRepositorio;
	@Autowired
    private ProyectoRepositorio proyectoRepositorio;

	
	

	@RequestMapping(value = "/busqueda/bus", method=RequestMethod.GET)
	public String resultadoBusqueda(@ModelAttribute("cadena") @Valid CadenaBusqueda cadenaBusqueda, @ModelAttribute("cadena2") @Valid CadenaBusqueda cadenaBusqueda2,BindingResult validacion, Model modelo, Principal principal){
		//String nombreUsuario=principal.getName();
		Proyecto proyecto = null;
        String ruta = null;

        if (validacion.hasErrors()){
            ruta = "ResultadosBusqueda";
        }else {
        	
        	String cadenaObtenida=cadenaBusqueda.getCadenaBuscada();
        	System.out.println("********************************"+cadenaObtenida);
        	proyecto = busquedaRepositorio.buscarPorProyectoORNombreUsuario(cadenaObtenida);
        	modelo.addAttribute("proyecto",proyecto);            
       
        	
        	String cadenaObtenida2= cadenaBusqueda2.getCadenaBuscada2();
        	System.out.println("********************************"+cadenaObtenida2);
        	List<Proyecto> proyectoListCad2 = null;
        	proyectoListCad2 = busquedaRepositorio.buscarCadenaEnProyectos(cadenaObtenida2);
        	modelo.addAttribute("listaObt",proyectoListCad2);
        	for (Proyecto proyecto2 : proyectoListCad2) {
				System.out.println("*?*?*?*?*?"+proyecto2);
			}
			
      
        	List<Proyecto> proyectoList = null;    	
            proyectoList = proyectoRepositorio.obtenerTodos();
            modelo.addAttribute("proyectosList", proyectoList);                

        	
        }
            //List<Usuario> usuarioListCad2=busquedaRepositorio.buscarCadenaEnusuario(cadenaObtenida2);
            //if (proyectoListCad2.contains(cadenaObtenida2)) {
			//}else if(usuarioListCad2.contains(cadenaObtenida2)){
//				modelo.addAttribute("listaObt",usuarioListCad2);
//			}
          
            ruta = "ResultadosBusqueda";
        
        return ruta;			
		
	}

	
	
	}
