/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.DAO;

import com.intelmath.negocio.VO.InicioSesionVO;
import com.intelmath.util.InterfaceCRUD;
import com.intelmath.util.conexion.ConexionBD;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author agxel
 */
public class InicioSesionDAO extends ConexionBD implements InterfaceCRUD {

    private Connection conexion = null;  //Se define los objetos basicos para operar en MySQL o elmentos operadores para base de datos
    private Statement puente = null;
    private ResultSet mensajero = null;

    private String usuarioId = "";
    private String usuario = "";
    private String contrasena = "";
    private String nombre = "";
    private String apellido = "";
    private String correo = "";
    private String telefono = "";
    private String id_rol = "";
    private String crud = "";

    private boolean operaciones = false;

    public InicioSesionDAO(InicioSesionVO sesionVO) {
        super(); //hace una sobrecarga, llamma al constructor
        try {

            conexion = this.ObtenerConexion(); //Conexion para metodos genericos
            puente = conexion.createStatement();

            usuarioId = sesionVO.getUsuarioId();
            usuario = sesionVO.getUsuario();
            contrasena = sesionVO.getContrasena();
            nombre = sesionVO.getNombre();
            apellido = sesionVO.getApellido();
            correo = sesionVO.getCorreo();
            telefono = sesionVO.getTelefono();
            id_rol = sesionVO.getId_rol();

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());

        }
    }

    public InicioSesionDAO() {
    }

    public boolean usuario(String usuario) {
        try {
            conexion = this.ObtenerConexion();
            puente = conexion.createStatement();
            mensajero = puente.executeQuery("Select usuario from tbl_usuario where usuario='" + usuario + "'");
            if (mensajero.next()) {
                operaciones = true;
            }
        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operaciones;
    }
    public boolean confirmarCorreo(String usuario) {
        try {
            conexion = this.ObtenerConexion();
            puente = conexion.createStatement();
            mensajero = puente.executeQuery("Select * from tbl_usuario where correo_electronico='" + usuario + "'");
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
        crud = "insertar";
        try { //Todoas las operaciones van en un try catch
            CallableStatement cst = conexion.prepareCall("{call sp_tbl_usuario (?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, usuarioId);
            cst.setString(2, usuario);
            cst.setString(3, contrasena);
            cst.setString(4, nombre);
            cst.setString(5, apellido);
            cst.setString(6, correo);
            cst.setString(7, telefono);
            cst.setString(8, id_rol);
            cst.setString(9, crud);
            operaciones = true;
            try {
                cst.execute();
            } catch (Exception e) {
                System.out.println("¡Error!" + e.toString());
            }

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operaciones;
    }

    public boolean ValidarIngreso() {
        crud = "validar";
        try { //Todoas las operaciones van en un try catch
            CallableStatement cst = conexion.prepareCall("{call sp_tbl_usuario (?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, usuario);
            cst.setString(3, contrasena);
            cst.setString(4, null);
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setString(8, null);
            cst.setString(9, crud);
            cst.execute();
            final ResultSet ms = cst.getResultSet();
            if (ms.next()) {
                operaciones=true;
            }
            

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operaciones;

    }

    public static InicioSesionVO sesion(String usuario) {
        InicioSesionVO isVO = null;
        try {
            ConexionBD conexionbd = new ConexionBD();
            Connection conexion = conexionbd.ObtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("SELECT usu.id_usuario,"
                    + "usu.usuario,usu.contraseña,usu.nombre,usu.apellido,"
                    + "usu.correo_electronico, usu.telefono, rol.rol "
                    + "FROM tbl_usuario as usu, tbl_rol as rol WHERE "
                    + "usu.usuario = '" + usuario + "' and rol.id_rol=usu.id_rol;");
            while (mensajero.next()) {
                isVO = new InicioSesionVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));
            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("Error en: " + e.toString());
        }
        return isVO;
    }
    public static InicioSesionVO sesionCorreo(String usuario) {
        InicioSesionVO isVO = null;
        try {
            ConexionBD conexionbd = new ConexionBD();
            Connection conexion = conexionbd.ObtenerConexion();
            Statement puente = conexion.createStatement();

            ResultSet mensajero = puente.executeQuery("SELECT usu.id_usuario,"
                    + "usu.usuario,usu.contraseña,usu.nombre,usu.apellido,"
                    + "usu.correo_electronico, usu.telefono, rol.rol "
                    + "FROM tbl_usuario as usu, tbl_rol as rol WHERE "
                    + "usu.correo_electronico = '" + usuario + "' and rol.id_rol=usu.id_rol;");
            while (mensajero.next()) {
                isVO = new InicioSesionVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));
            }
            mensajero.close();
            puente.close();

        } catch (Exception e) {
            System.out.println("Error en: " + e.toString());
        }
        return isVO;
    }

    @Override
    public boolean actualizarRegistro() {
        crud = "Actualizar";
        try { //Todoas las operaciones van en un try catch
            CallableStatement cst = conexion.prepareCall("{call sp_tbl_usuario (?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, usuarioId);
            cst.setString(2, usuario);
            cst.setString(3, contrasena);
            cst.setString(4, nombre);
            cst.setString(5, apellido);
            cst.setString(6, correo);
            cst.setString(7, telefono);
            cst.setString(8, id_rol);
            cst.setString(9, crud);
            operaciones = true;
            try {
                cst.execute();
            } catch (Exception e) {
                System.out.println("¡Error!" + e.toString());
            }

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operaciones;
    }

    public boolean cambiarContraseña() {
        crud = "contraseña";
        try { //Todoas las operaciones van en un try catch
            CallableStatement cst = conexion.prepareCall("{call sp_tbl_usuario (?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, usuario);
            cst.setString(3, contrasena);
            cst.setString(4, null);
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setString(8, null);
            cst.setString(9, crud);
            operaciones = true;
            try {
                cst.execute();
            } catch (Exception e) {
                System.out.println("¡Error!" + e.toString());
            }

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operaciones;
    }

    public boolean CambiarRol() {
        crud = "rol";
        try { //Todoas las operaciones van en un try catch
            CallableStatement cst = conexion.prepareCall("{call sp_tbl_usuario (?,?,?,?,?,?,?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, usuario);
            cst.setString(3, null);
            cst.setString(4, null);
            cst.setString(5, null);
            cst.setString(6, null);
            cst.setString(7, null);
            cst.setString(8, id_rol);
            cst.setString(9, crud);
            operaciones = true;
            try {
                cst.execute();
            } catch (Exception e) {
                System.out.println("¡Error!" + e.toString());
            }

        } catch (Exception e) {
            System.out.println("¡Error!" + e.toString());
        }
        return operaciones;
    }

    public ArrayList<InicioSesionVO> listar() {
        ConexionBD conexionbd = new ConexionBD();
        ArrayList<InicioSesionVO> listarUsuario = new ArrayList<InicioSesionVO>();
        try {
            puente = conexionbd.ObtenerConexion().createStatement();
            mensajero = puente.executeQuery("SELECT usu.id_usuario,"
                    + "usu.usuario,usu.contraseña,usu.nombre,usu.apellido,"
                    + "usu.correo_electronico, usu.telefono, rol.rol "
                    + "FROM tbl_usuario as usu, tbl_rol as rol WHERE  rol.id_rol=usu.id_rol;");
            while (mensajero.next()) {
                InicioSesionVO isVO = new InicioSesionVO(mensajero.getString(1), mensajero.getString(2), mensajero.getString(3), mensajero.getString(4), mensajero.getString(5), mensajero.getString(6), mensajero.getString(7), mensajero.getString(8));
                listarUsuario.add(isVO);
            }
        } catch (Exception e) {
        }
        return listarUsuario;
    }

    @Override
    public boolean eliminarRegistro() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
