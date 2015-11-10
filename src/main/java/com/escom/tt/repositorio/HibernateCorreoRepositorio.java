package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Usuario;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
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

	@Override
	public List<Correo> chat(Usuario emisor, Usuario receptor) {
		List<Correo> correos = null;

		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Correo.class);

		Criterion criterion1 = Restrictions.and(
				Restrictions.like("usuarioEmisor", emisor),
				Restrictions.like("usuarioReceptor", receptor));

		Criterion criterion2 = Restrictions.and(
				Restrictions.like("usuarioEmisor", receptor),
				Restrictions.like("usuarioReceptor", emisor));
		criteria.add(Restrictions.or(criterion1,criterion2));

		criteria.addOrder( Order.asc("fechaHora") );
		correos = criteria.list();
		return correos;
	}
}
