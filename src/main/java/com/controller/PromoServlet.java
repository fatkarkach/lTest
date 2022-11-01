package com.controller;

import com.Dao.AdmincDao;
import com.Dao.PromoDao;
import com.model.Promotion;
import com.model.Stock;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "PromoServlet", value = "/PromoServlet")
public class PromoServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PromoDao promoDao;

    public void init() {
        promoDao = new PromoDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("promotion.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String categorie=request.getParameter("categorie");
        System.out.println(categorie);
        String produit=request.getParameter("produit");
        System.out.println(produit);
        int promo = Integer.parseInt(request.getParameter("promo"));
        System.out.println(promo);
        if(categorie=="multimédia" && promo>=20)
        {
            promo=0;
        }
        int point=promo+10;
        System.out.println(point);
        AdmincDao admincDao=new AdmincDao();
        System.out.println(promoDao.insertid(produit));
       Stock stock=admincDao.getStokes(promoDao.insertid(produit));
        String disponible="non applique";
        Promotion promotion=new Promotion(promo,point,stock,disponible);
        promotion.setPromo(promo);
        promotion.setPoints(point);
//        promotion.setStock(stock);
        promotion.setDisponible(disponible);
        promoDao.savepromo(promotion);
       RequestDispatcher dispatcher = request.getRequestDispatcher("promotion.jsp");
        dispatcher.forward(request, response);

    }
}
