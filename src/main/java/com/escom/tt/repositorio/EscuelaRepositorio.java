package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Escuela;

public interface EscuelaRepositorio {
	  Integer crearEscuela(Escuela escuela);

	    void eliminarEscuela(Escuela escuela);

	    Integer actualizarEscuela(Escuela escuela);

	    Escuela buscarPorId(Integer id);

	    List<Escuela> obtenerTodos();

}
