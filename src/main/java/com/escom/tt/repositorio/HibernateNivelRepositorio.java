package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;


import com.escom.tt.modelo.Nivel;

@Repository()
@Transactional
public class HibernateNivelRepositorio implements NivelRepositorio{

	@Autowired
	private SessionFactory sf;
	
	@Override
	public Integer crearNivel(Nivel nivel){
		sf.getCurrentSession().save(nivel);
		return nivel.getIdNivel();
	}
	
	@Override
	public void eliminarNivel(Nivel nivel){
		sf.getCurrentSession().delete(nivel);
	}

	@Override
	public Integer actualizarNivel(Nivel nivel){
		sf.getCurrentSession().update(nivel);
		return nivel.getIdNivel();
	}
	
	@Override
	public Nivel buscarPorId(Integer id){
		Nivel nivel = null;
		nivel = (Nivel)sf.getCurrentSession().get(Nivel.class, id);
		return nivel;
	}
	
	@Override
	public List<Nivel> obtenerTodos(){
		List<Nivel> niveles = null;
		niveles = sf.getCurrentSession().createCriteria(Nivel.class).list();
		return niveles;
	}
	
	
	
}
