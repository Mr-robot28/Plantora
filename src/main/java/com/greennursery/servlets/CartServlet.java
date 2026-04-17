package com.greennursery.servlets;

import java.io.IOException;
import java.util.List;

import com.greennursery.dao.CartDAO;
import com.greennursery.model.CartItem;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }
        int userId = (int) session.getAttribute("userId");
        String action = req.getParameter("action");

        CartDAO dao = new CartDAO();

        if ("remove".equals(action)) {
            int cartId = Integer.parseInt(req.getParameter("cartId"));
            dao.removeFromCart(cartId);
            res.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        List<CartItem> items = dao.getCartItems(userId);
        double total = items.stream().mapToDouble(CartItem::getSubtotal).sum();
        req.setAttribute("cartItems", items);
        req.setAttribute("cartTotal", total);
        req.getRequestDispatcher("/jsp/cart.jsp").forward(req, res);
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }
        int userId = (int) session.getAttribute("userId");
        int plantId = Integer.parseInt(req.getParameter("plantId"));
        int qty = Integer.parseInt(req.getParameter("quantity"));

        new CartDAO().addToCart(userId, plantId, qty);
        res.sendRedirect(req.getContextPath() + "/cart");
    }
}
