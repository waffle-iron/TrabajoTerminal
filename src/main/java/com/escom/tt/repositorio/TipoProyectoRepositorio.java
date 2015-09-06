package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.TipoProyecto;

public interface TipoProyectoRepositorio {
	 Integer crearTipoProyecto(TipoProyecto tipoProyecto);

	    void eliminarTipoProyecto(TipoProyecto tipoProyecto);

	    Integer actualizarTipoProyecto(TipoProyecto tipoProyecto);

	    TipoProyecto buscarPorId(Integer id);

	    List<TipoProyecto> obtenerTodos();
}
