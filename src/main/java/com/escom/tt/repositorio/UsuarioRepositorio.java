package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Grado;
import com.escom.tt.modelo.Idioma;
import com.escom.tt.modelo.Usuario;

public interface UsuarioRepositorio {

	//todo POR CONVENCIÓN DE JAVA TODOS LOS MÉTODOS EN UNA INTERFACE SON PÚBLICOS Y ABSTRACTOS. No es necesario ponerlo.

	public abstract Integer crearUsuario(Usuario usuario);

	public abstract void eliminarUsuario(Usuario usuario);

	public abstract Integer actualizarUsuario(Usuario usuario);

	public abstract Usuario buscarPorId(Integer id);

	public abstract List<Usuario> obtenerTodos();
	List<Usuario> buscarPorUsuario(String cadena);
	Usuario buscarPorCorreo(String correo);

	Usuario buscarPorCorreoORNombreUsuario(String correoUsuario);
	
	List<Usuario> usuarioPorEscuela(int idEscuela);
	
	List<Usuario> usuarioPorGrado(int idGrado);

	List<Usuario> obtenerPorRelacionEscuela(Escuela escuela, String email);

	List<Usuario> obtenerPorRelacionGradoAcademico(Grado grado, String email);

	List<Usuario> obtenerPorRelacionIdioma(Idioma idioma, String email);
}