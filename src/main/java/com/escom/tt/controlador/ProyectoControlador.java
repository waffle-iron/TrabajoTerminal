package com.escom.tt.controlador;

import com.escom.tt.modelo.Proyecto;
import com.escom.tt.repositorio.EstadoRepositorio;
import com.escom.tt.repositorio.ProyectoRepositorio;
import com.escom.tt.repositorio.TipoProyectoRepositorio;
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
import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
@Controller
public class ProyectoControlador {

    @Autowired
    private ProyectoRepositorio proyectoRepositorio;
    @Autowired
    private TipoProyectoRepositorio tipoProyectoRepositorio;
    @Autowired
    private EstadoRepositorio estadoRepositorio;
    @Autowired
    private UsuarioRepositorio usuarioRepositorio;

    @RequestMapping(value="/proyecto/crear", method = RequestMethod.GET)
    public String crear(Model modelo){

        modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
        modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
        modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
        modelo.addAttribute("proyecto", new Proyecto());
        return "proyecto-crear";
    }

    @RequestMapping(value="/proyecto/crear", method = RequestMethod.POST)
    public String crear(@ModelAttribute("proyecto") @Valid Proyecto proyecto, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            ruta = "proyecto-crear";
        }else{
            Integer id = proyectoRepositorio.crear(proyecto);
            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto()+ "/?creado=true";
        }
        return ruta;
    }


    @RequestMapping(value="/proyecto/guardarCambios", method = RequestMethod.POST)
    public String actualizar(@ModelAttribute("proyecto") @Valid Proyecto proyecto, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("proyecto", proyecto);
            ruta = "proyecto-editar";
        }else{
            Integer id = proyectoRepositorio.actualizar(proyecto);
            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto() + "/?actualizado=true";
        }
        return ruta;
    }

    @RequestMapping(value="/proyecto/{proyectoId:[0-9]+}/editar", method = RequestMethod.GET)
    public String actualizar(@PathVariable Integer proyectoId,Model modelo) {
        Proyecto proyecto = null;
        String ruta = null;
        proyecto = proyectoRepositorio.buscarPorId(proyectoId);

        if (proyecto != null) {
            modelo.addAttribute("proyecto", proyecto);
            ruta = "proyecto-editar";
        }
        else
            ruta = "redirect:/proyecto";

        return ruta;
    }

    @RequestMapping(value="/proyecto/ver/{proyectoId:[0-9]+}")
    public String ver(@PathVariable Integer proyectoId, Model modelo, Boolean actualizado, Boolean creado) {
        String ruta = null;
        Proyecto proyecto= null;

        proyecto = proyectoRepositorio.buscarPorId(proyectoId);
        if (proyecto != null) {
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("actualizado", actualizado);
            modelo.addAttribute("creado", creado);
            ruta = "proyecto-ver";
        }else
            ruta = "redirect:/proyecto";

        return ruta;
    }

    @RequestMapping(value="/proyecto/eliminar/{proyectoId:[0-9]+}")
    public String eliminar(@PathVariable Integer proyectoId, Model modelo) {
        Boolean eliminado;
        Proyecto proyecto = null;
        proyecto = proyectoRepositorio.buscarPorId(proyectoId);

        if(proyecto != null){
            proyectoRepositorio.eliminar(proyecto);
            eliminado = true;
        }else{
            eliminado = false;
        }

        return "redirect:/proyecto?eliminado=" + eliminado;
    }

    @RequestMapping(value="/proyecto")
    public String verTodos(Model modelo,Boolean eliminado) {

        List<Proyecto> proyectoList = null;

        proyectoList = proyectoRepositorio.obtenerTodos();

        modelo.addAttribute("proyectosList", proyectoList);
        modelo.addAttribute("eliminado", eliminado);

        return "proyecto-todos";
    }

}
