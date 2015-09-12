package com.escom.tt.modelo;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "IDIOMA")
public class Idioma {

	@Id
	@Column(name = "idIdiomas")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idIdioma;

	@Column(name = "nombre")
	@NotNull
	@Size(min = 2, max = 14, message = "El nombre debe tener al menos 2 caracteres y máximo 14")
	private String nombre;
	
	public Integer getIdIdioma() {
		return idIdioma;
	}
	public void setIdIdioma(Integer idIdioma) {
		this.idIdioma = idIdioma;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	@Override
	public String toString() {
		return this.idIdioma + " " + this.nombre;
		
		
	}
}
