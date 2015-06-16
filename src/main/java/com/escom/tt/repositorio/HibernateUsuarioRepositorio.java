package com.escom.tt.repositorio;

import com.escom.tt.modelo.Usuario;

public class HibernateUsuarioRepositorio implements UsuarioRepostorio {
	
	@Override
	public Usuario buscarPorId(Usuario usr) {
		/*PROGRAMACIÓN DE HIBERNATE PARA SOLICITAR A DB*/
		
		Usuario usuario = new Usuario();
		usuario.setId(usr.getId());
		usuario.setNombre("JUAN CRISÓSTOMO");
		
		return usuario;
	}
}
