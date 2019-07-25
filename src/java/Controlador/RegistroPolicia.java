/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Models.PoliciaDAO;
import Models.PoliciaDTO;
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
 * @author LAB-USR-CAQP-C0206
 */
@WebServlet(name = "RegistroPolicia", urlPatterns = {"/RegistroPolicia"})
public class RegistroPolicia extends HttpServlet {

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
            PoliciaDTO policia = new PoliciaDTO();
            policia.setNombres(request.getParameter("nombres"));
            policia.setApellidos(request.getParameter("apellidos"));
            policia.setDni(request.getParameter("dni"));
            policia.setCodcip(request.getParameter("codcip"));
            policia.setAlias(request.getParameter("alias"));
            policia.setPassword(request.getParameter("password"));

           
            
            int registrovalid = PoliciaDAO.Register(policia);
            
            if(registrovalid==1) // ok
            {
                ///HttpSession session = request.getSession(true);
                //session.setAttribute("policia", policia);
                //response.sendRedirect("Policia.jsp");
                response.setContentType("text/plain");
                response.getWriter().write("ok");
            }
            else if (registrovalid==2) // error de dni
            {
                response.setContentType("text/plain");
                response.getWriter().write("error dni");
            }
            else if (registrovalid==3) // error de alias
            {
                response.setContentType("text/plain");
                response.getWriter().write("error alias");
            }
            
        }
        catch(Throwable theException)
        {
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
