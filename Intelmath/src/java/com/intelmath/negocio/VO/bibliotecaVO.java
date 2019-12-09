/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.negocio.VO;

/**
 *
 * @author John
 */
public class bibliotecaVO {
     String id_biblioteca;
    String titulo;
    String descripcion;
    String tipo;
    String usuario;
    
    public bibliotecaVO(String id_bilioteca, String titulo, String descripcion, String tipo, String usuario){
        this.id_biblioteca = id_bilioteca;
        this.titulo = titulo;
        this.descripcion = descripcion;
        this.tipo = tipo;
        this.usuario = usuario;
    }
    
    public bibliotecaVO(){
    
}
  
    public String getId_biblioteca() {
        return id_biblioteca;
    }

    public void setId_biblioteca(String id_biblioteca) {
        this.id_biblioteca = id_biblioteca;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }
    
}
