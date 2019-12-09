/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.DAO;

import com.intelmath.negocio.VO.bibliotecaVO;
import com.intelmath.util.conexion.ConexionBD;
import java.io.ByteArrayInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author John
 */
public class bibliotecaDAO extends ConexionBD{
    
   public Connection conexion = null;
    public Statement puente = null;
    public ResultSet mensajero = null;
    public PreparedStatement ps = null; 
    

    private String id_biblioteca = "";
    private String titulo = "";
    private String descripcion = "";
    private String tipo = "";
    private String usuario = "";
    private String crud="";
    
    private boolean operaciones = false;
    
    public bibliotecaDAO(bibliotecaVO bibVO) {  //Metodo constructor, que tiene como parametro la instacia con UsuarioVO

        super(); //hace una sobrecarga, llama al constructor
        try {

            conexion = this.ObtenerConexion(); //Conexion para metodos genericos
            puente = conexion.createStatement();

            id_biblioteca = bibVO.getId_biblioteca();
            titulo = bibVO.getTitulo();
            descripcion = bibVO.getDescripcion();
            tipo = bibVO.getTipo();
            usuario = bibVO.getUsuario();;

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());

        }
    }

       public boolean agregarRegistro() {
           crud="Insertar";
           try {
               CallableStatement prepa = conexion.prepareCall("{call sp_tbl_biblioteca(?,?,?,?,?,?)}");
               prepa.setString(1, null);
               prepa.setString(2, titulo);
               prepa.setString(3, descripcion);
               prepa.setString(4, tipo);
               prepa.setString(5, usuario);
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
       
        public boolean actualizarRegistro() {
            crud="Actualizar";
           try {
               CallableStatement prepa = conexion.prepareCall("{call sp_tbl_biblioteca(?,?,?,?,?,?)}");
               prepa.setString(1, id_biblioteca);
               prepa.setString(2, titulo);
               prepa.setString(3, descripcion);
               prepa.setString(4, tipo);
               prepa.setString(5, usuario);
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
        
         public boolean eliminarRegistro() {
        crud="Eliminar";
           try {
               CallableStatement prepa = conexion.prepareCall("{call sp_tbl_biblioteca(?,?,?,?,?,?)}");
               prepa.setString(1, null);
               prepa.setString(2, titulo);
               prepa.setString(3, null);
               prepa.setString(4, null);
               prepa.setString(5, null);
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
         
         
         public boolean libro(String titulo){
        try {
            conexion = this.ObtenerConexion();
            puente = conexion.createStatement();
            mensajero = puente.executeQuery("Select titulo from tbl_biblioteca where titulo='"+titulo+"';");
            if (mensajero.next()) {
                operaciones = true;
            }
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
       return operaciones;
    }
    
}
