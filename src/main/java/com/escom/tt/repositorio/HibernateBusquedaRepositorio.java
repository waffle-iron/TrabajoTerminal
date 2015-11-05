package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;

@Repository
@Transactional
public class HibernateBusquedaRepositorio implements BusquedaRepositorio {

	@Autowired
	SessionFactory sf;

	@Override
	public List<Proyecto>  buscarPorProyectoORNombreUsuario(String proyectoUsuario) {
		List<Proyecto> proyectos = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Proyecto.class);
		criteria.add(Restrictions.or(
				Restrictions.like("nombre", proyectoUsuario),
				Restrictions.like("descripcion", proyectoUsuario)));
		proyectos = criteria.list();
		return proyectos;
	}
	/*
	@Override
	public List<Proyecto> buscarPorProyectoORNombreUsuarioLista(String proyectoUsuario) {
		//Proyecto proyecto = null;
		List<Proyecto> lista = null;
		Session session = sf.getCurrentSession();
		Usuario usuario = null;
		Criteria criteria1 = session.createCriteria(Usuario.class).add(
				Restrictions.like("nombres", proyectoUsuario)); 
		usuario = (Usuario) criteria1.uniqueResult();

		Criteria criteria2 = session.createCriteria(Proyecto.class);
		criteria2.add(Restrictions.or(
				Restrictions.like("nombre", proyectoUsuario),
				Restrictions.like("coordinador.nombres", usuario.getNombres())));
		lista = (List<Proyecto>)criteria2.list();
		return lista;
	}

	@Override
	public List<Proyecto> buscarCadenaEnProyectos(String cadena) {									
		Session session = sf.getCurrentSession();		
		List<Proyecto> listaProyectos = null;
		Criteria criteria2 = session.createCriteria(Proyecto.class).add(Restrictions.like("nombre", cadena));
		listaProyectos = criteria2.list();
		//boolean op2 = listaProyectos.contains(cadena);		
		return listaProyectos;													
	}
	*/
	@Override
	public List<Usuario> buscarCadenaEnusuario(String cadena) {
		List<Usuario> listaUsuarios = null;
		Session session = sf.getCurrentSession();
		Criteria criteria1 = session.createCriteria(Usuario.class).add(Restrictions.like("nombreUsuario", cadena));
		listaUsuarios=criteria1.list();
		//boolean op1 = listaUsuarios.contains(cadena);			
		return listaUsuarios;
	}

	

	@Override
	public List<Proyecto> buscarPorCoordinador(Usuario coordinador) {

		List<Proyecto> proyectos = null;
		Session session = sf.getCurrentSession();

		Criteria criteria = session.createCriteria(Proyecto.class);
		criteria.add(Restrictions.eq("coordinador", coordinador));
		proyectos = criteria.list();
		System.out.println("termino consulta de proyectos");
		return proyectos;

	}

	@Override
	public Usuario buscarPorEmail(String proyectoUsuario) {
		Session session = sf.getCurrentSession();
		Usuario usuario = null;
		Criteria criteria1 = session.createCriteria(Usuario.class).add(
				Restrictions.eq("email", proyectoUsuario));
		usuario = (Usuario) criteria1.uniqueResult();

		return usuario;
	}


}
