package com.escom.tt.repositorio;

import java.util.List;

import com.escom.tt.modelo.Correo;
import com.escom.tt.modelo.Escuela;
import com.escom.tt.modelo.Usuario;

public interface CorreoRepositorio {

    Integer crearCorreo(Correo correo);

    void eliminarCorreo(Correo correo);

    Integer actualizarCorreo(Correo correo);

    Correo buscarPorId(Integer id);

    List<Correo> obtenerTodos();

    List<Correo> chat(Usuario emisor, Usuario receptor);
    
    List<Correo> obtenerCorreosPropios(Usuario usuario);
    
    List<Correo> obtenerCorreosPropiosRecibidos(Usuario usuario);
    
}
