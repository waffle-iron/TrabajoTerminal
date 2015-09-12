package com.escom.tt.repositorio;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.escom.tt.modelo.Grado;

@Repository() // lo mandas al contenedor de spring y lo haces un bean 
@Transactional // para transaccion declarativa , podemos utilizar las transacciones para abrir y cerrar seciones
public class HibernateGradoRepositorio implements GradoRepositorio {

	@Autowired
	private SessionFactory sf;

	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.GradoRepositorio#crearGrado(com.escom.tt.modelo.Grado)
	 */
	@Override
	public Integer crearGrado(Grado grado){
		sf.getCurrentSession().save(grado);
		return grado.getIdGrado();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.GradoRepositorio#eliminarGrado(com.escom.tt.modelo.Grado)
	 */
	@Override
	public void eliminarGrado(Grado grado){
		sf.getCurrentSession().delete(grado);
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.GradoRepositorio#actualizarGrado(com.escom.tt.modelo.Grado)
	 */
	@Override
	public Integer actualizarGrado(Grado grado){
		sf.getCurrentSession().update(grado);
		return grado.getIdGrado();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.GradoRepositorio#buscarPorId(java.lang.Integer)
	 */
	@Override
	public Grado buscarPorId(Integer id){
		Grado grado = null;
		grado = (Grado)sf.getCurrentSession().get(Grado.class,id);
		return grado;
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.GradoRepositorio#obtenerTodos()
	 */
	@Override
	public List<Grado> obtenerTodos(){
		List<Grado> grados= null;
		grados = sf.getCurrentSession().createCriteria(Grado.class).list();
		return grados;
	}
	
	
}
