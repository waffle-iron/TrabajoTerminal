package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Area;

@Repository()
@Transactional
public class HibernateAreaRepositorio implements AreaRepositorio {
	@Autowired
	private SessionFactory sf;
		@Override
	public Integer crearArea(Area area) {
		sf.getCurrentSession().save(area);
		return area.getIdArea();
	}

	@Override
	public void eliminarArea(Area area) {
		sf.getCurrentSession().delete(area);
		
	}

	@Override
	public Integer actualizarArea(Area area) {
		sf.getCurrentSession().update(area);
		return area.getIdArea();
	}

	@Override
	public Area buscarPorId(Integer id) {
		Area area = null;
		area = (Area) sf.getCurrentSession().get(Area.class, id);
		return area;
	}

	@Override
	public List<Area> obtenerTodos() {
		List<Area> areas = null;
		areas = sf.getCurrentSession().createCriteria(Area.class).list();
		return areas;
	}

}
