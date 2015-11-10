package com.escom.tt.modelo;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
@Entity
@Table(name="Correo")
public class Correo {
	

	
	@Id
	@Column(name="idCorreo")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idCorreo;
	
	
	@Column(name="Asunto")
	@NotNull(message = "este campo no debe estar vacio")
	@Size(min = 1, max =  45, message =" el asunto debe tener al menos un caracter y maximo 45")
	private String asunto;
	
	@Column(name="Contenido")
	@NotNull(message = "este campo no debe estar vacio")
	@Size(min = 1, max =  255, message =" el asunto debe tener al menos un caracter y maximo 255")
	private String contenido;

	@Column(name="fecha_hora")
	private Date fechaHora;
	
	
	@ManyToOne
	@JoinColumn(name="EMISOR")
	@NotNull(message = "Se necesita un nivel para este registro")
    private Usuario usuarioEmisor;
	
	@OneToOne
	@JoinColumn(name="RECEPTOR")
	private Usuario usuarioReceptor;

	public Integer getIdCorreo() {
		return idCorreo;
	}

	public void setIdCorreo(Integer idCorreo) {
		this.idCorreo = idCorreo;
	}

	public String getAsunto() {
		return asunto;
	}

	public void setAsunto(String asunto) {
		this.asunto = asunto;
	}

	public String getContenido() {
		return contenido;
	}

	public void setContenido(String contenido) {
		this.contenido = contenido;
	}

	public Usuario getUsuarioEmisor() {
		return usuarioEmisor;
	}

	public void setUsuarioEmisor(Usuario usuarioEmisor) {
		this.usuarioEmisor = usuarioEmisor;
	}

	public Usuario getUsuarioReceptor() {
		return usuarioReceptor;
	}

	public void setUsuarioReceptor(Usuario usuarioReceptor) {
		this.usuarioReceptor = usuarioReceptor;
	}

	public Date getFechaHora() {
		return fechaHora;
	}

	public void setFechaHora(Date fechaHora) {
		this.fechaHora = fechaHora;
	}

	@Override
	public String toString() {
		return "Correo{" +
				"idCorreo=" + idCorreo +
				", asunto='" + asunto + '\'' +
				", contenido='" + contenido + '\'' +
				", fechaHora=" + fechaHora +
				", usuarioEmisor=" + usuarioEmisor.getNombres() +
				", usuarioReceptor=" + usuarioReceptor.getNombres() +
				'}';
	}
}
