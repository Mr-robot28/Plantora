package com.greennursery.servlets;

import java.io.IOException;
import java.util.List;

import com.greennursery.dao.AppointmentDAO;
import com.greennursery.model.Appointment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/appointment")
public class AppointmentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }
        int userId = (int) session.getAttribute("userId");

        Appointment a = new Appointment();
        a.setUserId(userId);
        a.setDate(req.getParameter("date"));
        a.setTime(req.getParameter("time"));
        a.setMessage(req.getParameter("message"));

        boolean booked = new AppointmentDAO().bookAppointment(a);
        if (booked) {
            res.sendRedirect(req.getContextPath() + "/appointment?view=history&success=true");
        } else {
            req.setAttribute("error", "Booking failed. Try again.");
            req.getRequestDispatcher("/jsp/appointment.jsp").forward(req, res);
        }
    }

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            res.sendRedirect(req.getContextPath() + "/jsp/login.jsp");
            return;
        }
        String view = req.getParameter("view");
        if ("history".equals(view)) {
            int userId = (int) session.getAttribute("userId");
            List<Appointment> list = new AppointmentDAO().getAppointmentsByUser(userId);
            req.setAttribute("appointments", list);
            req.getRequestDispatcher("/jsp/appointmentHistory.jsp").forward(req, res);
        } else {
            req.getRequestDispatcher("/jsp/appointment.jsp").forward(req, res);
        }
    }
}
