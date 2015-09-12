package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Usuario;


@Repository
@Transactional
public class HibernateUsuarioRepositorio implements UsuarioRepositorio {

	private SessionFactory sf;
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.UsuarioRepositorio#crearUsuario(com.escom.tt.modelo.Usuario)
	 */
	@Override
	public Integer crearUsuario(Usuario usuario) {
		sf.getCurrentSession().save(usuario);
		return null; 
	}
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.UsuarioRepositorio#eliminarUsuario(com.escom.tt.modelo.Usuario)
	 */
	@Override
	public void eliminarUsuario(Usuario usuario) {
		sf.getCurrentSession().delete(usuario);
		
	}
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.UsuarioRepositorio#actualizarUsuario(com.escom.tt.modelo.Usuario)
	 */
	@Override
	public Integer actualizarUsuario(Usuario usuario) {
		sf.getCurrentSession().update(usuario);
		return null;
	}		
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.UsuarioRepositorio#buscarPorId(java.lang.Integer)
	 */
	@Override
	public Usuario buscarPorId(Integer id) {
		Usuario usuario = null;
		usuario = (Usuario) sf.getCurrentSession().get(Usuario.class, id);
		return null;
	}
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.UsuarioRepositorio#obtenerTodos()
	 */
	@Override
	public List<Usuario> obtenerTodos() {
		List<Usuario> usuarios=null;
		usuarios = sf.getCurrentSession().createCriteria(Usuario.class).list();
		return null;
	}

	


}
