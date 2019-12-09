/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.util;

/**
 *
 * @author agxel
 */
public interface InterfaceCRUD {
    public abstract boolean agregarRegistro(); // Sirve para todos los registros del sistema
    public abstract boolean actualizarRegistro(); //Sirve para la actualizacion de todos los registros 
    public abstract boolean eliminarRegistro();
}
