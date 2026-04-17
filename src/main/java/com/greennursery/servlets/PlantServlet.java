package com.greennursery.servlets;

import java.io.IOException;
import java.util.List;

import com.greennursery.dao.PlantDAO;
import com.greennursery.model.Plant;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/plants")
public class PlantServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PlantDAO plantDAO = new PlantDAO();
        String view = request.getParameter("view");
        String keyword = request.getParameter("q");
        String category = request.getParameter("category");
        
        if (keyword == null) keyword = "";
        if (category == null) category = "";
        
        if ("detail".equals(view)) {
            // Show single plant detail
            int id = Integer.parseInt(request.getParameter("id"));
            Plant plant = plantDAO.getPlantById(id);
            request.setAttribute("plant", plant);
            request.getRequestDispatcher("/jsp/plantDetail.jsp").forward(request, response);
        } else {
            // Show catalog with search/filter
            List<Plant> plants = plantDAO.searchPlants(keyword, category);
            List<String> categories = plantDAO.getCategories();
            
            request.setAttribute("plants", plants);
            request.setAttribute("categories", categories);
            request.setAttribute("keyword", keyword);
            request.setAttribute("selectedCategory", category);
            
            request.getRequestDispatcher("/jsp/catalog.jsp").forward(request, response);
        }
    }
}