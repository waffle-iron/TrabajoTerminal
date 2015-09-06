package com.escom.tt.modelo;

import org.hibernate.validator.constraints.SafeHtml;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Entity
@Table(name = "AREA")
public class Area {
	@Id
	@Column(name="idArea")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idArea;
	
	@Column(name="nombre")
	@NotNull
	@SafeHtml()
	@Size(min = 2, max = 14, message= "El nombre debe tener al menos 2 caracteres y máximo 14")
	private String nombre;


	@OneToMany(mappedBy = "area")
	private Escuela escuela;

	
	public Integer getIdArea() {
		return idArea;
	}

	public void setIdArea(Integer idArea) {
		this.idArea = idArea;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String toString(){
		return this.idArea + "  "+ this.nombre;
	}

	public Escuela getEscuela() {
		return escuela;
	}

	public void setEscuela(Escuela escuela) {
		this.escuela = escuela;
	}
}
