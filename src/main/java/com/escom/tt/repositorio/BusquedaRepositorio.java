package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;

public interface BusquedaRepositorio {

	List<Proyecto> buscarPorProyectoORNombreUsuario(String proyectoUsuario);
	//List<Proyecto> buscarCadenaEnProyectos(String cadena);
	List<Usuario> buscarCadenaEnusuario(String cadena);	
	List<Proyecto> buscarPorCoordinador(Usuario coordinador);
	Usuario buscarPorEmail(String proyectoUsuario);
	//List<Proyecto> buscarPorProyectoORNombreUsuarioLista(String proyectoUsuario);
}