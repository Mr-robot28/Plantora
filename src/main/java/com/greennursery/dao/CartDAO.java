package com.greennursery.dao;

import com.greennursery.model.CartItem;
import java.sql.*;
import java.util.*;

public class CartDAO {

    public boolean addToCart(int userId, int plantId, int quantity) {
        // If item exists, update quantity; else insert
        String check = "SELECT cart_id, quantity FROM cart WHERE user_id=? AND plant_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(check)) {
            ps.setInt(1, userId); ps.setInt(2, plantId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int newQty = rs.getInt("quantity") + quantity;
                PreparedStatement upd = con.prepareStatement(
                    "UPDATE cart SET quantity=? WHERE cart_id=?");
                upd.setInt(1, newQty); upd.setInt(2, rs.getInt("cart_id"));
                return upd.executeUpdate() > 0;
            } else {
                PreparedStatement ins = con.prepareStatement(
                    "INSERT INTO cart (user_id, plant_id, quantity) VALUES (?,?,?)");
                ins.setInt(1, userId); ins.setInt(2, plantId); ins.setInt(3, quantity);
                return ins.executeUpdate() > 0;
            }
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public List<CartItem> getCartItems(int userId) {
        List<CartItem> list = new ArrayList<>();
        String sql = "SELECT c.*, p.name, p.image_url, p.price FROM cart c "
                   + "JOIN plants p ON c.plant_id=p.plant_id WHERE c.user_id=?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CartItem ci = new CartItem();
                ci.setCartId(rs.getInt("cart_id"));
                ci.setUserId(userId);
                ci.setPlantId(rs.getInt("plant_id"));
                ci.setQuantity(rs.getInt("quantity"));
                ci.setPlantName(rs.getString("name"));
                ci.setPlantImage(rs.getString("image_url"));
                ci.setPlantPrice(rs.getDouble("price"));
                list.add(ci);
            }
        } catch (SQLException e) { e.printStackTrace(); }
        return list;
    }

    public boolean removeFromCart(int cartId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE cart_id=?")) {
            ps.setInt(1, cartId);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) { e.printStackTrace(); return false; }
    }

    public boolean clearCart(int userId, Connection con) throws SQLException {
        PreparedStatement ps = con.prepareStatement("DELETE FROM cart WHERE user_id=?");
        ps.setInt(1, userId);
        return ps.executeUpdate() >= 0;
    }

    public int getCartCount(int userId) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(
                 "SELECT SUM(quantity) FROM cart WHERE user_id=?")) {
            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt(1);
        } catch (SQLException e) { e.printStackTrace(); }
        return 0;
    }
}
