package com.escom.tt.modelo;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name ="nivel")
public class Nivel {
	
	@Id
	@Column(name = "idNivel")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idNivel;
	
	
	@Column(name = "nombre")
	@NotNull
	@Size(min = 2, max = 14, message = "El nombre debe tener al menos 2 caracteres y máximo 14")
	private String nombre;

	public Integer getIdNivel() {
		return idNivel;
	}

	public void setIdNivel(Integer idNivel) {
		this.idNivel = idNivel;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	@Override
	public String toString() {
		return this.idNivel + " " + this.nombre;
	}
}

