package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.escom.tt.modelo.TipoProyecto;

@Repository()
@Transactional
public class HibernateTipoProyectoRepositorio implements TipoProyectoRepositorio{
	
	@Autowired
	private SessionFactory sf;
	
	@Override
	public Integer crearTipoProyecto(TipoProyecto tipoProyecto) {
		sf.getCurrentSession().save(tipoProyecto);
		return tipoProyecto.getIdTipoProyecto();
	}

	@Override
	public void eliminarTipoProyecto(TipoProyecto tipoProyecto) {
		sf.getCurrentSession().delete(tipoProyecto);
		
	}

	@Override
	public Integer actualizarTipoProyecto(TipoProyecto tipoProyecto) {
		sf.getCurrentSession().update(tipoProyecto);
		return tipoProyecto.getIdTipoProyecto();
	}
	
	@Override
	public TipoProyecto buscarPorId(Integer id) {
		TipoProyecto tipoProyecto = null;
		tipoProyecto = (TipoProyecto)sf.getCurrentSession().get(TipoProyecto.class, id);
		return tipoProyecto;
	}

	@Override
	public List<TipoProyecto> obtenerTodos() {
		List<TipoProyecto> tiposProyectos = null;
		tiposProyectos = sf.getCurrentSession().createCriteria(TipoProyecto.class).list();
		return tiposProyectos;
	}


	

}
