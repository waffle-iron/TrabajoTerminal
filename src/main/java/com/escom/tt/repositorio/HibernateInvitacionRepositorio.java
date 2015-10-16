package com.escom.tt.repositorio;

import com.escom.tt.modelo.Invitacion;
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
public class HibernateInvitacionRepositorio implements InvitacionRepositorio {
    @Autowired
    private SessionFactory sf;

    @Override
    public Integer crear(Invitacion invitacion) {
        sf.getCurrentSession().save(invitacion);
        return invitacion.getIdInvitacion();
    }

    @Override
    public void eliminar(Invitacion invitacion) {
        sf.getCurrentSession().delete(invitacion);

    }

    @Override
    public Integer actualizar(Invitacion invitacion) {
        sf.getCurrentSession().update(invitacion);
        return invitacion.getIdInvitacion();
    }

    @Override
    public Invitacion buscarPorId(Integer id) {
        Invitacion invitacion = null;
        invitacion = (Invitacion) sf.getCurrentSession().get(Invitacion.class, id);
        return invitacion;
    }

    @Override
    public List<Invitacion> obtenerTodos() {
        List<Invitacion> invitacions = null;
        invitacions = sf.getCurrentSession().createCriteria(Invitacion.class).list();
        return invitacions;
    }

}
