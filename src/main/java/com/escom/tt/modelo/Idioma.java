package com.escom.tt.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "idioma")
public class Idioma {
	@Id
	private String idIdioma;
	@Column(name = "nombre")
	private String nombre;
	
	public String getIdIdioma() {
		return idIdioma;
	}
	public void setIdIdioma(String idIdioma) {
		this.idIdioma = idIdioma;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
}
