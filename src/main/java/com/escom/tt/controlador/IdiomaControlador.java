package com.escom.tt.controlador;

import java.util.List;
import javax.validation.Valid;
import com.escom.tt.repositorio.IdiomaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.escom.tt.modelo.Idioma;


@Controller
public class IdiomaControlador {
	
	@Autowired
	private IdiomaRepositorio idiomaRepositorio;
	
//http://localhost:8080/trabajoterminal/idioma/crear
	@RequestMapping(value="/idioma/crear", method = RequestMethod.GET)
	public String crear(Model modelo) {
		modelo.addAttribute("idioma", new Idioma());
		return "idioma-crear";
	}
//http://localhost:8080/trabajoterminal/idioma/guardar
	@RequestMapping(value="/idioma/guardar", method = RequestMethod.POST)
	public String guardar(@ModelAttribute("idioma") @Valid Idioma idioma, BindingResult validacion, Model modelo) {
		String ruta = null;
		
		if (validacion.hasErrors()){
			modelo.addAttribute("idioma", idioma);
			ruta = "idioma-crear";
		}else{
			Integer id = idiomaRepositorio.crearIdioma(idioma);
			ruta = "redirect:/idioma/ver/" + idioma.getIdIdioma()+ "/?creado=true";
		}
		return ruta;
	}
//http://localhost:8080/trabajoterminal/idioma/guardarCambios
	
	@RequestMapping(value="/idioma/guardarCambios", method = RequestMethod.POST)
	public String guardarCambios(@ModelAttribute("idioma") @Valid Idioma idioma, BindingResult validacion, Model modelo) {
		String ruta = null;

		if (validacion.hasErrors()){
			modelo.addAttribute("idioma", idioma);
			ruta = "idioma-editar";
		}else{
			Integer id = idiomaRepositorio.actualizarIdioma(idioma);
			ruta = "redirect:/idioma/ver/" + idioma.getIdIdioma() + "/?actualizado=true";
		}
		return ruta;
	}
//http://localhost:8080/trabajoterminal/idioma/NUMERO/editar
	@RequestMapping(value="/idioma/{idiomaId:[0-9]+}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable Integer idiomaId,Model modelo) {
		Idioma idioma = null;
		String ruta = null;
		idioma = idiomaRepositorio.buscarPorId(idiomaId);

		if (idioma != null) {
			modelo.addAttribute("idioma", idioma);
			ruta = "idioma-editar";
		}
		else
			ruta = "redirect:/idioma";

		return ruta;
	}
//http://localhost:8080/trabajoterminal/idioma/ver/NUMERO
	@RequestMapping(value="/idioma/ver/{idiomaId:[0-9]+}")
	public String ver(@PathVariable Integer idiomaId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Idioma idioma = null;

		idioma = idiomaRepositorio.buscarPorId(idiomaId);
		if (idioma != null) {
			modelo.addAttribute("idioma", idioma);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "idioma-ver";
		}else
			ruta = "redirect:/idioma";

		return ruta;
	}
//http://localhost:8080/trabajoterminal/idioma/eliminar/idioma
	@RequestMapping(value="/idioma/eliminar/{idiomaId:[0-9]+}")
	public String eliminar(@PathVariable Integer idiomaId, Model modelo) {

		idiomaRepositorio.eliminarIdioma(idiomaRepositorio.buscarPorId(idiomaId));
		modelo.addAttribute("mensaje", "Se ha eliminado el idioma");
		return "idioma-eliminar";
	}
//http://localhost:8080/trabajoterminal/idioma/
	@RequestMapping(value="/idioma")
	public String verTodos(Model modelo) {

		List<Idioma> idiomaList = null;

		idiomaList = idiomaRepositorio.obtenerTodos();

		modelo.addAttribute("idiomas", idiomaList);

		return "idioma-todos";
	}
}
