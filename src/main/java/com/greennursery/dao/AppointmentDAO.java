package com.greennursery.dao;

import com.greennursery.model.Appointment;
import java.sql.*;
import java.util.*;

public class AppointmentDAO {

    public boolean bookAppointment(Appointment a) {
        String sql = "INSERT INTO appointments (user_id, date, time, message) VALUES (?,?,?,?)";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, a.getUserId()); ps.setString(2, a.getDate());
            ps.setString(3, a.getTime()); ps.setString(4, a.getMessage());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public List<Appointment> getAppointmentsByUser(int userId) {
        List<Appointment> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT * FROM appointments WHERE user_id=? ORDER BY date DESC")) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapAppt(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> list = new ArrayList<>();
        String sql = "SELECT a.*, u.name AS user_name FROM appointments a "
                   + "JOIN users u ON a.user_id=u.user_id ORDER BY a.date DESC";
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                Appointment a = mapAppt(rs);
                a.setUserName(rs.getString("user_name"));
                list.add(a);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean updateStatus(int id, String status) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE appointments SET status=? WHERE appointment_id=?")) {
            ps.setString(1, status); ps.setInt(2, id);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    private Appointment mapAppt(ResultSet rs) throws SQLException {
        Appointment a = new Appointment();
        a.setAppointmentId(rs.getInt("appointment_id"));
        a.setUserId(rs.getInt("user_id"));
        a.setDate(rs.getString("date"));
        a.setTime(rs.getString("time"));
        a.setMessage(rs.getString("message"));
        a.setStatus(rs.getString("status"));
        return a;
    }
}
