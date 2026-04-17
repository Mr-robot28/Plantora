package com.greennursery.model;

public class OrderItem {
    private int itemId, orderId, plantId, quantity;
    private double price;
    private String plantName, plantImage;

    public OrderItem() {}

    public int getItemId() { return itemId; }
    public void setItemId(int itemId) { this.itemId = itemId; }
    public int getOrderId() { return orderId; }
    public void setOrderId(int orderId) { this.orderId = orderId; }
    public int getPlantId() { return plantId; }
    public void setPlantId(int plantId) { this.plantId = plantId; }
    public int getQuantity() { return quantity; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
    public String getPlantName() { return plantName; }
    public void setPlantName(String plantName) { this.plantName = plantName; }
    public String getPlantImage() { return plantImage; }
    public void setPlantImage(String plantImage) { this.plantImage = plantImage; }
}
