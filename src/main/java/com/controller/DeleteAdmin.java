package com.controller;

import com.Dao.AdminDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DeleteAdmin", value = "/DeleteAdmin")
public class DeleteAdmin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDao adminDao;

    public void init() {
        adminDao = new AdminDao();
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.sendRedirect("login-success.jsp");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        adminDao.deleteUser(id);
        response.sendRedirect("login-success.jsp");
    }
}
