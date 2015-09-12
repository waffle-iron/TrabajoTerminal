package com.escom.tt.controlador;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Nivel;
import com.escom.tt.repositorio.EscuelaRepositorio;
import com.escom.tt.repositorio.GradoRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;



@Controller
public class UsuarioControlador {

	@Autowired
	private UsuarioRepositorio usuarioRepositorio;

	@Autowired
	private EscuelaRepositorio escuelaRepositorio;

	@Autowired
	private GradoRepositorio gradoRepositorio;

	
	
}
