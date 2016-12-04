/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.sipre.controlador.generales;

import edu.sipre.modoles.generales.GnUsuario;
import edu.sipre.modoles.generales.dao.AbstractFacadeDAO;
import edu.sipre.modoles.generales.dao.UsuarioDAO_SQL;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author alejozepol
 */
@WebServlet(name = "Loguin", urlPatterns = {"/index"})
public class Loguin extends HttpServlet {

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
            String usuario = request.getParameter("inputNomUsu");
            String clave = request.getParameter("inputPassword");
            String boton = request.getParameter("loguin");
            UsuarioDAO_SQL uDAO_SQL = (UsuarioDAO_SQL) AbstractFacadeDAO.getFacadeDAO(1).getUsuarioDAO();
            GnUsuario gu = uDAO_SQL.login(usuario, clave);
            request.getRequestDispatcher("/inicio.jsp").forward(request, response);

           /*if(usuario != null && !usuario.equals("") && clave != null && !clave.equals("")){
             GnUsuario u = new GnUsuario();
                response.sendRedirect(request.getContextPath() + "/inicio.jsp");*/            
        } catch (NumberFormatException exception) {
            System.out.println("hdjshasjdhjahdjkshajkd");
        } catch (Exception e) {
            e.printStackTrace();
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
