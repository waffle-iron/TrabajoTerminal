package com.escom.tt.modelo;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="tipo_proyecto")
public class TipoProyecto {
	@Id
	private int idTipoProyecto;
	@Column(name = "nombre")
	private String nombre;
	public int getIdTipoProyecto() {
		return idTipoProyecto;
	}
	public void setIdTipoProyecto(int idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	
}
