package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Grado;

public interface GradoRepositorio {

	public abstract Integer crearGrado(Grado grado);

	public abstract void eliminarGrado(Grado grado);

	public abstract Integer actualizarGrado(Grado grado);

	public abstract Grado buscarPorId(Integer id);

	public abstract List<Grado> obtenerTodos();

}