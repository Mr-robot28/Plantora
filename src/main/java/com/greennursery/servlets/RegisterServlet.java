package com.greennursery.servlets;

import java.io.IOException;

import com.greennursery.dao.UserDAO;
import com.greennursery.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String name  = req.getParameter("name").trim();
        String email = req.getParameter("email").trim();
        String pass  = req.getParameter("password").trim();
        String phone = req.getParameter("phone").trim();

        if (name.isEmpty() || email.isEmpty() || pass.isEmpty()) {
            req.setAttribute("error", "All fields are required.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
            return;
        }

        UserDAO dao = new UserDAO();
        if (dao.emailExists(email)) {
            req.setAttribute("error", "Email already registered.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
            return;
        }

        User user = new User();
        user.setName(name); user.setEmail(email);
        user.setPassword(pass); user.setPhone(phone);

        if (dao.registerUser(user)) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp?registered=true");
        } else {
            req.setAttribute("error", "Registration failed. Try again.");
            req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        req.getRequestDispatcher("/jsp/register.jsp").forward(req, res);
    }
}
