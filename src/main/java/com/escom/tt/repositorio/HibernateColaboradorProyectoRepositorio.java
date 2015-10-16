package com.escom.tt.repositorio;

import com.escom.tt.modelo.ColaboradorProyecto;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by darcusfenix on 10/15/15.
 */
@Repository
@Transactional
public class HibernateColaboradorProyectoRepositorio implements ColaboradorProyectoRepositorio {
    @Autowired
    private SessionFactory sf;

    @Override
    public boolean crear(ColaboradorProyecto colaboradorProyecto) {
        try {
            sf.getCurrentSession().save(colaboradorProyecto);
            return true;
        }catch (Exception e){
            return false;
        }

    }
}
