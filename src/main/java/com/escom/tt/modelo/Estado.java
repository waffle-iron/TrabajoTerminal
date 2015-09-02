package com.escom.tt.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name="ESTADO")
public class Estado {

	@Id
	@Column(name="idEstado")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idEstado;
	@Column(name="nombre")
	@NotNull
	@Size(min=2, max=20, message="El nombre debe tener al menos 2 caracteres y máximo 20")
	private String nombre;
	
	public Integer getIdEstado() {
		return idEstado;
	}
	public void setIdEstado(Integer idEstado) {
		this.idEstado = idEstado;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@Override
	public String toString() {
		return this.idEstado+" "+ this.nombre;
	}
	
	
	
	
}
