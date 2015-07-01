package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.TipoProyecto;

public interface TipoProyectoRepositorio {
	public abstract List<TipoProyecto> obtenerTodos();
	
}
