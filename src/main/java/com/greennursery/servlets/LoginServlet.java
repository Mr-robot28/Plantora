package com.greennursery.servlets;

import java.io.IOException;

import com.greennursery.dao.UserDAO;
import com.greennursery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String email = req.getParameter("email").trim();
        String pass  = req.getParameter("password").trim();

        UserDAO dao = new UserDAO();
        User user = dao.loginUser(email, pass);

        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("role", user.getRole());

            if ("ADMIN".equals(user.getRole())) {
                res.sendRedirect(req.getContextPath() + "/jsp/admin/dashboard.jsp");
            } else {
                res.sendRedirect(req.getContextPath() + "/jsp/index.jsp");
            }
        } else {
            req.setAttribute("error", "Invalid email or password.");
            req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/login.jsp").forward(req, res);
    }
}
