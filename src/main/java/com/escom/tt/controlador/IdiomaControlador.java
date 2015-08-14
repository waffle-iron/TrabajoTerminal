package com.escom.tt.controlador;

import com.escom.tt.repositorio.IdiomaRepositorio;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escom.tt.modelo.Idioma;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class IdiomaControlador {
	
	@Autowired
	private IdiomaRepositorio idiomaRepositorio;
	
	@RequestMapping(value="/idioma/crear")
	public String crear(@RequestParam(value = "nombre", required = true) String nombre,
						Model modelo) {

		if (nombre != null){
			Idioma idioma = new Idioma();

			idioma.setNombre(nombre);

			idiomaRepositorio.crearIdioma(idioma);

			modelo.addAttribute("mensanje","Se ha creado un nuevo idioma con el nombre: " + nombre);
		}else{
			modelo.addAttribute("mensanje","No se puede agregar, debes ingresar el nombre, ejemplo:  ?nombre=INGLÉS");
		}

		return "idioma-crear";
	}

	@RequestMapping(value="/idioma/ver/{idiomaId:[0-9]+}")
	public String ver(@PathVariable Integer idiomaId, Model modelo) {

		Idioma idioma = null;

		idioma = idiomaRepositorio.buscarPorId(idiomaId);

		modelo.addAttribute("idioma", idioma);

		return "idioma-ver";
	}

	@RequestMapping(value="/idioma/eliminar/{idiomaId:[0-9]+}")
	public String eliminar(@PathVariable Integer idiomaId, Model modelo) {

		idiomaRepositorio.eliminarIdioma(idiomaRepositorio.buscarPorId(idiomaId));

		modelo.addAttribute("mensaje", "Se ha eliminado el idioma");

		return "idioma-eliminar";
	}

	@RequestMapping(value="/idioma")
	public String verTodos(Model modelo) {

		List<Idioma> idiomaList = null;

		idiomaList = idiomaRepositorio.obtenerTodos();

		modelo.addAttribute("idiomas", idiomaList);

		return "idioma-todos";
	}

}
