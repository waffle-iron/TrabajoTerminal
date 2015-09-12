package com.escom.tt.modelo;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.List;

/**
 * Created by yayo__000 on 27/08/2015.*/

@Entity
@Table(name = "tipo_proyecto")
public class TipoProyecto {
	@Id
    @Column(name = "idTipoProyecto")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer idTipoProyecto;
    
    @Column(name = "nombre")
    @NotNull
    @Size(min = 2, max = 24, message = "El nombre debe tener al menos 2 caracteres y máximo 14")
    private String  nombre;

	@OneToMany(mappedBy = "coordinador")
	private List<Proyecto> proyectos;
    
	
	public Integer getIdTipoProyecto() {
		return idTipoProyecto;
	}

	public void setIdTipoProyecto(Integer idTipoProyecto) {
		this.idTipoProyecto = idTipoProyecto;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	
	@Override
	public String toString() {
		return this.idTipoProyecto+ " " + this.nombre;
	}
}
