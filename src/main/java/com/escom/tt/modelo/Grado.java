
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
@Table(name = "GRADO_ACADEMICO")
public class Grado {

	
	@Id
	@Column(name = "idGrado_academico")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idGrado;

	@Column(name = "nombre")
	@NotNull
	@Size(min = 2, max = 14, message = "El nombre debe tener al menos 2 caracteres y máximo 14")
	private String nombre;

	public Integer getIdGrado() {
		return idGrado;
	}

	public void setIdGrado(Integer idGrado) {
		this.idGrado = idGrado;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return this.idGrado + " " + this.nombre;
		
		
	}
	
	
	
	
}
