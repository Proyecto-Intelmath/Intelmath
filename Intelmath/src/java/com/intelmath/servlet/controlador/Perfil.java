/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.servlet.controlador;

import com.intelmath.negocio.DAO.InicioSesionDAO;
import com.intelmath.negocio.VO.InicioSesionVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author agxel
 */
@WebServlet(name = "NewServlet", urlPatterns = {"/Perfil"})
public class Perfil extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession miSession = (HttpSession) request.getSession();

        InicioSesionVO usuario1 = (InicioSesionVO) miSession.getAttribute("usuario");

        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String IdUsuario = request.getParameter("usuID");
        String usuario = usuario1.getUsuario();
        String contraseña = request.getParameter("contra");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String rol = request.getParameter("rol");

        InicioSesionVO isVO = new InicioSesionVO(IdUsuario, usuario, contraseña, nombre, apellido, correo, telefono, rol);
        InicioSesionDAO isDAO = new InicioSesionDAO(isVO);

        switch (opcion) {
            case 1:
                if (isDAO.actualizarRegistro()) {
                    request.getSession(true);
                    InicioSesionVO sesion = InicioSesionDAO.sesion(usuario);
                    miSession.setAttribute("usuario", sesion);
                    request.setAttribute("mensajeExito", "¡Los datos personales fueron actualizados correctamente!");
                    request.getRequestDispatcher("_pagina/Perfil.jsp").forward(request, response);
                   
                } else {
                    request.setAttribute("mensajeError", "¡Es imposible actualizar los datos personales!");
                    request.getRequestDispatcher("_paginas/modificarPerfil.jsp").forward(request, response);
                    
                }
                break;
            case 2:
                if (isDAO.cambiarContraseña()) {
                    request.getSession(true);
                    InicioSesionVO sesion = InicioSesionDAO.sesion(usuario);
                    miSession.setAttribute("usuario", sesion);
                    request.setAttribute("mensajeExito", "¡La contraseña fue actulizada correctamente!");
                    request.getRequestDispatcher("_pagina/Perfil.jsp").forward(request, response);
                    
                   
                    
                } else {
                    request.setAttribute("mensajeError", "¡Es imposible modificar la contrasela");
                    request.getRequestDispatcher("_pagina/cambioContrasena").forward(request, response);
                }
                break;
            case 3:
                usuario = request.getParameter("usuario");
                InicioSesionVO isvo = InicioSesionDAO.sesion(usuario);
                if (isvo != null) {
                    request.setAttribute("isvo", isvo);
                    request.getRequestDispatcher("_pagina/actualizarRol.jsp").forward(request, response);

                } else {
                    
                    request.setAttribute("mensajeError", "El usuario que ingreso, no existe");
                    request.getRequestDispatcher("_pagina/CambiarRol.jsp").forward(request, response);
                }

                break;
            case 4:

                InicioSesionVO isVO1 = new InicioSesionVO(IdUsuario, (String) miSession.getAttribute("isVO"), contraseña, nombre, apellido, correo, telefono, rol);
                InicioSesionDAO isDAO1 = new InicioSesionDAO(isVO1);
                if (isDAO1.CambiarRol()) {
                    request.getSession(true);
                    InicioSesionVO sesion = InicioSesionDAO.sesion(usuario);
                    miSession.setAttribute("usuario", sesion);
                    request.setAttribute("mensajeExito", "¡El rol del usuario, fue modificador correctamente!");
                    request.getRequestDispatcher("_pagina/CambiarRol.jsp").forward(request, response);
                } else {
                    request.setAttribute("mensajeError", "¡Es imposible modificar el rol del usuario");
                    request.getRequestDispatcher("_pagina/actualizarRol.jsp").forward(request, response);
                }
                break;
            case 5:
                if (isDAO.cambiarContraseña()) {
                   
                    miSession.invalidate();
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                    
                   
                    
                } else {
                    request.setAttribute("mensajeError", "¡Es imposible modificar la contrasela");
                    request.getRequestDispatcher("_pagina/FinalCambio.jsp").forward(request, response);
                }
                break;
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
