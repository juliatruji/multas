
package Controlador;


import Models.CodMultasDAO;
import Models.CodMultasDTO;
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
@WebServlet(name = "RegistroCodMultas", urlPatterns = {"/RegistroCodMultas"})
public class RegistroCodMultas extends HttpServlet {

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
        try (PrintWriter oucodigomultat = response.getWriter()) {
            CodMultasDTO codigomulta = new CodMultasDTO();
            codigomulta.setCodfaltas(request.getParameter("codfalta"));
            codigomulta.setDescripcion(request.getParameter("descripcion"));
            codigomulta.setClasificacion(request.getParameter("clasificacion"));
            codigomulta.setDescuento(request.getParameter("descuento"));
            codigomulta.setMontouit(Integer.parseInt(request.getParameter("montouit")));
            codigomulta.setPuntos(Integer.parseInt(request.getParameter("puntos")));
            codigomulta.setSancion(request.getParameter("sancion"));
            codigomulta.setMedidapreventiva(request.getParameter("medidapreventiva"));

           
            
            int registrovalid = CodMultasDAO.Register(codigomulta);
            
            if(registrovalid==1) // ok
            {
                //HttpSession session = request.getSession(true);
                //session.setAttribute("policia", policia);
                //response.sendRedirect("Policia.jsp");
                response.setContentType("text/plain");
                response.getWriter().write("ok");
            }
            else if (registrovalid==2) // error de dni
            {
                response.setContentType("text/plain");
                response.getWriter().write("error codigo");
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

