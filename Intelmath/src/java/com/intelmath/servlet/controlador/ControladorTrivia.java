/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.servlet.controlador;


import com.intelmath.negocio.DAO.TriviaDAO;
import com.intelmath.negocio.VO.TriviaVO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author agxel
 */
@WebServlet(name = "ControladorTrivia", urlPatterns = {"/trivia"})
public class ControladorTrivia extends HttpServlet {

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
        String idTrivia=request.getParameter("txtId");
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String contenido = request.getParameter("txtDescripcion");
        //Paso 2
        TriviaVO triVO = new TriviaVO(idTrivia, contenido);

        // Paso 3
        TriviaDAO triDAO = new TriviaDAO(triVO);
        
        switch (opcion){
            case 1:
                
                if (triDAO.agregarRegistro()) {

                    request.setAttribute("mensajeExitoso", "La trivia ha sido Registrada Exitosamente");
                    request.getRequestDispatcher("_pagina/trivia.jsp").forward(request, response);
                } else {

                    request.setAttribute("mensajeError", "La trivia no ha sido Registrada Exitosamente");
                    request.getRequestDispatcher("_pagina/insertarTrivia.jsp").forward(request, response);
                }

                
                break;
                
                case 2:

                if (triDAO.actualizarRegistro()) {

                    request.setAttribute("mensajeExitoso", "La Trivia fue Modificada Exitosamente");
                    request.getRequestDispatcher("_pagina/trivia.jsp").forward(request, response);

                } else {
                    request.setAttribute("mensajeError", "La Trivia no fue Modificada Exitosamente");
                    request.getRequestDispatcher("_pagina/modificarTrivia.jsp").forward(request, response);
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
