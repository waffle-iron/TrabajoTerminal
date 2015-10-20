package com.escom.tt.repositorio;

import com.escom.tt.modelo.Proyecto;

public interface BusquedaRepositorio {

	Proyecto buscarPorProyectoORNombreUsuario(String proyectoUsuario);
}