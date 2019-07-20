package Controlador;

import Models.CodMultasDTO;
import Models.ConductorDTO;
import Models.MisMultasDAO;
import Models.MisMultasDTO;
import Models.PoliciaDTO;
import Models.ReportesDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Reportes", urlPatterns = {"/Reportes"})
public class Reportes extends HttpServlet {

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
            //MisMultasDTO mismultas = new MisMultasDTO();
            //mismultas.setDni(request.getParameter("id"));
            String identificador = request.getParameter("id");

            if (identificador.equals("policias")) {
                PoliciaDTO[] policias = ReportesDAO.verpolicias();
                if (policias != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("policias", policias);
                    response.sendRedirect("VerPolicias.jsp");
                } else {
                    //response.sendRedirect("JspInvalidLogin.jsp");
                    response.setContentType("text/plain");
                    response.getWriter().write("no hay policias registrados");
                }
            } else if (identificador.equals("conductores")) {
                ConductorDTO[] conductores = ReportesDAO.verconductores();
                if (conductores != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("conductores", conductores);
                    response.sendRedirect("VerConductores.jsp");
                } else {
                    //response.sendRedirect("JspInvalidLogin.jsp");
                    response.setContentType("text/plain");
                    response.getWriter().write("no hay conductores registrados");
                }
            } else if (identificador.equals("codmultas")) {
                CodMultasDTO[] codmultas = ReportesDAO.vercodmultas();
                if (codmultas != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("codmultas", codmultas);
                    response.sendRedirect("VerCodMultas.jsp");
                } else {
                    //response.sendRedirect("JspInvalidLogin.jsp");
                    response.setContentType("text/plain");
                    response.getWriter().write("no hay codmultas registrados");
                }
            } else if (identificador.equals("vehiculos")) {
                PoliciaDTO[] policias = ReportesDAO.verpolicias();
                if (policias != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("vehiculos", policias);
                    response.sendRedirect("VerVehiculos.jsp");
                } else {
                    //response.sendRedirect("JspInvalidLogin.jsp");
                    response.setContentType("text/plain");
                    response.getWriter().write("no hay vehiculos registrados");
                }
            } else if (identificador.equals("multas")) {
                PoliciaDTO[] policias = ReportesDAO.verpolicias();
                if (policias != null) {
                    HttpSession session = request.getSession(true);

                    session.setAttribute("multas", policias);
                    response.sendRedirect("VerMultas.jsp");
                } else {
                    //response.sendRedirect("JspInvalidLogin.jsp");
                    response.setContentType("text/plain");
                    response.getWriter().write("no hay multas registrados");
                }
            } else {
                response.setContentType("text/plain");
                response.getWriter().write("error");
            }

//            MisMultasDTO[] datoscompletos = MisMultasDAO.getMisdatos(mismultas);
//            if(datoscompletos != null)
//            {
//                HttpSession session = request.getSession(true);
//
//                session.setAttribute("mismultas", datoscompletos);
//                response.sendRedirect("MisMultas.jsp");
//            }
//            else
//            {
//                //response.sendRedirect("JspInvalidLogin.jsp");
//                response.setContentType("text/plain");
//                response.getWriter().write("error");
//            }
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
