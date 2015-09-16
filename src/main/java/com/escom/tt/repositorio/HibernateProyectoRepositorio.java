package com.escom.tt.repositorio;

import com.escom.tt.modelo.Proyecto;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
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
        proyecto = (Proyecto) sf.getCurrentSession().get(Proyecto.class, id);
        return proyecto;
    }

    @Override
    public List<Proyecto> obtenerTodos() {
        List<Proyecto> proyectos = null;
        proyectos = sf.getCurrentSession().createCriteria(Proyecto.class).list();
        return proyectos;
    }

}
