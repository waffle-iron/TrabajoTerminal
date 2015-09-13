package com.escom.tt.modelo;

import javax.persistence.Embeddable;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

//@Embeddable
public class ColaboradorProyectoID{
	
	//@ManyToOne
	//@JoinColumn(name = "Usuario_idUsuarios")
	private Usuario colaborador;
	//@ManyToOne
	//@JoinColumn(name = "Proyecto_idProyectos")
	private Proyecto proyecto;
	public Usuario getColaborador() {
		return colaborador;
	}
	public void setColaborador(Usuario colaborador) {
		this.colaborador = colaborador;
	}
	public Proyecto getProyecto() {
		return proyecto;
	}
	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}

}