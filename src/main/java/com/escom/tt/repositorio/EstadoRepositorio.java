package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Estado;

public interface EstadoRepositorio {

	Integer crearEstado(Estado estado);

	void eliminarEstado(Estado estado);

	Integer actualizarEstado(Estado estado);

	Estado buscarPorId(Integer id);

	List<Estado> obtenerTodos();

}
