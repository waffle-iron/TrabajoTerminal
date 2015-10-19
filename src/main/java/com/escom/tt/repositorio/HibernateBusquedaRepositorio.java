package com.escom.tt.repositorio;

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
public class HibernateBusquedaRepositorio implements BusquedaRepositorio    {

	@Autowired
	SessionFactory sf;
	
	@Override
	public Proyecto buscarPorProyectoORNombreUsuario(String proyectoUsuario) {
		Proyecto proyecto = null;
		Session session = sf.getCurrentSession();
		Usuario usuario = null;
		Criteria criteria1 = session.createCriteria(Usuario.class).add(Restrictions.eq("nombres", proyectoUsuario));
		usuario = (Usuario)criteria1.uniqueResult();
		
		Criteria criteria2 = session.createCriteria(Proyecto.class);		
		criteria2.add(Restrictions.or(Restrictions.eq("nombre",proyectoUsuario),Restrictions.eq("coordinador",usuario)));
		proyecto = (Proyecto)criteria2.uniqueResult();
		return proyecto;		
	}

	
}
