package com.controller;

import com.Dao.AdminDao;
import com.Dao.AdmincDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "DeletStock", value = "/DeletStock")
public class DeletStock extends HttpServlet {
    private static final long serialVersionUID = 1L;
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

        int id = Integer.parseInt(request.getParameter("id"));
        admincDao.deleteAdminc(id);
        response.sendRedirect("Adminc.jsp");
    }
}
