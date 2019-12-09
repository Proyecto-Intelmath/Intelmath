/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.servlet.controlador;

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
 * @author John
 */
@WebServlet(name = "Redireccionar", urlPatterns = {"/Redireccionar"})
public class Redireccionar extends HttpServlet {

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
        if (request.getParameter("Perfil") != null) {
            request.getRequestDispatcher("_pagina/Perfil.jsp").forward(request, response);

        }
        if (request.getParameter("Cerrar") != null) {
           
            miSession.invalidate();

            request.getRequestDispatcher("index.jsp").forward(request, response);

        }

        if (request.getParameter("biblioteca") != null) {
            request.getRequestDispatcher("_pagina/biblioteca.jsp").forward(request, response);

        }
        if (request.getParameter("teoriaLogica") != null) {
            request.getRequestDispatcher("_pagina/teoriaLogica.jsp").forward(request, response);

        }
        if (request.getParameter("operadores") != null) {
            request.getRequestDispatcher("_pagina/operadores.jsp").forward(request, response);

        }
        if (request.getParameter("dinamicas") != null) {
            request.getRequestDispatcher("_pagina/dinamicas.jsp").forward(request, response);

        }
        if (request.getParameter("logicos") != null) {
            request.getRequestDispatcher("_pagina/Logicos.jsp").forward(request, response);
        }
        if (request.getParameter("matematicos") != null) {
            request.getRequestDispatcher("_pagina/matematicos.jsp").forward(request, response);
        }
        if (request.getParameter("inicio") != null) {
            request.getRequestDispatcher("_pagina/InicioSesion.jsp").forward(request, response);
        }
        if (request.getParameter("registro") != null) {
            request.getRequestDispatcher("_pagina/RegistrarUsuario.jsp").forward(request, response);
        }
        if (request.getParameter("trivia") != null) {
            request.getRequestDispatcher("_pagina/trivia.jsp").forward(request, response);
        }
        if (request.getParameter("id") != null) {
            request.getRequestDispatcher("_pagina/actBiblioteca.jsp").forward(request, response);
        }
        if (request.getParameter("titulo") != null) {
            request.getRequestDispatcher("_pagina/eliBiblioteca.jsp").forward(request, response);
        }
        if (request.getParameter("libro") != null) {
            request.getRequestDispatcher("_pagina/regBiblioteca.jsp").forward(request, response);
        }
        if (request.getParameter("EditarTrivia") != null) {
            request.getRequestDispatcher("_pagina/modificarTrivia.jsp").forward(request, response);
        }
        if (request.getParameter("insertarT") != null) {
            request.getRequestDispatcher("_pagina/insertarTrivia.jsp").forward(request, response);
        }
        if (request.getParameter("buscar1") != null) {
            request.getRequestDispatcher("_pagina/trivia.jsp").forward(request, response);
        }
        if (request.getParameter("editar") != null) {
            request.getRequestDispatcher("_pagina/modificarPerfil.jsp").forward(request, response);
        }
        if (request.getParameter("contrasena") != null) {
            request.getRequestDispatcher("_pagina/cambioContrasena.jsp").forward(request, response);
        }

        if (request.getParameter("rol") != null) {
            request.getRequestDispatcher("_pagina/CambiarRol.jsp").forward(request, response);
        }
        if (request.getParameter("2048") != null) {
            request.getRequestDispatcher("_pagina/2048/index.jsp").forward(request, response);
        }
        if(request.getParameter("puzzle")!=null){
            request.getRequestDispatcher("_pagina/Memoria/puzzle.jsp").forward(request, response);
        }
        if(request.getParameter("recuperar")!=null){
             request.getRequestDispatcher("_pagina/olvidarContraseña.jsp").forward(request, response);
        }
        if(request.getParameter("simon")!=null){
            request.getRequestDispatcher("_pagina/SIMON/simon.jsp").forward(request, response);
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
