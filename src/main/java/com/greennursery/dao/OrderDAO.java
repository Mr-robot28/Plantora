package com.greennursery.dao;

import com.greennursery.model.*;
import java.sql.*;
import java.util.*;

public class OrderDAO {

    /**
     * Place order: creates order, adds order_items, reduces stock, clears cart.
     * All in a single transaction.
     */
    public int placeOrder(int userId, List<CartItem> cartItems, String address) {
        String insertOrder = "INSERT INTO orders (user_id, total_amount, delivery_address) VALUES (?,?,?)";
        String insertItem  = "INSERT INTO order_items (order_id, plant_id, quantity, price) VALUES (?,?,?,?)";
        Connection con = null;
        try {
            con = DBConnection.getConnection();
            con.setAutoCommit(false);

            // Calculate total
            double total = cartItems.stream().mapToDouble(CartItem::getSubtotal).sum();

            // Insert order
            PreparedStatement ps = con.prepareStatement(insertOrder, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId); ps.setDouble(2, total); ps.setString(3, address);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            if (!rs.next()) { con.rollback(); return -1; }
            int orderId = rs.getInt(1);

            // Insert items + reduce stock
            PlantDAO plantDAO = new PlantDAO();
            for (CartItem ci : cartItems) {
                PreparedStatement psi = con.prepareStatement(insertItem);
                psi.setInt(1, orderId); psi.setInt(2, ci.getPlantId());
                psi.setInt(3, ci.getQuantity()); psi.setDouble(4, ci.getPlantPrice());
                psi.executeUpdate();

                if (!plantDAO.reduceStock(ci.getPlantId(), ci.getQuantity(), con)) {
                    con.rollback();
                    return -2; // Stock insufficient
                }
            }

            // Clear cart
            new CartDAO().clearCart(userId, con);

            con.commit();
            return orderId;
        } catch (SQLException e) {
            try { if (con != null) con.rollback(); } catch (SQLException ex) {}
            e.printStackTrace(); return -1;
        } finally {
            try { if (con != null) { con.setAutoCommit(true); con.close(); } } catch (SQLException e) {}
        }
    }

    public List<Order> getOrdersByUser(int userId) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT * FROM orders WHERE user_id=? ORDER BY order_date DESC";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) list.add(mapOrder(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public List<Order> getAllOrders() {
        List<Order> list = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM orders ORDER BY order_date DESC")) {
            while (rs.next()) list.add(mapOrder(rs));
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public Order getOrderById(int orderId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE order_id=?")) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Order o = mapOrder(rs);
                o.setItems(getOrderItems(orderId));
                return o;
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return null;
    }

    public List<OrderItem> getOrderItems(int orderId) {
        List<OrderItem> items = new ArrayList<>();
        String sql = "SELECT oi.*, p.name, p.image_url FROM order_items oi "
                   + "JOIN plants p ON oi.plant_id=p.plant_id WHERE oi.order_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                OrderItem oi = new OrderItem();
                oi.setItemId(rs.getInt("item_id"));
                oi.setOrderId(orderId);
                oi.setPlantId(rs.getInt("plant_id"));
                oi.setQuantity(rs.getInt("quantity"));
                oi.setPrice(rs.getDouble("price"));
                oi.setPlantName(rs.getString("name"));
                oi.setPlantImage(rs.getString("image_url"));
                items.add(oi);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return items;
    }

    public boolean updateOrderStatus(int orderId, String status) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "UPDATE orders SET status=? WHERE order_id=?")) {
            ps.setString(1, status); ps.setInt(2, orderId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    private Order mapOrder(ResultSet rs) throws SQLException {
        Order o = new Order();
        o.setOrderId(rs.getInt("order_id"));
        o.setUserId(rs.getInt("user_id"));
        o.setOrderDate(rs.getTimestamp("order_date"));
        o.setTotalAmount(rs.getDouble("total_amount"));
        o.setStatus(rs.getString("status"));
        o.setDeliveryAddress(rs.getString("delivery_address"));
        return o;
    }
}
