/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.DAO;

import com.intelmath.negocio.VO.DinamicasVO;
import com.intelmath.util.InterfaceCRUD;
import com.intelmath.util.conexion.ConexionBD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author APRENDIZ
 */
public class DinamicaDAO extends ConexionBD implements InterfaceCRUD {

    public Connection conexion = null;
    public Statement puente = null;
    public ResultSet mensajero = null;
    public PreparedStatement ps = null;

    private String id_dinamicas, nombre, puntaje, id_usuario, id_tipo,crud;

    private boolean operaciones = false;

    public DinamicaDAO(DinamicasVO diVO) {
        super();
        try {
            conexion = this.ObtenerConexion();
            puente = conexion.createStatement();
            id_dinamicas = diVO.getId_dinamicas();
            nombre = diVO.getNombre();
            puntaje = diVO.getPuntaje();
            id_usuario = diVO.getId_usuario();
            id_tipo = diVO.getId_tipo();
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
    }
    public DinamicaDAO(){}

    public boolean buscar(String nombre, String usuario){
        try {
            conexion = this.ObtenerConexion();
            puente = conexion.createStatement();
            mensajero = puente.executeQuery("SELECT * FROM `tbl_dinamicas`"
                    + " WHERE nombre='"+nombre+"' and id_usuario='"+usuario+"' ");
            if (mensajero.next()) {
                operaciones = true;
            }
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        
        return operaciones;
    }
    
    @Override
    public boolean agregarRegistro() {
        crud = "Insertar";
        try {
            CallableStatement prepa = conexion.prepareCall("{call sp_tbl_dinamicas(?,?,?,?,?,?)}");
            prepa.setString(1, null);
            prepa.setString(2, nombre);
            prepa.setString(3, puntaje);
            prepa.setString(4, id_usuario);
            prepa.setString(5, id_tipo);
            prepa.setString(6, crud);
            operaciones = true;
            try {
                prepa.execute();
            } catch (Exception e) {
                System.out.println("errorProcedimiento" + e);
            }

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return operaciones;
    }

    @Override
    public boolean actualizarRegistro() {
        crud = "Actualizar";
        try {
            CallableStatement prepa = conexion.prepareCall("{call sp_tbl_dinamicas(?,?,?,?,?,?)}");
            prepa.setString(1, null);
            prepa.setString(2, nombre);
            prepa.setString(3, puntaje);
            prepa.setString(4, id_usuario);
            prepa.setString(5, id_tipo);
            prepa.setString(6, crud);
            operaciones = true;
            try {
                prepa.execute();
            } catch (Exception e) {
                System.out.println("errorProcedimiento" + e);
            }

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        return operaciones;
    }
    public ArrayList<DinamicasVO> listar(String id_usuario){
         ConexionBD conexionbd = new ConexionBD();
         ArrayList<DinamicasVO> listarJuegos = new ArrayList<DinamicasVO>();
         
        try {
            puente = conexionbd.ObtenerConexion().createStatement();
            mensajero = puente.executeQuery("select id_dinamicas,d.nombre as 'Nombre del juego', puntaje, d.id_usuario,t.nombre 'Tipo de juego' from tbl_dinamicas d, tbl_usuario u, tbl_tipo t where d.id_usuario=u.id_usuario and d.id_tipo=t.id_tipo and d.id_usuario='"+id_usuario+"';");
            if (mensajero.next()) {
                DinamicasVO diVO = new DinamicasVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5));
                listarJuegos.add(diVO);
            }

        } catch (Exception e) {
            System.out.println("Error" + e.toString());
        }
        
            
        
         return listarJuegos;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
