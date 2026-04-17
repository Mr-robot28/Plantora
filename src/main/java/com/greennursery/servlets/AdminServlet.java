package com.greennursery.servlets;

import java.io.IOException;

import com.greennursery.dao.AppointmentDAO;
import com.greennursery.dao.OrderDAO;
import com.greennursery.dao.PlantDAO;
import com.greennursery.dao.UserDAO;
import com.greennursery.model.Plant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin/*")
public class AdminServlet extends HttpServlet {

    private boolean isAdmin(HttpServletRequest req) {
        HttpSession s = req.getSession(false);
        return s != null && "ADMIN".equals(s.getAttribute("role"));
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!isAdmin(req)) { res.sendRedirect(req.getContextPath() + "/jsp/login.jsp"); return; }

        String path = req.getPathInfo();
        if (path == null) path = "/dashboard";

        switch (path) {
            case "/plants":
                req.setAttribute("plants", new PlantDAO().getAllPlants());
                req.getRequestDispatcher("/jsp/admin/managePlants.jsp").forward(req, res);
                break;
            case "/orders":
                req.setAttribute("orders", new OrderDAO().getAllOrders());
                req.getRequestDispatcher("/jsp/admin/manageOrders.jsp").forward(req, res);
                break;
            case "/users":
                req.setAttribute("users", new UserDAO().getAllUsers());
                req.getRequestDispatcher("/jsp/admin/manageUsers.jsp").forward(req, res);
                break;
            case "/appointments":
                req.setAttribute("appointments", new AppointmentDAO().getAllAppointments());
                req.getRequestDispatcher("/jsp/admin/manageAppointments.jsp").forward(req, res);
                break;
            case "/deletePlant":
                new PlantDAO().deletePlant(Integer.parseInt(req.getParameter("id")));
                res.sendRedirect(req.getContextPath() + "/admin/plants");
                break;
            case "/deleteUser":
                new UserDAO().deleteUser(Integer.parseInt(req.getParameter("id")));
                res.sendRedirect(req.getContextPath() + "/admin/users");
                break;
            case "/editPlant":
                int id = Integer.parseInt(req.getParameter("id"));
                req.setAttribute("plant", new PlantDAO().getPlantById(id));
                req.getRequestDispatcher("/jsp/admin/addEditPlant.jsp").forward(req, res);
                break;
            default:
                req.getRequestDispatcher("/jsp/admin/dashboard.jsp").forward(req, res);
        }
    }

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        if (!isAdmin(req)) { res.sendRedirect(req.getContextPath() + "/jsp/login.jsp"); return; }

        String path = req.getPathInfo();
        if (path == null) path = "";

        PlantDAO plantDAO = new PlantDAO();
        switch (path) {
            case "/savePlant":
                Plant p = new Plant();
                String idStr = req.getParameter("plantId");
                p.setName(req.getParameter("name"));
                p.setDescription(req.getParameter("description"));
                p.setPrice(Double.parseDouble(req.getParameter("price")));
                p.setStockQuantity(Integer.parseInt(req.getParameter("stock")));
                p.setImageUrl(req.getParameter("imageUrl"));
                p.setCategory(req.getParameter("category"));
                if (idStr != null && !idStr.isEmpty()) {
                    p.setPlantId(Integer.parseInt(idStr));
                    plantDAO.updatePlant(p);
                } else {
                    plantDAO.addPlant(p);
                }
                res.sendRedirect(req.getContextPath() + "/admin/plants");
                break;
            case "/updateOrder":
                new OrderDAO().updateOrderStatus(
                    Integer.parseInt(req.getParameter("orderId")),
                    req.getParameter("status"));
                res.sendRedirect(req.getContextPath() + "/admin/orders");
                break;
            case "/updateAppointment":
                new AppointmentDAO().updateStatus(
                    Integer.parseInt(req.getParameter("appointmentId")),
                    req.getParameter("status"));
                res.sendRedirect(req.getContextPath() + "/admin/appointments");
                break;
        }
    }
}
