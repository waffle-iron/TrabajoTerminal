package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Estado;

@Repository
@Transactional
public class HibernateEstadoRepositorio implements EstadoRepositorio {
	
	@Autowired
	private SessionFactory sf;
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.EstadoRepositorio#crearEstado(com.escom.tt.modelo.Estado)
	 */
	@Override
	public Integer crearEstado(Estado estado){
		sf.getCurrentSession().save(estado);
		return estado.getIdEstado();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.EstadoRepositorio#eliminarEstado(com.escom.tt.modelo.Estado)
	 */
	@Override
	public void eliminarEstado(Estado estado){
		sf.getCurrentSession().delete(estado);		
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.EstadoRepositorio#actualizarEstado(com.escom.tt.modelo.Estado)
	 */
	@Override
	public Integer actualizarEstado(Estado estado){
		sf.getCurrentSession().update(estado);
		return estado.getIdEstado();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.EstadoRepositorio#buscaPorId(java.lang.Integer)
	 */
	@Override
	public Estado buscaPorId(Integer id){
		Estado estado = null;
		estado=(Estado)sf.getCurrentSession().get(Estado.class, id);
		return estado;
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.EstadoRepositorio#obtenerTodos()
	 */
	@Override
	public List<Estado> obtenerTodos(){
		List<Estado> estados = null;
		estados=sf.getCurrentSession().createCriteria(Estado.class).list();
		return estados; 
	}
}