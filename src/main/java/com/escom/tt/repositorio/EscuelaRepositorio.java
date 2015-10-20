package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Escuela;
import org.springframework.security.access.annotation.Secured;

public interface EscuelaRepositorio {
    Integer crearEscuela(Escuela escuela);

    void eliminarEscuela(Escuela escuela);

    Integer actualizarEscuela(Escuela escuela);

    @Secured("ROLE_TELLER")
    Escuela buscarPorId(Integer id);

    List<Escuela> obtenerTodos();

}
