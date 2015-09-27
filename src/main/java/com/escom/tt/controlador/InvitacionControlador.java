package com.escom.tt.controlador;

import com.escom.tt.modelo.Invitacion;
import com.escom.tt.repositorio.InvitacionRepositorio;
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
public class InvitacionControlador {

    @Autowired
    private InvitacionRepositorio invitacionRepositorio;


    @RequestMapping(value="/invitacion/crear", method = RequestMethod.GET)
    public String crear(Model modelo){

        modelo.addAttribute("invitacion", new Invitacion());

        return "invitacion/invitacion-crear";
    }

    @RequestMapping(value="/invitacion/crear", method = RequestMethod.POST)
    public String crear(@ModelAttribute("invitacion") @Valid Invitacion invitacion, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("invitacion", invitacion);
            ruta = "invitacion/invitacion-crear";
        }else{
            Integer id = invitacionRepositorio.crear(invitacion);
            ruta = "redirect:/invitacion/ver/" + invitacion.getIdInvitacion()+ "/?creado=true";
        }
        return ruta;
    }


    @RequestMapping(value="/invitacion/guardarCambios", method = RequestMethod.POST)
    public String actualizar(@ModelAttribute("invitacion") @Valid Invitacion invitacion, BindingResult validacion, Model modelo) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("invitacion", invitacion);
            ruta = "invitacion/invitacion-editar";
        }else{
            Integer id = invitacionRepositorio.actualizar(invitacion);
            ruta = "redirect:/invitacion/ver/" + invitacion.getIdInvitacion() + "/?actualizado=true";
        }
        return ruta;
    }

    @RequestMapping(value="/invitacion/{invitacionId:[0-9]+}/editar", method = RequestMethod.GET)
    public String actualizar(@PathVariable Integer invitacionId,Model modelo) {
        Invitacion invitacion = null;
        String ruta = null;
        invitacion = invitacionRepositorio.buscarPorId(invitacionId);

        if (invitacion != null) {
            modelo.addAttribute("invitacion", invitacion);
            ruta = "invitacion/invitacion-editar";
        }
        else
            ruta = "redirect:/invitacion";

        return ruta;
    }

    @RequestMapping(value="/invitacion/ver/{invitacionId:[0-9]+}")
    public String ver(@PathVariable Integer invitacionId, Model modelo, Boolean actualizado, Boolean creado) {
        String ruta = null;
        Invitacion invitacion= null;

        invitacion = invitacionRepositorio.buscarPorId(invitacionId);
        if (invitacion != null) {
            modelo.addAttribute("invitacion", invitacion);
            modelo.addAttribute("actualizado", actualizado);
            modelo.addAttribute("creado", creado);
            ruta = "invitacion/invitacion-ver";
        }else
            ruta = "redirect:/invitacion";

        return ruta;
    }

    @RequestMapping(value="/invitacion/eliminar/{invitacionId:[0-9]+}")
    public String eliminar(@PathVariable Integer invitacionId, Model modelo) {
        Boolean eliminado;
        Invitacion invitacion = null;
        invitacion = invitacionRepositorio.buscarPorId(invitacionId);

        if(invitacion != null){
            invitacionRepositorio.eliminar(invitacion);
            eliminado = true;
        }else{
            eliminado = false;
        }

        return "redirect:/invitacion?eliminado=" + eliminado;
    }

    @RequestMapping(value="/invitacion")
    public String verTodos(Model modelo,Boolean eliminado) {

        List<Invitacion> invitacionList = null;

        invitacionList = invitacionRepositorio.obtenerTodos();

        modelo.addAttribute("invitacionsList", invitacionList);
        modelo.addAttribute("eliminado", eliminado);

        return "invitacion/invitacion-todos";
    }

}
