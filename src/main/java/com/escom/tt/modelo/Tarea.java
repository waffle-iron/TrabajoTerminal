package com.escom.tt.modelo;

import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.Max;
import javax.validation.constraints.NotNull;

import java.util.Date;

@Entity
@Table(name = "TAREA")
public class Tarea {

	@Id
	@Column(name = "idTarea")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idTarea;
	@NotNull(message = "El titulo es requerido")	
	@NotBlank
	private String titulo;
	@NotNull(message = "El estado es requerido")			
	private Integer estado;
	@Length(max = 50, message = "La descripción no debe rebasar los 200 caracteres")
	@NotNull(message = "La descripcón es obligatoria")	
	@NotBlank
	private String descripcion;
	@NotNull(message = "El avance es obligatorio")		
	private Integer avance;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date fechaEntrega;

	@ManyToOne
	@JoinColumns({
			@JoinColumn(name = "usuario", referencedColumnName = "Usuario_idUsuarios"),
			@JoinColumn(name = "proyecto", referencedColumnName = "Proyecto_idProyectos") })
	private ColaboradorProyecto colaboradorProyecto;

	public ColaboradorProyecto getColaboradorProyecto() {
		return colaboradorProyecto;
	}

	public void setColaboradorProyecto(ColaboradorProyecto colaboradorProyecto) {
		this.colaboradorProyecto = colaboradorProyecto;
	}

	public Integer getIdTarea() {
		return idTarea;
	}

	public void setIdTarea(Integer idTarea) {
		this.idTarea = idTarea;
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