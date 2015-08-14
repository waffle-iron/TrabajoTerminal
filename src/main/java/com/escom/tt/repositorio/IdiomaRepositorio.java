package com.escom.tt.repositorio;

import com.escom.tt.modelo.Idioma;

import java.util.List;

/**
 * Created by darcusfenix on 13/08/15.
 */
public interface IdiomaRepositorio {
    void crearIdioma(Idioma idioma);

    void eliminarIdioma(Idioma idioma);

    void actualizarIdioma(Idioma idioma);

    Idioma buscarPorId(Integer id);

    List<Idioma> obtenerTodos();
}
