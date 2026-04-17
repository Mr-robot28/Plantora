package com.greennursery.servlets;

import java.io.IOException;
import java.util.List;

import com.greennursery.dao.CartDAO;
import com.greennursery.dao.OrderDAO;
import com.greennursery.model.CartItem;
import com.greennursery.model.Order;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }
        int userId = (int) session.getAttribute("userId");
        String address = req.getParameter("deliveryAddress");

        CartDAO cartDAO = new CartDAO();
        List<CartItem> items = cartDAO.getCartItems(userId);

        if (items.isEmpty()) {
            res.sendRedirect(req.getContextPath() + "/cart");
            return;
        }

        OrderDAO orderDAO = new OrderDAO();
        int result = orderDAO.placeOrder(userId, items, address);

        if (result > 0) {
            req.getSession().setAttribute("lastOrderId", result);
            res.sendRedirect(req.getContextPath() + "/jsp/orderConfirmation.jsp");
        } else if (result == -2) {
            req.setAttribute("error", "Some items are out of stock.");
            req.getRequestDispatcher("/jsp/checkout.jsp").forward(req, res);
        } else {
            req.setAttribute("error", "Order placement failed. Please try again.");
            req.getRequestDispatcher("/jsp/checkout.jsp").forward(req, res);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }
        int userId = (int) session.getAttribute("userId");
        String view = req.getParameter("view");

        OrderDAO dao = new OrderDAO();
        if ("detail".equals(view)) {
            int orderId = Integer.parseInt(req.getParameter("orderId"));
            Order order = dao.getOrderById(orderId);
            req.setAttribute("order", order);
            req.getRequestDispatcher("/jsp/orderDetail.jsp").forward(req, res);
        } else {
            List<Order> orders = dao.getOrdersByUser(userId);
            req.setAttribute("orders", orders);
            req.getRequestDispatcher("/jsp/orderHistory.jsp").forward(req, res);
        }
    }
}
