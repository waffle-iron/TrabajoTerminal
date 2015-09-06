package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.PalabraClave;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class HibernatePalabraClaveRepositorio implements Palabra_claveRepositorio {
	
	@Autowired
	private SessionFactory sf;
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#crear(com.escom.tt.modelo.PalabraClave)
	 */
	@Override
	public Integer crear(PalabraClave palabra_clave){
		sf.getCurrentSession().save(palabra_clave);
		return palabra_clave.getIdPalabrasClave();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#eliminar(com.escom.tt.modelo.PalabraClave)
	 */
	@Override
	public void eliminar(PalabraClave palabra_clave){
		sf.getCurrentSession().delete(palabra_clave);
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#actualizar(com.escom.tt.modelo.PalabraClave)
	 */
	@Override
	public Integer actualizar(PalabraClave palabra_clave){
		sf.getCurrentSession().update(palabra_clave);
		return palabra_clave.getIdPalabrasClave();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#buscaPorId(java.lang.Integer)
	 */
	@Override
	public PalabraClave buscaPorId(Integer id){
		PalabraClave palabra_clave = null;
		palabra_clave=(PalabraClave) sf.getCurrentSession().get(PalabraClave.class, id);
 		return palabra_clave;
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#obtenerTodos()
	 */
	@Override
	public List<PalabraClave> obtenerTodos(){
		List<PalabraClave> palabras_clave=null;
		palabras_clave= sf.getCurrentSession().createCriteria(PalabraClave.class).list();
		return palabras_clave;
	}
	
}
