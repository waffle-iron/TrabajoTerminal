package com.escom.tt.modelo;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "TAREA")
public class Tarea {
	
	@Id
	@Column(name = "idTarea")
	private Integer idTarea;
	
	//private ColaboradorProyecto colaboradorProyecto;

	public Integer getIdTarea() {
		return idTarea;
	}

	public void setIdTarea(Integer idTarea) {
		this.idTarea = idTarea;
	}
	/*
	public ColaboradorProyecto getColaboradorProyecto() {
		return colaboradorProyecto;
	}

	public void setColaboradorProyecto(ColaboradorProyecto colaboradorProyecto) {
		this.colaboradorProyecto = colaboradorProyecto;
	}
	
	*/

}
