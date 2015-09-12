package com.escom.tt.modelo;

import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.NaturalId;

@Entity
@Table(name = "usuario_colaborador_proyecto")
public class ColaboradorProyecto {
	@EmbeddedId
	ColaboradorProyectoID c;
}
