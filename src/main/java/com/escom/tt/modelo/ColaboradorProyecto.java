package com.escom.tt.modelo;

import javax.lang.model.element.Name;
import javax.persistence.*;

import org.hibernate.annotations.NaturalId;

import java.io.Serializable;

@Entity
@Table(name = "USUARIO_COLABORADOR_PROYECTO")
public class ColaboradorProyecto {

    @EmbeddedId
    private ColaboradorProyectoPK compositekey;

    public ColaboradorProyectoPK getCompositekey() {
        return compositekey;
    }

    public void setCompositekey(ColaboradorProyectoPK compositekey) {
        this.compositekey = compositekey;
    }
}

