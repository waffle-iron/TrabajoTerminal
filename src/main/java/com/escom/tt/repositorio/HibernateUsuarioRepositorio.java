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
		Session sesion = sf.getCurrentSession();
		usuario = (Usuario) sesion.get(Usuario.class, id);
		sesion.flush();
		sesion.clear();
		return usuario;
	}

	@Override
	public List<Usuario> obtenerTodos() {
		List<Usuario> usuarios = null;
		usuarios = sf.getCurrentSession().createCriteria(Usuario.class).list();
		return usuarios;
	}

	@Override
	public List<Usuario> buscarPorUsuario(String cadena) {
		List<Usuario> usuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		
		criteria.add(Restrictions.or(
				Restrictions.like("email", "%"+ cadena + "%"),
				Restrictions.like("nombres", "%"+ cadena + "%"),
				Restrictions.like("aPaterno", "%"+ cadena + "%"),
				Restrictions.like("aPaterno", "%"+ cadena + "%"),
				Restrictions.like("estadoCivil", "%"+ cadena + "%"),
				Restrictions.like("telefono", "%"+ cadena + "%"),
				
				Restrictions.like("nombreUsuario", "%"+ cadena + "%")));
		usuarios =  criteria.list();
		return usuarios;
	}

}
