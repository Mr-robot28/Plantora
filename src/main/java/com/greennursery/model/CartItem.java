package com.greennursery.model;

public class CartItem {
    private int cartId, userId, plantId, quantity;
    private String plantName, plantImage;
    private double plantPrice;

    public CartItem() {}

    public int getCartId() { return cartId; }
    public void setCartId(int cartId) { this.cartId = cartId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getPlantId() { return plantId; }
    public void setPlantId(int plantId) { this.plantId = plantId; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public String getPlantName() { return plantName; }
    public void setPlantName(String plantName) { this.plantName = plantName; }
    public String getPlantImage() { return plantImage; }
    public void setPlantImage(String plantImage) { this.plantImage = plantImage; }
    public double getPlantPrice() { return plantPrice; }
    public void setPlantPrice(double plantPrice) { this.plantPrice = plantPrice; }
    public double getSubtotal() { return plantPrice * quantity; }
}
