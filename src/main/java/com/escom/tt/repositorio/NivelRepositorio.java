package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Nivel;

public interface NivelRepositorio {

	Integer crearNivel(Nivel nivel);

	void eliminarNivel(Nivel nivel);

	Integer actualizarNivel(Nivel nivel);

	Nivel buscarPorId(Integer id);

	List<Nivel> obtenerTodos();

}
