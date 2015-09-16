package com.escom.tt.modelo;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "TAREA")
public class Tarea {
	
	@Id
	@Column(name = "idTarea")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idTarea;

	private String titulo;
	private Integer estado;
	private String descripcion;
	private Integer avance;
	private Date fechaEntrega;

	@ManyToOne
	@JoinColumns({
			@JoinColumn(name = "usuario", referencedColumnName = "idUsuario"),
			@JoinColumn(name = "proyecto", referencedColumnName = "idProyecto") })
	private ColaboradorProyecto colaboradorProyecto;

	public Integer getIdTarea() {
		return idTarea;
	}

	public void setIdTarea(Integer idTarea) {
		this.idTarea = idTarea;
	}

	public ColaboradorProyecto getColaboradorProyecto() {
		return colaboradorProyecto;
	}

	public void setColaboradorProyecto(ColaboradorProyecto colaboradorProyecto) {
		this.colaboradorProyecto = colaboradorProyecto;
	}

	public String getTitulo() {
		return titulo;
	}

	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}

	public Integer getEstado() {
		return estado;
	}

	public void setEstado(Integer estado) {
		this.estado = estado;
	}

	public String getDescripcion() {
		return descripcion;
	}

	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}

	public Integer getAvance() {
		return avance;
	}

	public void setAvance(Integer avance) {
		this.avance = avance;
	}

	public Date getFechaEntrega() {
		return fechaEntrega;
	}

	public void setFechaEntrega(Date fechaEntrega) {
		this.fechaEntrega = fechaEntrega;
	}

	@Override
	public String toString() {
		return "Tarea{" +
				"idTarea=" + idTarea +
				", titulo='" + titulo + '\'' +
				", estado=" + estado +
				", descripcion='" + descripcion + '\'' +
				", avance=" + avance +
				", fechaEntrega=" + fechaEntrega +
				", colaboradorProyecto=" + colaboradorProyecto +
				'}';
	}
}
