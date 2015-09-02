package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.escom.tt.modelo.Estado;
import com.escom.tt.modelo.Idioma;
import com.escom.tt.repositorio.EstadoRepositorio;

@Controller
public class EstadoControlador {

	@Autowired
	private EstadoRepositorio estadoRepositorio;
	
	@RequestMapping(value="/estado/crear", method=RequestMethod.GET)
	public String crearEstado(Model modelo){
		modelo.addAttribute("estado", new Estado());
		return "estado-crear";
	}
	@RequestMapping(value="/estado/guardar", method=RequestMethod.POST)
	public String guardar(@ModelAttribute("estado") @Valid Estado estado, BindingResult validacion, Model modelo){
		String ruta = null;
		if (validacion.hasErrors()) {
			modelo.addAttribute("estado",estado);
			ruta ="estado-crear";
		} else {
			Integer id=estadoRepositorio.crearEstado(estado);
			ruta="redirect:/estado/ver/" + estado.getIdEstado()+ "/?creado=true";
		}
		return ruta;
	} 
	@RequestMapping(value="/estado/ver/{estadoId:[0-9]+}")
	public String ver(@PathVariable Integer estadoId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Estado estado= null;

		estado= estadoRepositorio.buscaPorId(estadoId);
		if (estado != null) {
			modelo.addAttribute("estado", estado);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "estado-ver";
		}else
			ruta = "redirect:/estado";

		return ruta;
	}
	
	@RequestMapping(value="/estado/guardarCambios", method=RequestMethod.POST)
	public String guardarCambios (@ModelAttribute("estado") @Valid Estado estado, BindingResult validacion, Model modelo){
		String ruta = null;
		if (validacion.hasErrors()) {
			modelo.addAttribute("estado", estado);
			ruta= "estado-editar";
		} else {
			Integer id=estadoRepositorio.actualizarEstado(estado);
			ruta="redirect:/estado/ver"+estado.getIdEstado()+"?actualizado=true";
		}
		return ruta;
	}
	@RequestMapping(value="/estado/{idEstado:[0-9]+}/editar", method= RequestMethod.GET)
	public String editar(@PathVariable  Integer idEstado, Model modelo){
		Estado estado = null;
		String ruta = null;
		estado=estadoRepositorio.buscaPorId(idEstado);
		if (estado!=null) {
			modelo.addAttribute("estado", estado);
			ruta = "estado-editar";
		} else {
			ruta = "redirect:/estado";
		}
		return ruta;
	}
	@RequestMapping(value="/estado/eliminar/{idEstado:[0-9]+}")
	public String eliminar( @PathVariable Integer idEstado, Model modelo){
		estadoRepositorio.eliminarEstado(estadoRepositorio.buscaPorId(idEstado));
		modelo.addAttribute("mensaje","Se ha eliminado el estado" );
		return "estado-eliminar";
	}
	@RequestMapping(value="/estado")
	public String verTodos(Model modelo){
		List<Estado> estadoList = null;
		estadoList=estadoRepositorio.obtenerTodos();
		modelo.addAttribute("estados", estadoList);
		return "estado-todos";
	}
	
}
