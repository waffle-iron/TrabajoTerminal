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

import com.escom.tt.modelo.Grado;
import com.escom.tt.repositorio.GradoRepositorio;

@Controller
public class GradoControlador {

	@Autowired
	private GradoRepositorio gradoRepositorio;
	
	//http://localhost:8080/trabajoterminal/grado/crear
		@RequestMapping(value="/grado/crear", method = RequestMethod.GET)
		public String crear(Model modelo) {
			modelo.addAttribute("grado", new Grado());
			return "grado-crear";
		}
	//http://localhost:8080/trabajoterminal/grado/guardar
		@RequestMapping(value="/grado/guardar", method = RequestMethod.POST)
		public String guardar(@ModelAttribute("grado") @Valid Grado grado, BindingResult validacion, Model modelo) {
			String ruta = null;
			
			if (validacion.hasErrors()){
				modelo.addAttribute("grado", grado);
				ruta = "grado-crear";
			}else{
				Integer id = gradoRepositorio.crearGrado(grado);
				ruta = "redirect:/grado/ver/" + grado.getIdGrado()+ "/?creado=true";
			}
			return ruta;
		}
	//http://localhost:8080/trabajoterminal/grado/guardarCambios
		
		@RequestMapping(value="/grado/guardarCambios", method = RequestMethod.POST)
		public String guardarCambios(@ModelAttribute("grado") @Valid Grado grado, BindingResult validacion, Model modelo) {
			String ruta = null;

			if (validacion.hasErrors()){
				modelo.addAttribute("grado", grado);
				ruta = "grado-editar";
			}else{
				Integer id = gradoRepositorio.actualizarGrado(grado);
				ruta = "redirect:/grado/ver/" + grado.getIdGrado() + "/?actualizado=true";
			}
			return ruta;
		}
	//http://localhost:8080/trabajoterminal/grado/NUMERO/editar
		@RequestMapping(value="/grado/{gradoId:[0-9]+}/editar", method = RequestMethod.GET)
		public String editar(@PathVariable Integer gradoId,Model modelo) {
			Grado grado = null;
			String ruta = null;
			grado = gradoRepositorio.buscarPorId(gradoId);

			if (grado != null) {
				modelo.addAttribute("grado", grado);
				ruta = "grado-editar";
			}
			else
				ruta = "redirect:/grado";

			return ruta;
		}
	//http://localhost:8080/trabajoterminal/idioma/ver/NUMERO
		@RequestMapping(value="/grado/ver/{gradoId:[0-9]+}")
		public String ver(@PathVariable Integer gradoId, Model modelo, Boolean actualizado, Boolean creado) {
			String ruta = null;
			Grado grado = null;

			grado = gradoRepositorio.buscarPorId(gradoId);
			if (grado != null) {
				modelo.addAttribute("grado", grado);
				modelo.addAttribute("actualizado", actualizado);
				modelo.addAttribute("creado", creado);
				ruta = "grado-ver";
			}else
				ruta = "redirect:/grado";

			return ruta;
		}
	//http://localhost:8080/trabajoterminal/grado/eliminar/NUMERO
		@RequestMapping(value="/grado/eliminar/{gradoId:[0-9]+}")
		public String eliminar(@PathVariable Integer gradoId, Model modelo) {

			gradoRepositorio.eliminarGrado(gradoRepositorio.buscarPorId(gradoId));
			modelo.addAttribute("mensaje", "Se ha eliminado el grado");
			return "grado-eliminar";
		}
	//http://localhost:8080/trabajoterminal/grado/
		@RequestMapping(value="/grado")
		public String verTodos(Model modelo) {

			List<Grado> gradoList = null;

			gradoList = gradoRepositorio.obtenerTodos();

			modelo.addAttribute("grados", gradoList);

			return "grado-todos";
		}
}
