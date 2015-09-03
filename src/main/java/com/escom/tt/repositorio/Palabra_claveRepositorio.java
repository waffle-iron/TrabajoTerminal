package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Palabra_clave;

public interface Palabra_claveRepositorio {

	public abstract Integer crear(Palabra_clave palabra_clave);

	public abstract void eliminar(Palabra_clave palabra_clave);

	public abstract Integer actualizar(Palabra_clave palabra_clave);

	public abstract Palabra_clave buscaPorId(Integer id);

	public abstract List<Palabra_clave> obtenerTodos();

}