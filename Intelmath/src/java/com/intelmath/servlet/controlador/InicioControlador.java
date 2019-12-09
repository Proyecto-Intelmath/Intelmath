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
@WebServlet(name = "InicioControlador", urlPatterns = {"/Sesion"})
public class InicioControlador extends HttpServlet {

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
        int opcion = Integer.parseInt(request.getParameter("opcion"));
        String IdUsuario = request.getParameter("usuID");
        String usuario = request.getParameter("usuario");
        String contraseña = request.getParameter("contra");
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correo = request.getParameter("correo");
        String telefono = request.getParameter("telefono");
        String rol = "1";

        Email email = new Email();

        String de = request.getParameter("de");
        String clave = request.getParameter("clave");
        String para = request.getParameter("correo");
        String mensaje = request.getParameter("mensaje");
        String asunto = request.getParameter("Asunto");
        String codigo = request.getParameter("codigo");

        InicioSesionVO isVO = new InicioSesionVO(IdUsuario, usuario, contraseña, nombre, apellido, correo, telefono, rol);
        InicioSesionDAO isDAO = new InicioSesionDAO(isVO);

        switch (opcion) {
            case 1:
                if (isDAO.usuario(usuario)) {
                    request.setAttribute("mensajeError", "¡El usuario ya existe!");
                    request.getRequestDispatcher("_pagina/RegistrarUsuario.jsp").forward(request, response);

                } else if (isDAO.agregarRegistro()) {
                    boolean resultado = email.enviarCorreo(de, clave, para, mensaje, asunto);
                    if (isDAO.ValidarIngreso()) {

                        HttpSession miSession = request.getSession(true);
                        InicioSesionVO sesion = InicioSesionDAO.sesion(usuario);
                        if (miSession.getAttribute("usuario") == null) {
                            miSession.setAttribute("usuario", sesion);
                        }
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                    } else {
                        request.setAttribute("mensajeError", "¡El usuario no pudo ser registrado!");
                        request.getRequestDispatcher("_pagina/RegistrarUsuario.jsp").forward(request, response);
                    }

                } else {
                    request.setAttribute("mensajeError", "¡El usuario no pudo ser registrado!");
                    request.getRequestDispatcher("_pagina/RegistrarUsuario.jsp").forward(request, response);
                }

                break;
            case 2:
                if (isDAO.ValidarIngreso()) {
                    HttpSession miSession = request.getSession(true);
                    InicioSesionVO sesion = InicioSesionDAO.sesion(usuario);
                    miSession.setAttribute("usuario", sesion);
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } else {
                    HttpSession miSession = request.getSession(true);
                    request.setAttribute("mensajeError", "¡Usuario o Contraseña incorrecto!");

                    request.getRequestDispatcher("index.jsp").forward(request, response);

                }
                break;
            case 3:
                if (isDAO.confirmarCorreo(correo)) {
                    
                    HttpSession miSession = request.getSession(true);
                    miSession.setAttribute("correo", correo);
                    miSession.setAttribute("codigo1", codigo);
                    boolean resultado = email.enviarCorreo(de, clave, para, mensaje, asunto);
                    request.getRequestDispatcher("_pagina/RecuperacionContraseña.jsp").forward(request, response);

                } else {
                    request.setAttribute("MensajeError", "Tu correo no ha sido registrado.");
                    request.getRequestDispatcher("_pagina/olvidarContraseña.jsp").forward(request, response);
                }

                break;
            case 4:
                 HttpSession miSession = request.getSession(true);
                 String codigo2 = (String) miSession.getAttribute("codigo1");
                 String correito = (String) miSession.getAttribute("correo");
                if (codigo2 == null ? codigo == null : codigo2.equals(codigo)) {
                    if (isDAO.confirmarCorreo(correito)) {
                        
                        InicioSesionVO sesion = InicioSesionDAO.sesionCorreo(correo);
                        miSession.setAttribute("usuario", sesion);
                        request.getRequestDispatcher("_pagina/FinalCambio.jsp").forward(request, response);
                    }else{
                        request.setAttribute("MensajeError", "Tu correo no ha sido registrado.");
                        request.getRequestDispatcher("_pagina/RecuperacionContraseña.jsp").forward(request, response);
                    }
                }else{
                    request.setAttribute("MensajeError", "El codigo digita no es admitido.");
                    request.getRequestDispatcher("_pagina/RecuperacionContraseña.jsp").forward(request, response);
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
