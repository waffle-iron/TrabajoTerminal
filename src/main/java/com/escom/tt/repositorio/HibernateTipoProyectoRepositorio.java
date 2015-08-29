package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.escom.tt.modelo.Tipo_proyecto;

@Repository()
@Transactional
public class HibernateTipoProyectoRepositorio implements TipoProyectoRepositorio{
	
	@Autowired
	private SessionFactory sf;
	
	@Override
	public Integer crearTipoProyecto(Tipo_proyecto tipoProyecto) {
		sf.getCurrentSession().save(tipoProyecto);
		return tipoProyecto.getIdTipoProyecto();
	}

	@Override
	public void eliminarTipoProyecto(Tipo_proyecto tipoProyecto) {
		sf.getCurrentSession().delete(tipoProyecto);
		
	}

	@Override
	public Integer actualizarTipoProyecto(Tipo_proyecto tipoProyecto) {
		sf.getCurrentSession().update(tipoProyecto);
		return tipoProyecto.getIdTipoProyecto();
	}
	
	@Override
	public Tipo_proyecto buscarPorId(Integer id) {
		Tipo_proyecto tipoProyecto = null; 
		tipoProyecto = (Tipo_proyecto)sf.getCurrentSession().get(Tipo_proyecto.class, id);
		return tipoProyecto;
	}

	@Override
	public List<Tipo_proyecto> obtenerTodos() {
		List<Tipo_proyecto> tiposProyectos = null;
		tiposProyectos = sf.getCurrentSession().createCriteria(Tipo_proyecto.class).list();
		return tiposProyectos;
	}


	

}
