package com.escom.tt.controlador;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.escom.tt.modelo.Usuario;
import com.escom.tt.servicio.UsuarioServicioImpl;
import com.escom.tt.servicio.UsuarioServicio;

@Controller
public class UsuarioControlador {

	private UsuarioServicio usrSer = new UsuarioServicioImpl();
	
	@RequestMapping(value = "/")
	public String home(){
		return "home";
	}
	@RequestMapping(value = "/base")
	public String base(){
		return "base";
	}
	
	@RequestMapping(value = "/usuario/{id:[0-9]+}")
	public String perfil(@PathVariable("id") Integer usuarioId, Model modelo){
		
		Usuario usr = new Usuario();
		usr.setId(usuarioId);
		
		Usuario usurio2 = usrSer.buscarPorId(usr);
		Usuario usurio3 = new Usuario();
		
		usurio3.setNombre("YAIR");
		
		modelo.addAttribute("abc", usurio2);
		modelo.addAttribute("otro", usurio3);
		
		return "perfil";
	}
}
