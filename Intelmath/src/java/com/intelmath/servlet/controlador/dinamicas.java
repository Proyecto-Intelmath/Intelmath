/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.intelmath.servlet.controlador;

import com.intelmath.negocio.DAO.DinamicaDAO;
import com.intelmath.negocio.VO.DinamicasVO;
import com.intelmath.util.conexion.ConexionBD;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author John
 */
@WebServlet(name = "dinamicas", urlPatterns = {"/dinamicas"})
public class dinamicas extends HttpServlet {

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
        String idDinamicas = "";
        String nombre = request.getParameter("nombre");
        String puntaje = request.getParameter("puntaje");
        String usuario = request.getParameter("usuario");
        String tipo = request.getParameter("tipo");

        DinamicasVO diVO = new DinamicasVO(idDinamicas, nombre, puntaje, usuario, tipo);
        DinamicaDAO diDAO = new DinamicaDAO(diVO);

        if (diDAO.buscar(nombre, usuario)) {
            DinamicasVO diVO1 = new DinamicasVO();
            DinamicaDAO diDAO1 = new DinamicaDAO(diVO);
            try {
                ConexionBD con = new ConexionBD();
                Statement st = con.conexion.createStatement();
                ResultSet rs = st.executeQuery("select d.nombre , puntaje,"
                        + "t.nombre  from tbl_dinamicas d, tbl_usuario u, "
                        + "tbl_tipo t where d.id_usuario=u.id_usuario and "
                        + "d.id_tipo=t.id_tipo and d.id_usuario='" + usuario + "' and d.nombre='"+nombre+"'");
                while (rs.next()) {
                    if(rs.getString("d.nombre").equals("2048")||rs.getString("d.nombre").equals("Simon")){
                        if (rs.getInt("puntaje") < Integer.parseInt(puntaje)) {
                            if (diDAO.actualizarRegistro()) {
                                request.getRequestDispatcher("_pagina/dinamicas.jsp").forward(request, response);
                            } else {
                                request.setAttribute("mensajeError", "¡No se puede guardar el progreso del nivel!");
                                request.getRequestDispatcher("_pagina/2048/index.jsp").forward(request, response);
                            }
                    } else {
                        request.getRequestDispatcher("_pagina/dinamicas.jsp").forward(request, response);
                    }
                    }else if(rs.getString("d.nombre").equals("Puzzle")){
                        if (rs.getInt("puntaje") > Integer.parseInt(puntaje)) {
                            if (diDAO.actualizarRegistro()) {
                                request.getRequestDispatcher("_pagina/dinamicas.jsp").forward(request, response);
                            } else {
                                request.setAttribute("mensajeError", "¡No se puede guardar el progreso del nivel!");
                                request.getRequestDispatcher("_pagina/2048/index.jsp").forward(request, response);
                            }
                    } else {
                        request.getRequestDispatcher("_pagina/dinamicas.jsp").forward(request, response);
                    }
                    }
                    
                }

            } catch (Exception e) {
                System.out.println("Error" + e);
            }

        } else if (diDAO.agregarRegistro()) {

            request.getRequestDispatcher("_pagina/dinamicas.jsp").forward(request, response);

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
