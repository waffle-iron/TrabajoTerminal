package com.escom.tt.modelo;



import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Created by darcusfenix on 9/6/15.
 */

@Entity
@Table(name = "ESCUELA")
public class Escuela {

    @Id
    @Column(name="idEscuela")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(name="abreviacion")
    @NotNull
    @Size(min = 2, max = 14, message= "El abreviacion debe tener al menos 2 caracteres y máximo 14")
    private String abreviacion;

    @Column(name="nombre")
    @NotNull
    @Size(min = 2, max = 65, message= "EL nombre debe tener al menos 2 caracteres y máximo 14")
    private String nombre;

    @ManyToOne
    @JoinColumn(name="area")
    @NotNull(message = "Se necesita una área para este registro")
    private Area area;

    @ManyToOne
    @JoinColumn(name="nivel")
    @NotNull(message = "Se necesita un nivel para este registro")
    private Nivel nivel;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Area getArea() {
        return area;
    }

    public void setArea(Area area) {
        this.area = area;
    }

    public Nivel getNivel() {
        return nivel;
    }

    public void setNivel(Nivel nivel) {
        this.nivel = nivel;
    }

    public String getAbreviacion() {
        return abreviacion;
    }

    public void setAbreviacion(String abreviacion) {
        this.abreviacion = abreviacion;
    }

    @Override
    public String toString() {
        return "Escuela{" +
                "id=" + id +
                ", abreviacion='" + abreviacion + '\'' +
                ", nombre='" + nombre + '\'' +
                ", area=" + area +
                ", nivel=" + nivel +
                '}';
    }
}
