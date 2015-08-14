package com.escom.tt.modelo;

import javax.persistence.*;

@Entity
@Table(name = "IDIOMA")
public class Idioma {

	@Id
	@Column(name = "idIdiomas")
	//@SequenceGenerator(name = "idArticuloSecuencia", sequenceName = "articulo_id_seq", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idIdioma;

	@Column(name = "nombre")
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
	
	
}
