package com.escom.tt.modelo;

import javax.enterprise.inject.Default;
import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.ws.rs.DefaultValue;
import java.util.Date;

/**
 * Created by darcusfenix on 9/12/15.
 */

@Entity
@Table(name="PROYECTO")
public class Proyecto {

    @Id
    @Column(name="idProyecto")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer idProyecto;

    @Column(name="nombre")
    @NotNull(message = "El nombre debe ser obligatorio")
    @Size(max = 45, message="El nombre sólo debe tener un máximo de {1} caracteres")
    private String nombre;

    @Column(name="descripcion")
    @NotNull(message = "El descripcion debe ser obligatorio")
    private String descripcion;

    @Column(name="fechaInicio")
    @NotNull(message = "La fecha de inicio debe ser obligatorio")
    private Date fechaInicio;

    @Column(name="fechaFin")
    @NotNull(message = "La fecha de fin debe ser obligatorio")
    private Date fechaFin;

    @Column(name = "privado")
    private Boolean privado;

    @Column(name = "avance")
    @NotNull
    private Integer avance;

    @ManyToOne
    @JoinColumn(name="tipo")
    @NotNull(message = "Se necesita un tipo de proyecto")
    private TipoProyecto tipoProyecto;

    @ManyToOne
    @JoinColumn(name="estado")
    @NotNull(message = "Se necesita un estado de proyecto")
    private Estado estado;

    @OneToOne
    @JoinColumn(name="coordinador")
    @NotNull(message = "Se necesita un Coordinador de proyecto")
    private Usuario coordinador;

    public Integer getIdProyecto() {
        return idProyecto;
    }

    public void setIdProyecto(Integer idProyecto) {
        this.idProyecto = idProyecto;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public Boolean getPrivado() {
        return privado;
    }

    public void setPrivado(Boolean privado) {
        this.privado = privado;
    }

    public Integer getAvance() {
        return avance;
    }

    public void setAvance(Integer avance) {
        this.avance = avance;
    }

    public TipoProyecto getTipoProyecto() {
        return tipoProyecto;
    }

    public void setTipoProyecto(TipoProyecto tipoProyecto) {
        this.tipoProyecto = tipoProyecto;
    }

    public Estado getEstado() {
        return estado;
    }

    public void setEstado(Estado estado) {
        this.estado = estado;
    }

    public Usuario getCoordinador() {
        return coordinador;
    }

    public void setCoordinador(Usuario coordinador) {
        this.coordinador = coordinador;
    }
}