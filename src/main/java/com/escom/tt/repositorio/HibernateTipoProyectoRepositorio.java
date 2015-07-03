package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.escom.tt.modelo.TipoProyecto;

public class HibernateTipoProyectoRepositorio implements  TipoProyectoRepositorio{
 
	@Autowired
	private SessionFactory sf; 
	public List<TipoProyecto> obtenerTodos(){
	 List<TipoProyecto> proyectos = null;
	 Criteria criteria =  sf.getCurrentSession().createCriteria(TipoProyecto.class);
	  proyectos = criteria.list();
	 
	 return proyectos;
 }
}
