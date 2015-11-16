package com.escom.tt.modelo;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.Valid;

import java.util.Date;
import java.util.List;

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
    @NotNull
    @NotEmpty(message = "El campo nombre no puede estar vacio")
    @Size(max = 45, message="El nombre sólo debe tener un máximo de {1} caracteres")
    private String nombre;

    @Column(name="descripcion")
    @NotNull(message = "La descripcion debe ser obligatorio")
    @NotEmpty(message = "El campo descripción no puede estar vacio")
    private String descripcion;

    @Column(name="fechaInicio")
    @NotNull(message = "La fecha de inicio debe ser obligatorio")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    
    private Date fechaInicio;

    @Column(name="fechaFin")
    @NotNull(message = "La fecha de fin debe ser obligatorio")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
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

    @OneToMany(mappedBy="proyecto",fetch=FetchType.EAGER)
    @Fetch(FetchMode.SELECT)
    private List<ColaboradorProyecto> colaboradorProyectos;


    public List<ColaboradorProyecto> getColaboradorProyectos() {
        return colaboradorProyectos;
    }

    public void setColaboradorProyectos(List<ColaboradorProyecto> colaboradorProyectos) {
        this.colaboradorProyectos = colaboradorProyectos;
    }

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

    @Override
    public String toString() {
        return "Proyecto{" +
                "idProyecto=" + idProyecto +
                ", nombre='" + nombre + '\'' +
                ", descripcion='" + descripcion + '\'' +
                ", fechaInicio=" + fechaInicio +
                ", fechaFin=" + fechaFin +
                ", privado=" + privado +
                ", avance=" + avance +
                ", tipoProyecto=" + tipoProyecto +
                ", estado=" + estado +
                ", coordinador=" + coordinador +
                ", colaboradorProyectos=" + colaboradorProyectos +
                '}';
    }
}