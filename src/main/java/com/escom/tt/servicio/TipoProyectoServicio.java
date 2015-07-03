package com.escom.tt.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.TipoProyecto;
import com.escom.tt.repositorio.TipoProyectoRepositorio;

@Service
public class TipoProyectoServicio implements InterTipoProyecto{
	@Autowired
	private TipoProyectoRepositorio tipoProyectoRepositorio;
	
	@Override
	public List<TipoProyecto> obtenerTodos(){
		List tiposProyecto = null;
		tiposProyecto = tipoProyectoRepositorio.obtenerTodos();
		return tiposProyecto;
		
		
	}
}
