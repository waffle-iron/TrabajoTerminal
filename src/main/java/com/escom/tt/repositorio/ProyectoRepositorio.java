package com.escom.tt.repositorio;

import com.escom.tt.modelo.Proyecto;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
public interface ProyectoRepositorio {
    Integer crear(Proyecto proyecto);

    void eliminar(Proyecto proyecto);

    Integer actualizar(Proyecto proyecto);

    Proyecto buscarPorId(Integer id);

    List<Proyecto> obtenerTodos();
}
