package com.escom.tt.controlador;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Tarea;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.ProyectoRepositorio;
import com.escom.tt.repositorio.TareaRepositorio;
import com.escom.tt.repositorio.UsuarioRepositorio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.validation.Valid;

import java.security.Principal;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Controller
public class TareaControlador {

    @Autowired
    private TareaRepositorio tareaRepositorio;

    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @Autowired
    private ProyectoRepositorio proyectoRepositorio;


    @RequestMapping(value="/tarea/crear", method = RequestMethod.GET)
    public String crear(Model modelo){

        modelo.addAttribute("tarea", new Tarea());

        return "tarea/tarea-crear";
    }

    @RequestMapping(value = "/tarea/guardarCambios", method = RequestMethod.POST)
    public String actualizar(@ModelAttribute("tarea") @Valid Tarea tarea,
                             BindingResult validacion, Model modelo, Principal principal) {
        String ruta = null;
        Usuario coordinador = null;
        Usuario usuario = null;
        Proyecto proyecto = null;
        ColaboradorProyecto colaboradorProyecto = null;
        List<Tarea> tareas = null;
        coordinador = usuarioRepositorio.buscarPorCorreo(principal.getName());
        Integer avanceTotal = 0;

        if (validacion.hasErrors()) {
            System.err.println("HUBO ERRORES");
            modelo.addAttribute("tarea", tarea);
            ruta = "tarea/tarea-editar";
        } else {

            proyecto = proyectoRepositorio.buscarPorId(tarea
                    .getColaboradorProyecto().getProyecto().getIdProyecto());
            usuario = usuarioRepositorio.buscarPorId(tarea
                    .getColaboradorProyecto().getUsuario().getIdUsuarios());

            colaboradorProyecto = new ColaboradorProyecto(proyecto, usuario);
            tareas = tareaRepositorio.obtenerPorProyecto(colaboradorProyecto);
            int contadorTarea = 0;
            for (Tarea tareaTemporal : tareas) {

                avanceTotal = +tarea.getAvance();
                contadorTarea++;
            }
            Integer avance = (avanceTotal * 100) / (contadorTarea * 100);

            proyecto.setAvance(avance);
            tarea.setColaboradorProyecto(colaboradorProyecto);
            if (tarea.getColaboradorProyecto().getProyecto().getCoordinador()
                    .getIdUsuarios() == coordinador.getIdUsuarios()) {
                System.err.println("ES EL COORDINADOR");
                System.err.println("TAREA [1]: " + tarea);
                Integer id = tareaRepositorio.actualizar(tarea);
                Integer idProyecto = proyectoRepositorio.actualizar(proyecto);
                ruta = "redirect:/proyecto/propio/"
                        + tarea.getColaboradorProyecto().getProyecto()
                        .getIdProyecto();
            } else
                ruta = "redirect:/";
        }
        return ruta;
    }


    @RequestMapping(value = "/tarea/{tareaId:[0-9]+}/editar", method = RequestMethod.GET)
    public String actualizar(@PathVariable Integer tareaId, Model modelo,
                             Principal principal) {
        Tarea tarea = null;
        String ruta = null;
        Usuario usuario = null;
        usuario = usuarioRepositorio.buscarPorCorreo(principal.getName());


        tarea = tareaRepositorio.buscarPorId(tareaId);

        Map<Integer,String> estadoMap = new LinkedHashMap<Integer,String>();
        estadoMap.put(1, "Iniciando");
        estadoMap.put(2, "estado 1");
        estadoMap.put(3, "estado 2");
        estadoMap.put(4, "estado 3");

        if (tarea != null
                && tarea.getColaboradorProyecto().getProyecto()
                .getCoordinador().getIdUsuarios() == usuario
                .getIdUsuarios()) {
            modelo.addAttribute("tarea", tarea);
            modelo.addAttribute("estadoMap", estadoMap);
            ruta = "tarea/tarea-editar";
        } else {
            ruta = "redirect:/";
        }

        return ruta;
    }

    @RequestMapping(value="/tarea/ver/{tareaId:[0-9]+}")
    public String ver(@PathVariable Integer tareaId, Model modelo, Boolean actualizado, Boolean creado) {
        String ruta = null;
        Tarea tarea= null;

        tarea = tareaRepositorio.buscarPorId(tareaId);
        if (tarea != null) {
            modelo.addAttribute("tarea", tarea);
            modelo.addAttribute("actualizado", actualizado);
            modelo.addAttribute("creado", creado);
            ruta = "tarea/tarea-ver";
        }else
            ruta = "redirect:/tarea";

        return ruta;
    }

    @RequestMapping(value="/tarea/{proyectoId:[0-9]+}/{tareaId:[0-9]+}/eliminar")
    public String eliminar(@PathVariable Integer tareaId,@PathVariable Integer proyectoId, Model modelo) {
        Boolean eliminado;
        Tarea tarea = null;
        tarea = tareaRepositorio.buscarPorId(tareaId);

        if(tarea != null){
            tareaRepositorio.eliminar(tarea);
            eliminado = true;
        }else{
            eliminado = false;
        }

        return "redirect:/proyecto/propio/"+proyectoId;
    }

    @RequestMapping(value="/tarea")
    public String verTodos(Model modelo,Boolean eliminado) {

        List<Tarea> tareaList = null;

        tareaList = tareaRepositorio.obtenerTodos();

        modelo.addAttribute("tareasList", tareaList);
        modelo.addAttribute("eliminado", eliminado);

        return "tarea/tarea-todos";
    }
}
