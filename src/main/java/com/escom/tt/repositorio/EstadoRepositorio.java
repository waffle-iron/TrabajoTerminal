package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Estado;

public interface EstadoRepositorio {

	public abstract Integer crearEstado(Estado estado);

	public abstract void eliminarEstado(Estado estado);

	public abstract Integer actualizarEstado(Estado estado);

	public abstract Estado buscaPorId(Integer id);

	public abstract List<Estado> obtenerTodos();

}