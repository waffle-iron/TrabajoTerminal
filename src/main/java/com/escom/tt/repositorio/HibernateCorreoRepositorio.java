package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Correo;
import com.escom.tt.modelo.Escuela;
@Repository()
@Transactional
public class HibernateCorreoRepositorio implements CorreoRepositorio {
	

	@Autowired
	private SessionFactory sf;

	@Override
	public Integer crearCorreo(Correo correo) {
		sf.getCurrentSession().save(correo);
		return correo.getIdCorreo();
	}

	@Override
	public void eliminarCorreo(Correo correo) {
		sf.getCurrentSession().delete(correo);
		
	}

	@Override
	public Integer actualizarCorreo(Correo correo) {
		sf.getCurrentSession().update(correo);
		return correo.getIdCorreo();
	}

	@Override
	public Correo buscarPorId(Integer id) {
		Correo correo = null;
		correo =(Correo) sf.getCurrentSession().get(Correo.class, id);
		return correo;
	}

	@Override
	public List<Correo> obtenerTodos() {
		List<Correo> correos = null;
		correos = sf.getCurrentSession().createCriteria(Correo.class).list();
		return correos;
	}
	



}
