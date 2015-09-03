package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Idioma;
import com.escom.tt.modelo.Tipo_proyecto;

public interface TipoProyectoRepositorio {
	 Integer crearTipoProyecto(Tipo_proyecto tipoProyecto);

	    void eliminarTipoProyecto(Tipo_proyecto tipoProyecto);

	    Integer actualizarTipoProyecto(Tipo_proyecto tipoProyecto);

	    Tipo_proyecto buscarPorId(Integer id);

	    List<Tipo_proyecto> obtenerTodos();
}
