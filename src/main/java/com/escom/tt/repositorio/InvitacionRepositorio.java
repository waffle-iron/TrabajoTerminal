package com.escom.tt.repositorio;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Invitacion;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
public interface InvitacionRepositorio {
    Integer crear(Invitacion invitacion);

    void eliminar(Invitacion invitacion);

    Integer actualizar(Invitacion invitacion);

    Invitacion buscarPorId(Integer id);

    List<Invitacion> obtenerTodos();

    List<Invitacion> obtenerPorUsuario(ColaboradorProyecto colaboradorProyecto);
    
    boolean eliminarInvitacionColaborador(ColaboradorProyecto colaboradorProyecto);
}
