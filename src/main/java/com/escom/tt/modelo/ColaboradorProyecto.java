package com.escom.tt.modelo;

import javax.lang.model.element.Name;
import javax.persistence.*;

import org.hibernate.annotations.NaturalId;

import java.io.Serializable;

@Entity
@Table(name = "USUARIO_COLABORADOR_PROYECTO")
public class ColaboradorProyecto {

	@Embeddable
	public static class Id implements Serializable {

		@Column(name = "Usuario_idUsuarios")
		private int idUsuario;

		@Column(name = "Proyecto_idProyectos")
		private int idProyecto;

		public Id(){}
		public Id(int idUsuario, int idProyecto){
			this.idProyecto = idProyecto;
			this.idUsuario = idUsuario;
		}

		@Override
		public boolean equals(Object o) {
			if (this == o) return true;
			if (!(o instanceof Id)) return false;

			Id id = (Id) o;

			if (idUsuario != id.idUsuario) return false;
			return idProyecto == id.idProyecto;

		}

		@Override
		public int hashCode() {
			int result = idUsuario;
			result = 31 * result + idProyecto;
			return result;
		}
	}

	@EmbeddedId
	private Id id = new Id();

	@ManyToOne
	@JoinColumn(name = "Proyecto_idProyectos", insertable = false, updatable = false)
	private Proyecto proyecto;

	@ManyToOne
	@JoinColumn(name = "Usuario_idUsuarios", insertable = false, updatable = false)
	private Usuario usuario;

	public ColaboradorProyecto(){}
	public ColaboradorProyecto(Proyecto proyecto, Usuario usuario){
		this.proyecto = proyecto;
		this.usuario = usuario;

		this.id.idUsuario = usuario.getIdUsuarios();
		this.id.idProyecto = proyecto.getIdProyecto();

		proyecto.getColaboradorProyectos().add(this);
		usuario.getColaboradorProyectos().add(this);
	}
	public ColaboradorProyecto(Proyecto proyecto){
		this.proyecto = proyecto;
		this.id.idProyecto = proyecto.getIdProyecto();
		proyecto.getColaboradorProyectos().add(this);
	}
	public ColaboradorProyecto(Usuario usuario){
		this.usuario = usuario;
		this.id.idUsuario = usuario.getIdUsuarios();
		usuario.getColaboradorProyectos().add(this);
	}

	public Id getId() {
		return id;
	}

	public void setId(Id id) {
		this.id = id;
	}

	public Proyecto getProyecto() {
		return proyecto;
	}

	public void setProyecto(Proyecto proyecto) {
		this.proyecto = proyecto;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	@Override
	public String toString() {
		return "ColaboradorProyecto{" +
				"id=" + id +
				", usuario=" + usuario +
				'}';
	}
}