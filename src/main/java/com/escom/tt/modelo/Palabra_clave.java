package com.escom.tt.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.validation.constraints.Max;


@Entity
@Table(name="PALABRA_CLAVE")
public class Palabra_clave {

	@Id
	@Column(name="idPalabrasClave")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer idPalabrasClave;
	
	@Column(name="nombre")
	@NotNull
	@Size(min=2, max=20, message="El nombre de la palabra debe tener al menos 2 caracteres y máximo 14")
	private String nombre;

	public Integer getIdPalabrasClave() {
		return idPalabrasClave;
	}
	public void setIdPalabrasClave(Integer idPalabrasClave) {
		this.idPalabrasClave = idPalabrasClave;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	@Override
	public String toString() {
		return this.idPalabrasClave+" "+this.nombre;	
	}

	
	
}
