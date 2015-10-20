package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Usuario;

public interface UsuarioRepositorio {

	//todo POR CONVENCIÓN DE JAVA TODOS LOS MÉTODOS EN UNA INTERFACE SON PÚBLICOS Y ABSTRACTOS. No es necesario ponerlo.

	public abstract Integer crearUsuario(Usuario usuario);

	public abstract void eliminarUsuario(Usuario usuario);

	public abstract Integer actualizarUsuario(Usuario usuario);

	public abstract Usuario buscarPorId(Integer id);

	public abstract List<Usuario> obtenerTodos();

	Usuario buscarPorCorreo(String correo);

	Usuario buscarPorCorreoORNombreUsuario(String correoUsuario);

}