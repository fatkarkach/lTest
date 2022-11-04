package com.controller;

import com.Dao.UserDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
            //tester heure:
            String timeStamp1 = new SimpleDateFormat("HH:mm").format(Calendar.getInstance().getTime());
            SimpleDateFormat sdformat = new SimpleDateFormat("HH:mm");
            Date date1 = sdformat.parse("8:00");
            Date date2 = sdformat.parse(timeStamp1);
            Date date3 = sdformat.parse("12:00");

            if (loginDao.insert(email,password)) {
                System.out.println("klchi mzyan");
                request.getRequestDispatcher("Adminc.jsp").forward(request, response);
            } else if (loginDao.insertAdmin(email,password)) {
                System.out.println("klchi mzyan");
                request.getRequestDispatcher("login-success.jsp").forward(request, response);

            } //tester
            else if (loginDao.insertres(email,password)) {
                if(date2.compareTo(date1) < 0 || date2.compareTo(date3) <0 ) {
                    System.out.println("ba9i 7al");
                    System.out.println("klchi mzyan");
                    request.getRequestDispatcher("Responsable.jsp").forward(request, response);
                }
                else {
                    System.out.println("mcha l7al");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                }

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
