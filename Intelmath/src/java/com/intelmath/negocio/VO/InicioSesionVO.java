/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.VO;

/**
 *
 * @author agxel
 */
public class InicioSesionVO {
     private String usuarioId;
    private String usuario;
    private String contrasena;
    private String nombre;
    private String apellido;
    private String correo;
    private String telefono;
    private String id_rol;

    public InicioSesionVO() {
    }
    public InicioSesionVO(String usuarioId, String usuario, String contrasena, String nombre, String apellido, String correo, String telefono, String id_rol) {
        this.usuarioId = usuarioId;
        this.usuario = usuario;
        this.contrasena = contrasena;
        this.nombre = nombre;
        this.apellido = apellido;
        this.correo = correo;
        this.telefono = telefono;
        this.id_rol = id_rol;
    }

    public String getUsuarioId() {
        return usuarioId;
    }

    public void setUsuarioId(String usuarioId) {
        this.usuarioId = usuarioId;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getContrasena() {
        return contrasena;
    }

    public void setContrasena(String contrasena) {
        this.contrasena = contrasena;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getCorreo() {
        return correo;
    }

    public void setCorreo(String correo) {
        this.correo = correo;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getId_rol() {
        return id_rol;
    }

    public void setId_rol(String id_rol) {
        this.id_rol = id_rol;
    }
}
