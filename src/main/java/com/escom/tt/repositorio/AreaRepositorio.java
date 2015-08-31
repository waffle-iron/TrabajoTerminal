package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Area;



public interface AreaRepositorio {
    Integer crearArea(Area area);

    void eliminarArea(Area area);

    Integer actualizarArea(Area area);

    Area buscarPorId(Integer id);

    List<Area> obtenerTodos();
}
