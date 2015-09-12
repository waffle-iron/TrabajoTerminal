package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.Direccion;

public interface DireccionRepositorio {
	Integer crearDireccion(Direccion direccion);

    void eliminarDireccion(Direccion direccion);

    Integer actualizarDireccion(Direccion direccion);

    Direccion buscarPorId(Integer id);

    List<Direccion> obtenerTodos();
	
}
