package com.escom.tt.repositorio;

import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.escom.tt.modelo.Palabra_clave;

@Repository
@Transactional
public class HibernatePalabraClaveRepositorio implements Palabra_claveRepositorio {
	
	@Autowired
	private SessionFactory sf;
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#crear(com.escom.tt.modelo.Palabra_clave)
	 */
	@Override
	public Integer crear(Palabra_clave palabra_clave){
		sf.getCurrentSession().save(palabra_clave);
		return palabra_clave.getIdPalabrasClave();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#eliminar(com.escom.tt.modelo.Palabra_clave)
	 */
	@Override
	public void eliminar(Palabra_clave palabra_clave){
		sf.getCurrentSession().delete(palabra_clave);
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#actualizar(com.escom.tt.modelo.Palabra_clave)
	 */
	@Override
	public Integer actualizar(Palabra_clave palabra_clave){
		sf.getCurrentSession().update(palabra_clave);
		return palabra_clave.getIdPalabrasClave();
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#buscaPorId(java.lang.Integer)
	 */
	@Override
	public Palabra_clave buscaPorId(Integer id){
		Palabra_clave palabra_clave = null;
		palabra_clave=(Palabra_clave) sf.getCurrentSession().get(Palabra_clave.class, id);
 		return palabra_clave;
	}
	
	/* (non-Javadoc)
	 * @see com.escom.tt.repositorio.Palabra_claveRepositorio#obtenerTodos()
	 */
	@Override
	public List<Palabra_clave> obtenerTodos(){
		List<Palabra_clave> palabras_clave=null;
		palabras_clave= sf.getCurrentSession().createCriteria(Palabra_clave.class).list();
		return palabras_clave;
	}
	
}
