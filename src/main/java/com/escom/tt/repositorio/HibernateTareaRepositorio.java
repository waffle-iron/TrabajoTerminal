package com.escom.tt.repositorio;

import com.escom.tt.modelo.Tarea;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Repository
@Transactional
public class HibernateTareaRepositorio implements TareaRepositorio {

    @Autowired
    private SessionFactory sf;

    @Override
    public Integer crear(Tarea tarea) {
        sf.getCurrentSession().save(tarea);
        return tarea.getIdTarea();
    }

    @Override
    public void eliminar(Tarea tarea) {
        sf.getCurrentSession().delete(tarea);

    }

    @Override
    public Integer actualizar(Tarea tarea) {
        sf.getCurrentSession().update(tarea);
        return tarea.getIdTarea();
    }

    @Override
    public Tarea buscarPorId(Integer id) {
        Tarea tarea = null;
        tarea = (Tarea) sf.getCurrentSession().get(Tarea.class, id);
        return tarea;
    }

    @Override
    public List<Tarea> obtenerTodos() {
        List<Tarea> tareas = null;
        tareas = sf.getCurrentSession().createCriteria(Tarea.class).list();
        return tareas;
    }

}
