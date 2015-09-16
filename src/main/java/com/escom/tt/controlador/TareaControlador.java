package com.escom.tt.controlador;

import com.escom.tt.modelo.Tarea;
import com.escom.tt.repositorio.TareaRepositorio;
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
public class TareaControlador {

    @Autowired
    private TareaRepositorio tareaRepositorio;


    @RequestMapping(value="/tarea/crear", method = RequestMethod.GET)
    public String crear(Model modelo){

        modelo.addAttribute("tarea", new Tarea());

        return "tarea-crear";
    }

    @RequestMapping(value="/tarea/crear", method = RequestMethod.POST)
    public String crear(@ModelAttribute("tarea") @Valid Tarea tarea, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("tarea", tarea);
            ruta = "tarea-crear";
        }else{
            Integer id = tareaRepositorio.crear(tarea);
            ruta = "redirect:/tarea/ver/" + tarea.getIdTarea()+ "/?creado=true";
        }
        return ruta;
    }


    @RequestMapping(value="/tarea/guardarCambios", method = RequestMethod.POST)
    public String actualizar(@ModelAttribute("tarea") @Valid Tarea tarea, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("tarea", tarea);
            ruta = "tarea-editar";
        }else{
            Integer id = tareaRepositorio.actualizar(tarea);
            ruta = "redirect:/tarea/ver/" + tarea.getIdTarea() + "/?actualizado=true";
        }
        return ruta;
    }

    @RequestMapping(value="/tarea/{tareaId:[0-9]+}/editar", method = RequestMethod.GET)
    public String actualizar(@PathVariable Integer tareaId,Model modelo) {
        Tarea tarea = null;
        String ruta = null;
        tarea = tareaRepositorio.buscarPorId(tareaId);

        if (tarea != null) {
            modelo.addAttribute("tarea", tarea);
            ruta = "tarea-editar";
        }
        else
            ruta = "redirect:/tarea";

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
            ruta = "tarea-ver";
        }else
            ruta = "redirect:/tarea";

        return ruta;
    }

    @RequestMapping(value="/tarea/eliminar/{tareaId:[0-9]+}")
    public String eliminar(@PathVariable Integer tareaId, Model modelo) {
        Boolean eliminado;
        Tarea tarea = null;
        tarea = tareaRepositorio.buscarPorId(tareaId);

        if(tarea != null){
            tareaRepositorio.eliminar(tarea);
            eliminado = true;
        }else{
            eliminado = false;
        }

        return "redirect:/tarea?eliminado=" + eliminado;
    }

    @RequestMapping(value="/tarea")
    public String verTodos(Model modelo,Boolean eliminado) {

        List<Tarea> tareaList = null;

        tareaList = tareaRepositorio.obtenerTodos();

        modelo.addAttribute("tareasList", tareaList);
        modelo.addAttribute("eliminado", eliminado);

        return "tarea-todos";
    }
}
