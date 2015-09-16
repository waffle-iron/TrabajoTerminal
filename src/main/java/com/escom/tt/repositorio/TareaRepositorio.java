package com.escom.tt.repositorio;

import com.escom.tt.modelo.Tarea;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
public interface TareaRepositorio {

    public Integer crear(Tarea tarea);

    public void eliminar(Tarea tarea);

    public Integer actualizar(Tarea tarea);

    public Tarea buscarPorId(Integer id);

    public List<Tarea> obtenerTodos();
}
