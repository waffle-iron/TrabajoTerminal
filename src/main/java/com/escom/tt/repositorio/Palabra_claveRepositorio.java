package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.PalabraClave;

public interface Palabra_claveRepositorio {

	public abstract Integer crear(PalabraClave palabra_clave);

	public abstract void eliminar(PalabraClave palabra_clave);

	public abstract Integer actualizar(PalabraClave palabra_clave);

	public abstract PalabraClave buscaPorId(Integer id);

	public abstract List<PalabraClave> obtenerTodos();

}