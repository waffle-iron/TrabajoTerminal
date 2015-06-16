package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Area;

@Repository
@Transactional
public class HibernateAreaRepositirio implements AreaRepositorio {
	
	
	
	@Autowired
	private SessionFactory sf;
	
	@Override
	public List<Area> buscarTodas(){
		List<Area> areas = null;
		
		Criteria criteria = sf.getCurrentSession().createCriteria(Area.class);
		areas = criteria.list();
		
		return areas;
	}
}
