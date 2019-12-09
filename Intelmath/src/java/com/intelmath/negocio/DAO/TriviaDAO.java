/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.DAO;

import com.intelmath.negocio.VO.TriviaVO;
import com.intelmath.util.InterfaceCRUD;
import com.intelmath.util.conexion.ConexionBD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author agxel
 */
public class TriviaDAO extends ConexionBD implements InterfaceCRUD {

     private Connection conexion = null;  //Se define los objetos basicos para operar en MySQL o elmentos operadores para base de datos
    private Statement puente = null;
    private ResultSet mensajero = null;
    private ResultSet mensajero1 = null;

    private String idTrivia = "";
    private String contenido = "";
    private String crud = "";
    private String resul = "";
    private int id;
    private int rand;
    private String rand1;

    private boolean operaciones = false;

    public TriviaDAO(TriviaVO triVO) {
        super();
        try {
            conexion = this.ObtenerConexion(); //Conexion para metodos genericos
            puente = conexion.createStatement();

            idTrivia = triVO.getIdTrivia();
            contenido = triVO.getContenido();
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        
    }
    public TriviaDAO(){}
   public ArrayList<TriviaVO> listar(){
        ConexionBD conexionbd = new ConexionBD();
        ArrayList<TriviaVO> trivia = new ArrayList<TriviaVO>();
        try {
         

            puente = conexionbd.ObtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from tbl_trivia  ORDER BY RAND() LIMIT 1;");

            while(mensajero.next()){
                TriviaVO triVO = new TriviaVO(mensajero.getString(1),mensajero.getString(2));
                trivia.add(triVO);
            }

                
            
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return trivia;

    }
    public ArrayList<TriviaVO> tabla() throws SQLException {

        ConexionBD conexionbd = new ConexionBD();
        ArrayList<TriviaVO> trivia = new ArrayList<TriviaVO>();
        try {
         

            puente = conexionbd.ObtenerConexion().createStatement();
            mensajero = puente.executeQuery("select * from tbl_trivia;");

            while(mensajero.next()){
                TriviaVO triVO = new TriviaVO(mensajero.getString(1),mensajero.getString(2));
                trivia.add(triVO);
            }

                
            
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return trivia;

    }
    
    
    

    @Override
    public boolean agregarRegistro() {
        crud="Insertar";
           try {
               CallableStatement prepa = conexion.prepareCall("{call sp_tbl_trivia(?,?,?)}");
               prepa.setString(1, null);
               prepa.setString(2, contenido);
               prepa.setString(3, crud);
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
        crud="Actualizar";
           try {
               CallableStatement prepa = conexion.prepareCall("{call sp_tbl_trivia(?,?,?)}");
               prepa.setString(1, idTrivia);
               prepa.setString(2, contenido);
               prepa.setString(3, crud);
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
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
