package com.escom.tt.repositorio;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.TipoProyecto;
import com.escom.tt.modelo.Usuario;

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
        return proyecto;
    }

    @Override
    public List<Proyecto> obtenerTodos() {
        List<Proyecto> proyectos = null;
        proyectos = sf.getCurrentSession().createCriteria(Proyecto.class).list();
        return proyectos;
    }

    @Override
    public ColaboradorProyecto addColaborador(ColaboradorProyecto colaboradorProyecto) {
        sf.getCurrentSession().save(colaboradorProyecto);
        return colaboradorProyecto;
    }

    @Override
    public ColaboradorProyecto getColaborador(ColaboradorProyecto colaboradorProyecto) {
        ColaboradorProyecto cp = null;
        Session sesion = sf.getCurrentSession();
        cp = (ColaboradorProyecto) sesion.get(ColaboradorProyecto.class, colaboradorProyecto.getId());
        return cp;
    }

    // Recuerda que hibernate está orientado a objetos.
    // Hay varias formas, está como yo le hice de mandar el usuario.
    // O mandando el id, pero dentro buscar el usuario.
    // En en la restricción siempre debe estar un obejto cuando hay una relación, este ejemplo: PROYECTO-USUARIO
    // si ves en el otro que hice para buscar por correo, no es relación
	@Override
	public List<Proyecto> buscarPorCoordinador(Usuario coordinador) {
		List<Proyecto> proyectos = null;
		Session session = sf.getCurrentSession();

		Criteria criteria = session.createCriteria(Proyecto.class);
		criteria.add(Restrictions.eq("coordinador", coordinador));
		proyectos = criteria.list();
		System.out.println("termino consulta de proyectos");
		return proyectos;
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

	@Override
	public List<Proyecto> buscaTipoProyectoUsuario(int tipoProyecto,	Usuario usu) {
		List<Proyecto> proyectos = null;
		Session session = sf.getCurrentSession();
		Criteria criteria = session.createCriteria(Proyecto.class);
		criteria.add(Restrictions.and(
				Restrictions.eq("tipoProyecto.idTipoProyecto", tipoProyecto),
				Restrictions.eq("coordinador",  usu)));
		proyectos = criteria.list();
		return proyectos;
		
	}

	
    
    
    

	

}
