package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import com.escom.tt.modelo.PalabraClave;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.repositorio.Palabra_claveRepositorio;

@Controller
public class Palabra_claveControlador {
	
	@Autowired
	private Palabra_claveRepositorio palabra_claveRepositorio;

	
//http://localhost:8080/trabajoterminal/palabra_clave/crear	
	@RequestMapping(value="/palabra_clave/crear", method=RequestMethod.GET)
	public String crear(Model modelo){
		modelo.addAttribute("palabra_clave", new PalabraClave());
		return "palabra_clave-crear";
	}
	
	@RequestMapping(value="/palabraclave/guardar", method=RequestMethod.POST)
	public String guardar(@ModelAttribute("palabra_clave") @Valid PalabraClave palabra_clave, BindingResult validacion, Model modelo){
		String ruta = null;
		if (validacion.hasErrors()) {
			modelo.addAttribute("palabra_clave_error", palabra_clave);
			ruta = "palabra_clave-crear";
		} else {
			Integer id=palabra_claveRepositorio.crear(palabra_clave);
			ruta = "redirect:/palabra_clave/ver/"+palabra_clave.getIdPalabrasClave()+"?creado=true";
		}
		return ruta;
	}
	@RequestMapping(value="/palabra_clave/ver/{id:[0-9]+}")
	public String ver( @PathVariable Integer id, Model modelo, Boolean actualizado, Boolean creado){
		String ruta = null;
		PalabraClave palabra_clave = null;
		palabra_clave = palabra_claveRepositorio.buscaPorId(id);
		
		if (palabra_clave!=null) {
			modelo.addAttribute("palabra_clave", palabra_clave);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "palabra_clave-ver";
		} else {
			ruta = "redirect:/palabra_clave";
		}
		
		return ruta;
	}
	
	@RequestMapping(value="/palabra_clave")
	public String verTodos(Model modelo){
		List<PalabraClave> palabras_clave = null;
		palabras_clave = palabra_claveRepositorio.obtenerTodos();
		modelo.addAttribute("palabras_clave", palabras_clave);
		return "palabra_clave-todos";
	}
	@RequestMapping(value="/palabraclave/guardarCambios", method=RequestMethod.POST)
	public String guardarCambios(@ModelAttribute("palabra_clave") @Valid PalabraClave palabra_clave, BindingResult validacion, Model modelo){
		String ruta = null;
		if (validacion.hasErrors()) {
			modelo.addAttribute("palabra_clave", palabra_clave);
			ruta="palabra_clave-editar";
		} else {
			Integer id=palabra_claveRepositorio.actualizar(palabra_clave);
			return "redirect:/palabra_clave/ver/"+palabra_clave.getIdPalabrasClave()+"/?actualizado=true" ;
		}
		return ruta;
	}
	@RequestMapping(value="/palabra_clave/{id:[0-9]+}/editar")
	public String editar(@PathVariable Integer id , Model modelo){
		PalabraClave palabra_clave = null;
		String ruta = null;
		palabra_clave=palabra_claveRepositorio.buscaPorId(id);
		if (palabra_clave!=null) {
			modelo.addAttribute("palabra_clave", palabra_clave);
			ruta="palabra_clave-editar";
		} else {
			ruta="redirect:/palabra_clave";
		}
		return ruta;
	}
	
	@RequestMapping(value="/palabra_clave/eliminar/{Id:[0-9]+}")
	public String eliminar(@PathVariable Integer Id, Model modelo) {

		palabra_claveRepositorio.eliminar(palabra_claveRepositorio.buscaPorId(Id));
		modelo.addAttribute("mensaje", "Se ha eliminado la palabra clave");
		
		return "palabra_clave-eliminar";
	}

}
