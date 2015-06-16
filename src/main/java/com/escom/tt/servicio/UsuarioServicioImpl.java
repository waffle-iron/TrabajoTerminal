package com.escom.tt.servicio;

import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.HibernateUsuarioRepositorio;
import com.escom.tt.repositorio.UsuarioRepostorio;


public class UsuarioServicioImpl implements UsuarioServicio {
	
	private UsuarioRepostorio usrRepo = new HibernateUsuarioRepositorio();
	
	@Override
	public Usuario buscarPorId(Usuario usr) {
		
		Usuario usuario = usrRepo.buscarPorId(usr);
		
		return usuario;
	}
}
