package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Usuario;

public interface UsuarioRepositorio {

	public abstract Integer crearUsuario(Usuario usuario);

	public abstract void eliminarUsuario(Usuario usuario);

	public abstract Integer actualizarUsuario(Usuario usuario);

	public abstract Usuario buscarPorId(Integer id);

	public abstract List<Usuario> obtenerTodos();

}