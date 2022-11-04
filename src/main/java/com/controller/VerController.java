package com.controller;

import com.Dao.AdmincDao;
import com.Dao.PromoDao;
import com.model.Promotion;
import com.model.Stock;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "VerController", value = "/VerController")
public class VerController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int idpromo= Integer.parseInt(request.getParameter("idpromo"));
        String disponible= request.getParameter("disponible");
        String produit=request.getParameter("produit");
        PromoDao promoDao=new PromoDao();
        AdmincDao admincDao=new AdmincDao();
        System.out.println(promoDao.insertid(produit));
        Stock stock=admincDao.getStokes(promoDao.insertid(produit));
        Promotion promotion=new Promotion(idpromo,stock,disponible);
        promoDao.appdisp(promotion);
        response.sendRedirect("Responsable.jsp");

    }
}
