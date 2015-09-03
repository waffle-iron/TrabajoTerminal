package com.escom.tt.repositorio;



import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.escom.tt.modelo.Idioma;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

@Repository() // lo mandas al contenedor de spring y lo haces un bean 
@Transactional // para transaccion declarativa , podemos utilizar las transacciones para abrir y cerrar seciones
public class HibernateIdiomaRepositorio implements IdiomaRepositorio {

	@Autowired
	private SessionFactory sf;

	@Override
	public Integer crearIdioma(Idioma idioma){
		sf.getCurrentSession().save(idioma);
		return idioma.getIdIdioma();
	}
	@Override
	public void eliminarIdioma(Idioma idioma){
		sf.getCurrentSession().delete(idioma);
	}
	@Override
	public Integer actualizarIdioma(Idioma idioma){
		sf.getCurrentSession().update(idioma);
		return idioma.getIdIdioma();
	}
	@Override
	public Idioma buscarPorId(Integer id){
		Idioma idioma = null;
		idioma = (Idioma)sf.getCurrentSession().get(Idioma.class,id);
		return idioma;
	}
	@Override
	public List<Idioma> obtenerTodos(){
		List<Idioma> idiomas = null;
		idiomas = sf.getCurrentSession().createCriteria(Idioma.class).list();
		return idiomas;
	}

}
