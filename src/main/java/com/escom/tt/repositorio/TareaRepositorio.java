package com.escom.tt.repositorio;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Tarea;
import com.escom.tt.modelo.Usuario;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
public interface TareaRepositorio {

    Integer crear(Tarea tarea);

    void eliminar(Tarea tarea);

    Integer actualizar(Tarea tarea);

    Tarea buscarPorId(Integer id);

    List<Tarea> obtenerTodos();

    List<Tarea> obtenerPorProyecto(ColaboradorProyecto colaboradorProyecto);
    
    public boolean eliminarAsignaciones(ColaboradorProyecto colaboradorProyecto);
    
    List<Tarea> obtenerPorProy(Proyecto proyecto);

    List<Tarea> obtenerPorColaboradorProyecto(ColaboradorProyecto colaboradorProyecto);
}
