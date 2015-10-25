package com.escom.tt.controlador;

import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Invitacion;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.Usuario;
import com.escom.tt.repositorio.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;

import javax.validation.Valid;

import java.security.Principal;
import java.security.Principal;
import java.util.Date;
import java.util.Iterator;
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

    @Autowired
    private InvitacionRepositorio invitacionRepositorio;
    
    @Autowired    
    private BusquedaRepositorio busquedaRepositorio;
    
    


    @RequestMapping(value="/proyecto/crear", method = RequestMethod.GET)
    public String crear(Principal principal, Model modelo){
    	Usuario coordinador =  null;
    	String email=principal.getName();
    	coordinador = busquedaRepositorio.buscarPorEmail(email);
    	modelo.addAttribute("coordinadorX",coordinador.getIdUsuarios());
        modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
        modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
        modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
        modelo.addAttribute("proyecto", new Proyecto());
        modelo.addAttribute("nombre",principal.getName());
        return "proyecto/proyecto-crear";
    }

    @RequestMapping(value="/proyecto/crear", method = RequestMethod.POST)
    public String crear(@ModelAttribute("proyecto") @Valid Proyecto proyecto, BindingResult validacion, Model modelo, Principal principal) {
        String ruta = null;    	
        

        if (validacion.hasErrors()){
        	List<ObjectError> error= validacion.getAllErrors();
        	for (ObjectError objectError : error) {
				System.out.println(objectError);
			}
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            modelo.addAttribute("nombre",principal.getName());

            ruta = "proyecto/proyecto-crear";
        }else{

        	proyectoRepositorio.crear(proyecto);

            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto()+ "/?creado=true";
        }
        return ruta;
    }


    @RequestMapping(value="/proyecto/guardarCambios", method = RequestMethod.POST)
    public String actualizar(@ModelAttribute("proyecto") @Valid Proyecto proyecto, BindingResult validacion, Model modelo, Principal principal) {
        String ruta = null;

        if (validacion.hasErrors()){
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("nombre",principal.getName());
            ruta = "proyecto/proyecto-editar";
        }else{
            Integer id = proyectoRepositorio.actualizar(proyecto);
            modelo.addAttribute("nombre",principal.getName());            
            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto() + "/?actualizado=true";
        }
        return ruta;
    }

    @RequestMapping(value="/proyecto/{proyectoId:[0-9]+}/editar", method = RequestMethod.GET)
    public String actualizar(@PathVariable Integer proyectoId,Model modelo, Principal principal) {
    	Usuario coordinador =  null;
    	String email=principal.getName();
    	coordinador = busquedaRepositorio.buscarPorEmail(email);
    	modelo.addAttribute("coordinadorX",coordinador.getIdUsuarios());
        
    	Proyecto proyecto = null;
        String ruta = null;
        proyecto = proyectoRepositorio.buscarPorId(proyectoId);
        proyecto.setCoordinador(coordinador);
        if (proyecto != null) {
            modelo.addAttribute("tipoProyectoList", tipoProyectoRepositorio.obtenerTodos());
            modelo.addAttribute("estadoList", estadoRepositorio.obtenerTodos());
            modelo.addAttribute("coordinadorId",coordinador.getIdUsuarios());            
//            modelo.addAttribute("cordinadorList", usuarioRepositorio.obtenerTodos());
            
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("nombre",principal.getName());
            ruta = "proyecto/proyecto-editar";
        }
        else
            ruta = "redirect:/proyecto";

        return ruta;
    }

    @RequestMapping(value="/proyecto/ver/{proyectoId:[0-9]+}")
    public String ver(@PathVariable Integer proyectoId, Model modelo, Boolean actualizado, Boolean creado, Principal principal) {
        String ruta = null;
        Proyecto proyecto= null;

        proyecto = proyectoRepositorio.buscarPorId(proyectoId);
        if (proyecto != null) {
            modelo.addAttribute("proyecto", proyecto);
            modelo.addAttribute("actualizado", actualizado);
            modelo.addAttribute("creado", creado);
            modelo.addAttribute("nombre",principal.getName());
        	modelo.addAttribute("proyecto",proyecto);
            modelo.addAttribute("nombre",principal.getName());

            ruta = "proyecto/proyecto-ver";
        }else
            ruta = "redirect:/proyecto";

        return ruta;
    }

    @RequestMapping(value="/proyecto/eliminar/{proyectoId:[0-9]+}")
    public String eliminar(@PathVariable Integer proyectoId, Model modelo, Principal principal) {
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
    public String verTodos(Model modelo,Boolean eliminado, Principal principal) {
    	
    	
    	String email= principal.getName();
    	
    	List<Proyecto> proyectosDeCoordinador = null;
    	Usuario usuarioTemp=busquedaRepositorio.buscarPorEmail(email);
    	proyectosDeCoordinador=busquedaRepositorio.buscarPorCoordinador(usuarioTemp);
    	
        //List<Proyecto> proyectoList = null;
        //proyectoList = proyectoRepositorio.obtenerTodos();

        modelo.addAttribute("proyectosList", proyectosDeCoordinador);
        modelo.addAttribute("eliminado", eliminado);
        modelo.addAttribute("nombre",principal.getName());
        modelo.addAttribute("idd",email);
        
        
        return "proyecto/proyecto-todos";
    }

    @RequestMapping(value="/proyecto/test-add-colaborador")
    public String addColaborador(Model modelo,Boolean eliminado) {

        Usuario usuario = usuarioRepositorio.buscarPorId(1);
        Proyecto proyecto = proyectoRepositorio.buscarPorId(1);
        ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(proyecto, usuario);
        proyectoRepositorio.addColaborador(colaboradorProyecto);

        return "proyecto/proyecto-todos";
    }

    @RequestMapping(value="/proyecto/{proyectoId:[0-9]+}/invitar/{invitarUsuario:[0-9]+}", method = RequestMethod.GET)
    public String invitar(@PathVariable Integer proyectoId,@PathVariable Integer invitarUsuario, Model modelo, Boolean invitado, Principal principal) {
        String ruta = null;
        Proyecto proyecto= null;
        Usuario usuarioAInvitar = null;
        List<ColaboradorProyecto> colaboradores = null;

        proyecto = proyectoRepositorio.buscarPorId(proyectoId);
        usuarioAInvitar = usuarioRepositorio.buscarPorId(invitarUsuario);

        // valida que el coordinador sea el mismo de la sesión
        if (proyecto != null && principal.getName().equals(proyecto.getCoordinador().getEmail()) ) {

            ColaboradorProyecto colaboradorProyecto = new ColaboradorProyecto(proyecto, usuarioAInvitar);
            Invitacion invitacion = new Invitacion();
            invitacion.setEstado(1);
            invitacion.setFecha(new Date());
            invitacion.setColaboradorProyecto(colaboradorProyecto);

            //valida si el usuario ya está como colaborador
            colaboradores = proyecto.getColaboradorProyectos();
            boolean estaColaborador = false;
            for(Iterator<ColaboradorProyecto> colaborador = colaboradores.iterator(); colaborador.hasNext(); ) {
                if(colaborador.next().getUsuario().getIdUsuarios() == invitarUsuario){
                    modelo.addAttribute("mensaje", "el usuario ya está como colaborador en el proyecto");
                    estaColaborador = true;
                }
            }

            if(!estaColaborador){
                proyectoRepositorio.addColaborador(colaboradorProyecto);
            }

            invitacionRepositorio.crear(invitacion);


            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto() + "?invitado=true";
        }else
            ruta = "redirect:/proyecto/ver/" + proyecto.getIdProyecto() + "?invitado=false";

        return ruta;
    }

}
