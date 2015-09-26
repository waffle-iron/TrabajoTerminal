package com.escom.tt.modelo;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

/**
 * Created by darcusfenix on 15/09/15.
 */

@Embeddable
class ColaboradorProyectoPK implements Serializable {

    @JoinColumn(name = "Usuario_idUsuarios")
    private int idUsuario;

    @JoinColumn(name = "Proyecto_idProyectos")
    private int idProyecto;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof ColaboradorProyectoPK)) return false;

        ColaboradorProyectoPK that = (ColaboradorProyectoPK) o;

        if (idUsuario != that.idUsuario) return false;
        return idProyecto == that.idProyecto;

    }

    @Override
    public int hashCode() {
        int result = idUsuario;
        result = 31 * result + idProyecto;
        return result;
    }
}