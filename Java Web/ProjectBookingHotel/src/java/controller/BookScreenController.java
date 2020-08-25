/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.AccountDAO;
import dal.FormRoomDAO;
import dal.KindRoomDAO;
import dal.ViewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Account;
import model.FormOfRent;
import model.KindOfRoom;

/**
 *
 * @author GL552VW
 */
public class BookScreenController extends HttpServlet {

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
        
        String raw_from = request.getParameter("from");
        String raw_to = request.getParameter("to");
        String kid = request.getParameter("kid");
        String fid = request.getParameter("fid");
        
        AccountDAO adao = new AccountDAO();
        KindRoomDAO kdao = new KindRoomDAO();
        FormRoomDAO fdao = new FormRoomDAO();
        HttpSession session = request.getSession();
        Account a = (Account) session.getAttribute("account");
        ArrayList<Account> accounts = new ArrayList();
        ArrayList<KindOfRoom> kindroom = new ArrayList();
        ArrayList<FormOfRent> formroom = new ArrayList();
        accounts = adao.getAccounts();
        session.setAttribute("accounts", accounts);
        
         if (a != null) {
            String nick = a.getNick();
            request.setAttribute("nick", nick);
            request.setAttribute("a", a);
        }
        
        kindroom = kdao.getKindroom();
        formroom = fdao.getFormroom();
        ViewDAO viewDAO = new ViewDAO();
        if(session.isNew()){
           viewDAO.updateView();
        }
        int view = viewDAO.getView();
        String formatted = String.format("%05d", view);
        request.setAttribute("view", formatted);
        request.setAttribute("kindroom", kindroom);
        request.setAttribute("formroom", formroom);
        request.setAttribute("kid", kid);
        request.setAttribute("fid", fid);
        request.getRequestDispatcher("/view/home.jsp").forward(request, response);

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
