package com.escom.tt.repositorio;

import com.escom.tt.modelo.Area;
import com.escom.tt.modelo.ColaboradorProyecto;
import com.escom.tt.modelo.Grado;
import com.escom.tt.modelo.Proyecto;
import com.escom.tt.modelo.TipoProyecto;
import com.escom.tt.modelo.Usuario;

import java.util.List;

/**
 * Created by darcusfenix on 15/09/15.
 */
public interface ProyectoRepositorio {
    Integer crear(Proyecto proyecto);
    
    void eliminar(Proyecto proyecto);

    Integer actualizar(Proyecto proyecto);

    Proyecto buscarPorId(Integer id);

    List<Proyecto> obtenerTodos();

    ColaboradorProyecto addColaborador(ColaboradorProyecto colaboradorProyecto);
    
    List<Proyecto> buscarPorCoordinador(Usuario coordinador);

    ColaboradorProyecto getColaborador(ColaboradorProyecto colaboradorProyecto);
    List<Proyecto> buscarPorProyecto(String proyectoUsuario);
    
    List<Proyecto> buscaTipoProyectoUsuario(int tipoProyecto, Usuario usu);
    
    List<Proyecto> buscaTipoProyecto(int tipoProyecto);
    
    List<Proyecto> obtenerTodosProyectosPorGradoMedSUp();
    
    List<Proyecto> obtenerTodosProyectosPorGradoSUp();
    
    List<Proyecto> obtenerProyectosPorArea(int idArea);
    
    
    
    
    
    
  
    
    
    
    
    
     boolean eliminarInvitacionColaborador(
			ColaboradorProyecto colaboradorProyecto);
     
}
