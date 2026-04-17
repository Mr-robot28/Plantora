package com.greennursery.model;

public class Plant {
    private int plantId;
    private String name;
    private String description;
    private double price;  // ← MUST be double, NOT String
    private int stockQuantity;
    private String imageUrl;
    private String category;

    // Constructors
    public Plant() {}

    public Plant(int plantId, String name, String description, 
                 double price, int stockQuantity, String imageUrl, String category) {
        this.plantId = plantId;
        this.name = name;
        this.description = description;
        this.price = price;
        this.stockQuantity = stockQuantity;
        this.imageUrl = imageUrl;
        this.category = category;
    }

    // Getters and Setters
    public int getPlantId() { return plantId; }
    public void setPlantId(int plantId) { this.plantId = plantId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public double getPrice() { return price; }  // ← Returns double
    public void setPrice(double price) { this.price = price; }  // ← Takes double

    public int getStockQuantity() { return stockQuantity; }
    public void setStockQuantity(int stockQuantity) { this.stockQuantity = stockQuantity; }

    public String getImageUrl() { return imageUrl; }
    public void setImageUrl(String imageUrl) { this.imageUrl = imageUrl; }

    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}