package com.escom.tt.repositorio;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.escom.tt.modelo.Idioma;

@Repository
public class HibernateIdiomaRepositorio implements IdiomaRepositorio {
	@Autowired
	private SessionFactory sf; 
	

	@Override
	public void crearIdioma(Idioma idioma){
		System.out.println("se ha creado un nuevo idioma"  + idioma);
	}
	
}
