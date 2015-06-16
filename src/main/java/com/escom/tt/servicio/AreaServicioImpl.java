package com.escom.tt.servicio;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.escom.tt.modelo.Area;
import com.escom.tt.repositorio.AreaRepositorio;

@Service
public class AreaServicioImpl implements AreaServicio {
	
	@Autowired
	private AreaRepositorio areaRepositorio;
	
	@Override
	public List<Area> mostrarTodas(){
		List<Area> areas = null;
		areas = areaRepositorio.buscarTodas();
		return areas;
	}
}
