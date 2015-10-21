package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;

public interface BusquedaRepositorio {

	Proyecto buscarPorProyectoORNombreUsuario(String proyectoUsuario);
	List<Proyecto> buscarPorCoordinador(Usuario coordinador);
	Usuario buscarPorEmail(String proyectoUsuario);
}