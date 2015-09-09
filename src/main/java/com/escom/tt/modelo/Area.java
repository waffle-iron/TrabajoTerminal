package com.escom.tt.modelo;


import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

@Entity
@Table(name = "AREA")
public class Area {
	@Id
	@Column(name="idArea")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer idArea;
	
	@Column(name="nombre")
	@NotNull
	@Size(min = 2, max = 14, message= "El nombre debe tener al menos 2 caracteres y máximo 14")
	private String nombre;


	@OneToMany(mappedBy = "area")
	private List<Escuela> escuelas;

	
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

	public List<Escuela> getEscuelas() {
		return escuelas;
	}

	public void setEscuelas(List<Escuela> escuelas) {
		this.escuelas = escuelas;
	}
}
