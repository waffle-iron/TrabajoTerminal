package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Escuela;

@Repository
@Transactional
public class HibernateEscuelaRepositorio implements EscuelaRepositorio{

	@Autowired
	private SessionFactory sf;
	
	@Override
	public Integer crearEscuela(Escuela escuela) {
		sf.getCurrentSession().save(escuela);
		return escuela.getId();
	}

	@Override
	public void eliminarEscuela(Escuela escuela) {
		sf.getCurrentSession().delete(escuela);
	}

	@Override
	public Integer actualizarEscuela(Escuela escuela) {
		sf.getCurrentSession().update(escuela);
		return escuela.getId();
	}		

	@Override
	public Escuela buscarPorId(Integer id) {
		Escuela escuela = null;
		escuela = (Escuela) sf.getCurrentSession().get(Escuela.class, id);
		return escuela;
	}

	@Override
	public List<Escuela> obtenerTodos() {
		List<Escuela> escuelas=null;
		escuelas = sf.getCurrentSession().createCriteria(Escuela.class).list();
		return escuelas;
	}

}
