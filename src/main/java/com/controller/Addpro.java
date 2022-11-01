package com.controller;

import com.Dao.AdmincDao;
import com.model.Stock;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "Addpro", value = "/Addpro")
public class Addpro extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("Adminc.jsp");

    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categorie=request.getParameter("categorie");
//        System.out.println(categorie);
        String produit=request.getParameter("produit");
//        System.out.println(produit);
        int prix= Integer.parseInt(request.getParameter("prix"));
//        System.out.println(prix);
        int quantites=Integer.parseInt(request.getParameter("quantites"));
        System.out.println(quantites);
        Stock stock=new Stock(categorie,produit,prix,quantites);
        stock.setCategorie(categorie);
        stock.setProduit(produit);
        stock.setPrix(prix);
        stock.setQuantites(quantites);
        AdmincDao admincDao=new AdmincDao();
        admincDao.savepro(stock);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Adminc.jsp");
        dispatcher.forward(request, response);

    }
}
