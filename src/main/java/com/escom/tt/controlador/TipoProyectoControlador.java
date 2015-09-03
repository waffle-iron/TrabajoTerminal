package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.Tipo_proyecto;
import com.escom.tt.repositorio.TipoProyectoRepositorio;

@Controller
public class TipoProyectoControlador {
	
	@Autowired
	private TipoProyectoRepositorio tipoProyectoRepositorio;
	
	@RequestMapping(value="/tipoproyecto/crear", method = RequestMethod.GET)
	public String crear(Model modelo){
		modelo.addAttribute("tipoproyecto", new Tipo_proyecto());
		return "tipoproyecto-crear";
	}
	
	@RequestMapping(value="/tipoproyecto/guardar", method = RequestMethod.POST)
	public String guardar(@ModelAttribute("tipoproyecto") @Valid Tipo_proyecto tipoProyecto, BindingResult validacion, Model modelo){
		String ruta = null;
		 if (validacion.hasErrors()){
			 modelo.addAttribute("tipoproyecto", tipoProyecto);
			 ruta = "tipoproyecto-crear";
		 }else{
			 Integer id = tipoProyectoRepositorio.crearTipoProyecto(tipoProyecto);
			 ruta = "redirect:/tipoproyecto/ver/" + tipoProyecto.getIdTipoProyecto() + "/?creado=true";
		}
		return ruta;
	}
	
	@RequestMapping(value="/tipoproyecto/guardarCambios", method = RequestMethod.POST)
	public String guardarCambios(@ModelAttribute("tipoproyecto") @Valid Tipo_proyecto tipoProyecto, Model modelo, BindingResult validacion){
		String ruta = null;
		if (validacion.hasErrors()){
			modelo.addAttribute("tipoproyecto", tipoProyecto);
			ruta = "idioma-editar";
		}else{
			Integer id = tipoProyectoRepositorio.actualizarTipoProyecto(tipoProyecto);
			ruta = "redirect:/tipoproyecto/ver/" + tipoProyecto.getIdTipoProyecto() +"/?actualizado=true";
			
		}
		return ruta;
		
	}
	
	@RequestMapping(value="/tipoproyecto/{tipoProyectoId:[0-9]+}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable Integer tipoProyectoId, Model modelo){
		Tipo_proyecto tipoProyecto = null;
		String ruta =null;
		tipoProyecto = tipoProyectoRepositorio.buscarPorId(tipoProyectoId);
		
		if (tipoProyecto!=null){
			modelo.addAttribute("tipoproyecto", tipoProyecto);
			ruta = "tipoproyecto-editar";
		}
		
		else{
			ruta = "redirect:/tipoproyecto";
		}
		System.out.println(ruta);
		return ruta;
	}
	
	@RequestMapping(value="/tipoproyecto/ver/{tipoProyectoId:[0-9]}")
	public String ver(@PathVariable Integer tipoProyectoId, Model modelo, Boolean actualizado, Boolean creado){
		String ruta = null;
		Tipo_proyecto tipoProyecto = null;
		
		tipoProyecto = tipoProyectoRepositorio.buscarPorId(tipoProyectoId);
		if (tipoProyecto!=null){
			modelo.addAttribute("tipoproyecto", tipoProyecto);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "tipoproyecto-ver";
		}else{
			ruta = "redirect:/tipoproyecto";
		}
		return ruta;
		}
	
	@RequestMapping(value="/tipoproyecto/eliminar/{tipoProyectoId:[0-9]+}")
	public String eliminar (@PathVariable Integer tipoProyectoId, Model modelo){
		
		tipoProyectoRepositorio.eliminarTipoProyecto(tipoProyectoRepositorio.buscarPorId(tipoProyectoId));
		modelo.addAttribute("mensaje", "Se ha eliminado el idioma");
		return "idioma-eliminar";
	}
	
	@RequestMapping(value="/tipoproyecto")
	public String verTodos(Model modelo){
		List<Tipo_proyecto> tipoProyectoList = null;
		tipoProyectoList = tipoProyectoRepositorio.obtenerTodos();
		modelo.addAttribute("tiposproyecto", tipoProyectoList);
		return "tipoproyecto-todos";
	}
	
	

}
