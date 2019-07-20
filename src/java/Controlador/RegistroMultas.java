/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Models.MultasDAO;
import Models.MultasDTO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;

/**
 *
 * @author LAB-USR-CAQP-C0206
 */
@WebServlet(name = "RegistroMultas", urlPatterns = {"/RegistroMultas"})
public class RegistroMultas extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            MultasDTO multa = new MultasDTO();
            multa.setDni(request.getParameter("dni"));
            multa.setCodigocip(request.getParameter("cip"));
            multa.setCodigomulta(request.getParameter("multa"));
            multa.setDireccion(request.getParameter("direccion"));
            multa.setFecha(request.getParameter("fecha"));
            multa.setPlaca(request.getParameter("placa"));
            multa.setUbicacion(request.getParameter("ubicacion"));
            multa.setObservacionesconductor(request.getParameter("observacionesconductor"));
            multa.setObservacionespolicias(request.getParameter("observacionespolicias"));
            System.out.println("aaaaaaa" + multa.getDni());
            int registrovalid = MultasDAO.Register(multa);

            if (registrovalid == 1) {
                response.setContentType("text/plain");
                response.getWriter().write("ok");
            } else if (registrovalid == 2) // error de dni
            {
                response.setContentType("text/plain");
                response.getWriter().write("error dni");
            } else if (registrovalid == 3) // error de cip
            {
                response.setContentType("text/plain");
                response.getWriter().write("error cip");
            } else if (registrovalid == 4) // error de placa
            {
                response.setContentType("text/plain");
                response.getWriter().write("error placa");
            }

        } catch (Throwable theException) {
            System.out.println(theException);
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
