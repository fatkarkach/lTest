package com.controller;

import com.Dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "LoginController", value = "/LoginController")
public class LoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private UserDao loginDao;

    public void init() {
        loginDao = new UserDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.sendRedirect("index.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            String email = request.getParameter("email");
            System.out.println(email);
            String password = request.getParameter("password");
            System.out.println(password);

            if (loginDao.insert(email,password)) {
                System.out.println("klchi mzyan");
                request.getRequestDispatcher("Adminc.jsp").forward(request, response);
            } else if (loginDao.insertAdmin(email,password)) {
                System.out.println("klchi mzyan");
                request.getRequestDispatcher("login-success.jsp").forward(request, response);

            } else if (loginDao.insertres(email,password)) {
                System.out.println("klchi mzyan");
                request.getRequestDispatcher("Responsable.jsp").forward(request, response);

            } else {
                System.out.println("machi mzyan");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
