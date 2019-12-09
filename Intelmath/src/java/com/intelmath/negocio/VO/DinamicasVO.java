/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.VO;

/**
 *
 * @author APRENDIZ
 */
public class DinamicasVO {
    private String id_dinamicas,nombre, puntaje,id_usuario,id_tipo;

    public DinamicasVO(String id_dinamicas, String nombre, String puntaje, String id_usuario, String id_tipo) {
        this.id_dinamicas = id_dinamicas;
        this.nombre = nombre;
        this.puntaje = puntaje;
        this.id_usuario = id_usuario;
        this.id_tipo = id_tipo;
    }

    public DinamicasVO() {
    }

    public String getId_dinamicas() {
        return id_dinamicas;
    }

    public void setId_dinamicas(String id_dinamicas) {
        this.id_dinamicas = id_dinamicas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(String puntaje) {
        this.puntaje = puntaje;
    }

    public String getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(String id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getId_tipo() {
        return id_tipo;
    }

    public void setId_tipo(String id_tipo) {
        this.id_tipo = id_tipo;
    }

    
}
