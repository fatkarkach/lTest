package com.controller;

import com.Dao.AdmincDao;
import com.model.Stock;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "UpdateStock", value = "/UpdateStock")
public class UpdateStock extends HttpServlet {
    private AdmincDao admincDao;

    public void init() {
        admincDao = new AdmincDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("Adminc.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int id= Integer.parseInt(request.getParameter("id"));
        String categorie=request.getParameter("categorie");
        String produit=request.getParameter("produit");
        int prix= Integer.parseInt(request.getParameter("prix"));
        int quantites= Integer.parseInt(request.getParameter("quantites"));
        Stock stock=new Stock(id,categorie,produit,prix, quantites);
        admincDao.updatepro(stock);
        response.sendRedirect("Adminc.jsp");
    }
}
