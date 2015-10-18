package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Usuario;


@Repository
@Transactional
public class HibernateUsuarioRepositorio implements UsuarioRepositorio {

	@Autowired
	private SessionFactory sf;
	
	@Override
	public Integer crearUsuario(Usuario usuario) {
		sf.getCurrentSession().save(usuario);
		return usuario.getIdUsuarios();
	}
	@Override
	public Usuario buscarPorCorreo(String correo) {
		Usuario usuario = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class).add(Restrictions.eq("email", correo));
		usuario = (Usuario)criteria.uniqueResult();
		return usuario;
	}
	@Override
	public void eliminarUsuario(Usuario usuario) {
		sf.getCurrentSession().delete(usuario);
		
	}
	@Override
	public Integer actualizarUsuario(Usuario usuario) {
		sf.getCurrentSession().update(usuario);
		return usuario.getIdUsuarios();
	}		
	@Override
	public Usuario buscarPorId(Integer id) {
		Usuario usuario = null;
		usuario = (Usuario) sf.getCurrentSession().get(Usuario.class, id);
		return usuario;
	}
	
	@Override
	public List<Usuario> obtenerTodos() {
		List<Usuario> usuarios=null;
		usuarios = sf.getCurrentSession().createCriteria(Usuario.class).list();
		return usuarios;
	}
	
		

	


}
