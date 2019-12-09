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
public class TriviaVO {
     private String idTrivia;
    private String contenido;

    public TriviaVO(String idTrivia, String contenido) {
        this.idTrivia = idTrivia;
        this.contenido = contenido;
    }
    public TriviaVO(){
    }

    public String getIdTrivia() {
        return idTrivia;
    }

    public void setIdTrivia(String idTrivia) {
        this.idTrivia = idTrivia;
    }

    public String getContenido() {
        return contenido;
    }

    public void setContenido(String contenido) {
        this.contenido = contenido;
    }
}
