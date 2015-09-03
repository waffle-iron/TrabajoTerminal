package com.escom.tt.controlador;

import java.util.List;

import javax.validation.Valid;

import com.escom.tt.repositorio.EstadoRepositorio;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.escom.tt.modelo.Estado;


@Controller
public class EstadoControlador {

	@Autowired
	private EstadoRepositorio estadoRepositorio;
	
//http://localhost:8080/trabajoterminal/estado/crear
	@RequestMapping(value="/estado/crear", method = RequestMethod.GET)
	public String crear(Model modelo) {
		modelo.addAttribute("estado", new Estado());
		return "estado-crear";
	}

	
//http://localhost:8080/trabajoterminal/estado/guardar
	@RequestMapping(value="/estado/guardar", method = RequestMethod.POST)
	public String guardar(@ModelAttribute("estado") @Valid Estado estado, BindingResult validacion, Model modelo) {

		String ruta = null;		
		if (validacion.hasErrors()){
			modelo.addAttribute("estado", estado);
			ruta = "estado-crear";
		}else{
			Integer id = estadoRepositorio.crearEstado(estado);
			ruta = "redirect:/estado/ver/" + estado.getIdEstado() + "/?creado=true";
		}
		return ruta;
	}
//http://localhost:8080/trabajoterminal/estado/guardarCambios
	@RequestMapping(value="/estado/guardarCambios", method = RequestMethod.POST)
	public String guardarCambios(@ModelAttribute("estado") @Valid Estado estado, BindingResult validacion, Model modelo) {
			String ruta = null;

			if (validacion.hasErrors()){
				modelo.addAttribute("estado", estado);
				ruta = "estado-editar";
			}else{
				Integer id = estadoRepositorio.actualizarEstado(estado);
				ruta = "redirect:/estado/ver/" + estado.getIdEstado() + "/?actualizado=true";
			}
			return ruta;
		}
//http://localhost:8080/trabajoterminal/estado/NUMERO/editar
	@RequestMapping(value="/estado/{estadoId:[0-9]+}/editar", method = RequestMethod.GET)
	public String editar(@PathVariable Integer estadoId,Model modelo) {
		Estado estado = null;
		String ruta = null;
		estado = estadoRepositorio.buscarPorId(estadoId);

		if (estado != null) {
			modelo.addAttribute("estado", estado);
			ruta = "estado-editar";
		}
		else
			ruta = "redirect:/estado";

		return ruta;
	}
//http://localhost:8080/trabajoterminal/estado/ver/NUMERO
	@RequestMapping(value="/estado/ver/{estadoId:[0-9]+}")
	public String ver(@PathVariable Integer estadoId, Model modelo, Boolean actualizado, Boolean creado) {
		String ruta = null;
		Estado estado= null;

		estado = estadoRepositorio.buscarPorId(estadoId);
		if (estado!= null) {
			modelo.addAttribute("estado", estado);
			modelo.addAttribute("actualizado", actualizado);
			modelo.addAttribute("creado", creado);
			ruta = "estado-ver";
		}else
			ruta = "redirect:/estado";

		return ruta;
	}
//http://localhost:8080/trabajoterminal/estado/eliminar/NUMERO
	@RequestMapping(value="/estado/eliminar/{estadoId:[0-9]+}")
	public String eliminar(@PathVariable Integer estadoId, Model modelo) {

		estadoRepositorio.eliminarEstado(estadoRepositorio.buscarPorId(estadoId));
		modelo.addAttribute("mensaje", "Se ha eliminado el estado");
		return "estado-eliminar";
	}
//http://localhost:8080/trabajoterminal/estado
	@RequestMapping(value="/estado")
	public String verTodos(Model modelo) {

		List<Estado> estadoList = null;
		estadoList = estadoRepositorio.obtenerTodos();
		modelo.addAttribute("estados", estadoList);

		return "estado-todos";
	}

	
}
