package com.intelmath.util.conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author agxel
 */
public class ConexionBD {
     private String driver, urlBD, userBD, passwordBD, bd;
    public Connection conexion;

    public ConexionBD() {
        driver = "com.mysql.jdbc.Driver";
        userBD = "root";
        passwordBD = "";
        bd = "intelmath";
        urlBD = "jdbc:mysql://localhost:3306/" + bd;

        try {

            Class.forName(driver).newInstance();
            conexion = DriverManager.getConnection(urlBD, userBD, passwordBD);
            System.out.println("¡Conexión OK!");

        } catch (Exception e) {
            System.out.println("Error al conectarse a la BD" + e.toString());
        }
    }

    public Connection ObtenerConexion() {
        return conexion;
    }

    public Connection CerrarConexion() throws SQLException {
        conexion.close();
        conexion = null;
        return conexion;
    }

    public static void main(String[] args) {
        new ConexionBD();
    }
    
}
