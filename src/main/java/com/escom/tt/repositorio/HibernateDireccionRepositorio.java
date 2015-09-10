package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.Direccion;

@Repository
@Transactional
public class HibernateDireccionRepositorio implements DireccionRepositorio{

	@Autowired
	private SessionFactory sf;
	
	@Override
	public Integer crearDireccion(Direccion direccion) {
		sf.getCurrentSession().save(direccion);
		return direccion.getId();
	}

	@Override
	public void eliminarDireccion(Direccion direccion) {
		sf.getCurrentSession().delete(direccion);
		
	}

	@Override
	public Integer actualizarDireccion(Direccion direccion) {
		sf.getCurrentSession().update(direccion);
		return direccion.getId();
	}

	@Override
	public Direccion buscarPorId(Integer id) {
		Direccion direccion = null;
		direccion = (Direccion)	sf.getCurrentSession().get(Direccion.class, id);
		return direccion;
	}

	@Override
	public List<Direccion> obtenerTodos() {
		List<Direccion> direcciones = null;
		direcciones = sf.getCurrentSession().createCriteria(Direccion.class).list();
				
		return direcciones;
	}

}
