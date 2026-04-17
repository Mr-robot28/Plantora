package com.greennursery.dao;

import com.greennursery.model.Plant;
import java.sql.*;
import java.util.*;

public class PlantDAO {

    // This method maps database row to Plant object
    private Plant mapPlant(ResultSet rs) throws SQLException {
        Plant plant = new Plant();
        plant.setPlantId(rs.getInt("plant_id"));
        plant.setName(rs.getString("name"));
        plant.setDescription(rs.getString("description"));
        plant.setPrice(rs.getDouble("price"));  // ← IMPORTANT: rs.getDouble, NOT rs.getString
        plant.setStockQuantity(rs.getInt("stock_quantity"));
        plant.setImageUrl(rs.getString("image_url"));
        plant.setCategory(rs.getString("category"));
        return plant;
    }

    public List<Plant> getAllPlants() {
        List<Plant> plants = new ArrayList<>();
        String sql = "SELECT * FROM plants ORDER BY plant_id DESC";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                plants.add(mapPlant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plants;
    }

    public Plant getPlantById(int id) {
        String sql = "SELECT * FROM plants WHERE plant_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                return mapPlant(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<Plant> searchPlants(String keyword, String category) {
        List<Plant> plants = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM plants WHERE 1=1");
        
        if (keyword != null && !keyword.trim().isEmpty()) {
            sql.append(" AND (name LIKE ? OR description LIKE ?)");
        }
        if (category != null && !category.trim().isEmpty()) {
            sql.append(" AND category = ?");
        }
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
            
            int paramIndex = 1;
            if (keyword != null && !keyword.trim().isEmpty()) {
                String searchPattern = "%" + keyword + "%";
                pstmt.setString(paramIndex++, searchPattern);
                pstmt.setString(paramIndex++, searchPattern);
            }
            if (category != null && !category.trim().isEmpty()) {
                pstmt.setString(paramIndex++, category);
            }
            
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                plants.add(mapPlant(rs));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return plants;
    }

    public List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        String sql = "SELECT DISTINCT category FROM plants WHERE category IS NOT NULL";
        
        try (Connection conn = DBConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    public boolean addPlant(Plant plant) {
        String sql = "INSERT INTO plants (name, description, price, stock_quantity, image_url, category) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, plant.getName());
            pstmt.setString(2, plant.getDescription());
            pstmt.setDouble(3, plant.getPrice());
            pstmt.setInt(4, plant.getStockQuantity());
            pstmt.setString(5, plant.getImageUrl());
            pstmt.setString(6, plant.getCategory());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updatePlant(Plant plant) {
        String sql = "UPDATE plants SET name=?, description=?, price=?, stock_quantity=?, image_url=?, category=? WHERE plant_id=?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, plant.getName());
            pstmt.setString(2, plant.getDescription());
            pstmt.setDouble(3, plant.getPrice());
            pstmt.setInt(4, plant.getStockQuantity());
            pstmt.setString(5, plant.getImageUrl());
            pstmt.setString(6, plant.getCategory());
            pstmt.setInt(7, plant.getPlantId());
            
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deletePlant(int plantId) {
        String sql = "DELETE FROM plants WHERE plant_id = ?";
        
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setInt(1, plantId);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean reduceStock(int plantId, int quantity, Connection conn) throws SQLException {
        String sql = "UPDATE plants SET stock_quantity = stock_quantity - ? WHERE plant_id = ? AND stock_quantity >= ?";
        PreparedStatement pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, quantity);
        pstmt.setInt(2, plantId);
        pstmt.setInt(3, quantity);
        return pstmt.executeUpdate() > 0;
    }
}