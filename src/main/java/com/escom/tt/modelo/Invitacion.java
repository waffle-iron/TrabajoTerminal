package com.escom.tt.modelo;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Entity
@Table(name = "INVITACION")
public class Invitacion {

    @Id
    @Column(name = "idInvitacion")
    @GeneratedValue(strategy=GenerationType.IDENTITY)

    private Integer idInvitacion;
    private Date fecha;
    private Integer estado;

    @ManyToOne
    @JoinColumns({
            @JoinColumn(name = "usuario", referencedColumnName = "idUsuario"),
            @JoinColumn(name = "proyecto", referencedColumnName = "idProyecto") })
    private ColaboradorProyecto colaboradorProyecto;

    public ColaboradorProyecto getColaboradorProyecto() {
        return colaboradorProyecto;
    }

    public void setColaboradorProyecto(ColaboradorProyecto colaboradorProyecto) {
        this.colaboradorProyecto = colaboradorProyecto;
    }

    public Integer getIdInvitacion() {
        return idInvitacion;
    }

    public void setIdInvitacion(Integer idInvitacion) {
        this.idInvitacion = idInvitacion;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public Integer getEstado() {
        return estado;
    }

    public void setEstado(Integer estado) {
        this.estado = estado;
    }
}
