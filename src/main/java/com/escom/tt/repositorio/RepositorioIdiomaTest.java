package com.escom.tt.repositorio;

import com.escom.tt.modelo.Idioma;
import com.escom.tt.repositorio.IdiomaRepositorio;
import junit.framework.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import java.util.List;

/**
 * Created by darcusfenix on 13/08/15.
 */
public class RepositorioIdiomaTest {

    private static ApplicationContext contexto;

    private static IdiomaRepositorio idiomaRepositorio;

    @BeforeClass
    public static void inicializar() {

        contexto = new ClassPathXmlApplicationContext("/repository-context.xml");
        idiomaRepositorio = (IdiomaRepositorio) contexto.getBean("idiomaRepositorio");
    }

    @Test
    public void guardarTest() {

        Idioma idioma = new Idioma();

        idioma.setNombre("ESPAÑOL");
        idiomaRepositorio.crearIdioma(idioma);

        List<Idioma> idiomalist = null;
        idiomalist = idiomaRepositorio.obtenerTodos();

        Assert.assertNotNull(idiomalist);
    }

}
