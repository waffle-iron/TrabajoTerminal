package com.escom.tt.repositorio;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Proyecto;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Repository
@Transactional
public class HibernateProyectoRepositorio implements ProyectoRepositorio {

    @Autowired
    private SessionFactory sf;

    @Override
    public Integer crear(Proyecto proyecto) {
        sf.getCurrentSession().save(proyecto);
        return proyecto.getIdProyecto();
    }

    @Override
    public void eliminar(Proyecto proyecto) {
        sf.getCurrentSession().delete(proyecto);

    }

    @Override
    public Integer actualizar(Proyecto proyecto) {
        sf.getCurrentSession().update(proyecto);
        return proyecto.getIdProyecto();
    }

    @Override
    public Proyecto buscarPorId(Integer id) {
        Proyecto proyecto = null;
        Session sesion = sf.getCurrentSession();
        proyecto = (Proyecto) sesion.get(Proyecto.class, id);
        sesion.flush();
        sesion.clear();
        return proyecto;
    }

    @Override
    public List<Proyecto> obtenerTodos() {
        List<Proyecto> proyectos = null;
        proyectos = sf.getCurrentSession().createCriteria(Proyecto.class).list();
        sf.getCurrentSession().flush();
        return proyectos;
    }

    @Override
    public ColaboradorProyecto addColaborador(ColaboradorProyecto colaboradorProyecto) {
        Session sesion = sf.getCurrentSession();
        sesion.save(colaboradorProyecto);
        sesion.flush();
        sesion.clear();
        return colaboradorProyecto;
    }

    @Override
    public ColaboradorProyecto getColaborador(ColaboradorProyecto colaboradorProyecto) {
        ColaboradorProyecto cp = null;
        Session sesion = sf.getCurrentSession();
        cp = (ColaboradorProyecto) sesion.get(ColaboradorProyecto.class, colaboradorProyecto.getId());
        sesion.flush();
        sesion.clear();
        return cp;

    }

    @Override
	public List<Proyecto>  buscarPorProyecto(String cadena) {
		List<Proyecto> proyectos = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Proyecto.class);
		criteria.add(Restrictions.or(
				Restrictions.like("nombre", "%"+ cadena + "%"),
				Restrictions.like("descripcion",  "%"+ cadena + "%")));
		proyectos = criteria.list();
		return proyectos;
	}

	

}
