package com.escom.tt.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escom.tt.modelo.Idioma;
import com.escom.tt.repositorio.IdiomaRepositorio;

@Controller
public class IdiomaControlador {
	
	@Autowired
	private IdiomaRepositorio idiomaRepositorio;
	
	@RequestMapping(value="/idioma/crear")
	public String crear(Model modelo){
		idiomaRepositorio.crearIdioma(new Idioma());
		return "idioma-crear";
	}

}
