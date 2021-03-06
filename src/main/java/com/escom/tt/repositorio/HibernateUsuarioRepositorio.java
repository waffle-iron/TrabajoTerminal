package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Grado;
import com.escom.tt.modelo.Idioma;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Escuela;
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
	public Usuario buscarPorCorreoORNombreUsuario(String correoUsuario) {
		Usuario usuario = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		// SE APLICA LA CONDICIÓN OR, SI ES IGUAL AL EMAIL O NOMBRE DE USUARIO
		criteria.add(Restrictions.or(Restrictions.eq("email", correoUsuario), Restrictions.eq("nombreUsuario", correoUsuario)));
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
	@Override
	public List<Usuario> usuarioPorEscuela(int idEscuela) {
		List<Usuario> usuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("escuela.id", idEscuela));
		usuarios = (List<Usuario>)criteria.list();		
		return usuarios;
	}
	@Override
	public List<Usuario> usuarioPorGrado(int idGrado) {
		List<Usuario> usuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.eq("grado.idGrado", idGrado));
		criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		usuarios = criteria.list();		
		return usuarios;
	}

	@Override
	public List<Usuario> obtenerPorRelacionEscuela(Escuela escuela, String email){
		List<Usuario> usuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.and(
				Restrictions.eq("escuela", escuela),
				Restrictions.not(Restrictions.eq("email", email))
				));
		usuarios = criteria.list();
		return usuarios;
	}
	@Override
	public List<Usuario> obtenerPorRelacionGradoAcademico(Grado grado, String email){
		List<Usuario> usuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.and(
				Restrictions.eq("grado", grado),
				Restrictions.not(Restrictions.eq("email", email))
		));
		usuarios = criteria.list();
		return usuarios;
	}
	@Override
	public List<Usuario> obtenerPorRelacionIdioma(Idioma idioma, String email){
		List<Usuario> usuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Usuario.class);
		criteria.add(Restrictions.and(
				Restrictions.eq("idiomas", idioma),
				Restrictions.not(Restrictions.eq("email", email))
		));
		usuarios = criteria.list();
		return usuarios;
	}
	//List<Idioma> idiomas
}
