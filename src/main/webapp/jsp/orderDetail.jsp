<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.Order" %>
<%@ page import="com.greennursery.model.OrderItem" %>
<%
    Order order = (Order) request.getAttribute("order");
    if (order == null) {
        response.sendRedirect(request.getContextPath() + "/order");
        return;
    }
%>

<div class="max-w-5xl mx-auto px-4 py-12">
    <div class="flex items-center gap-4 mb-8">
        <a href="${pageContext.request.contextPath}/order" class="text-teal-600 hover:underline">&larr; Back to Orders</a>
        <h1 class="text-3xl font-bold text-gray-800">Order Details</h1>
    </div>

    <div class="grid md:grid-cols-3 gap-6">
        <!-- Order Info -->
        <div class="md:col-span-2 space-y-6">
            <div class="bg-white rounded-2xl shadow-lg p-6">
                <h3 class="font-bold text-lg mb-4 flex items-center gap-2"><i class="fas fa-box text-teal-600"></i> Order Items</h3>
                <div class="space-y-3">
                    <% for (OrderItem item : order.getItems()) { %>
                    <div class="flex gap-4 py-3 border-b border-gray-100 last:border-0">
                        <img src="<%= item.getPlantImage() %>" alt="<%= item.getPlantName() %>" class="w-16 h-16 rounded-lg object-cover">
                        <div class="flex-1">
                            <p class="font-semibold"><%= item.getPlantName() %></p>
                            <p class="text-sm text-gray-500">Quantity: <%= item.getQuantity() %></p>
                        </div>
                        <p class="font-bold text-teal-600"><span class="rupee-sign">&#8377;</span><%= item.getPrice() * item.getQuantity() %></p>
                    </div>
                    <% } %>
                </div>
            </div>
            
            <div class="bg-white rounded-2xl shadow-lg p-6">
                <h3 class="font-bold text-lg mb-4 flex items-center gap-2"><i class="fas fa-map-marker-alt text-teal-600"></i> Delivery Address</h3>
                <p class="text-gray-600"><%= order.getDeliveryAddress() %></p>
            </div>
        </div>
        
        <!-- Summary -->
        <div class="space-y-6">
            <div class="bg-white rounded-2xl shadow-lg p-6">
                <h3 class="font-bold text-lg mb-4">Order Summary</h3>
                <div class="space-y-2">
                    <div class="flex justify-between"><span class="text-gray-500">Order ID:</span><span class="font-semibold">#GN<%= order.getOrderId() %></span></div>
                    <div class="flex justify-between"><span class="text-gray-500">Date:</span><span><%= order.getOrderDate() %></span></div>
                    <div class="flex justify-between"><span class="text-gray-500">Status:</span>
                        <span class="px-2 py-1 rounded-full text-xs font-semibold 
                            <%= order.getStatus().equals("DELIVERED") ? "bg-green-100 text-green-700" : 
                               order.getStatus().equals("CANCELLED") ? "bg-red-100 text-red-700" : "bg-yellow-100 text-yellow-700" %>">
                            <%= order.getStatus() %>
                        </span>
                    </div>
                    <div class="border-t pt-2 mt-2">
                        <div class="flex justify-between"><span>Subtotal:</span><span><span class="rupee-sign">₹</span><%= order.getTotalAmount() / 1.05 %></span></div>
                        <div class="flex justify-between"><span>GST (5%):</span><span><span class="rupee-sign">₹</span><%= Math.round(order.getTotalAmount() - (order.getTotalAmount() / 1.05)) %></span></div>
                        <div class="flex justify-between font-bold text-lg pt-2"><span>Total:</span><span class="text-teal-600"><span class="rupee-sign">₹</span><%= order.getTotalAmount() %></span></div>
                    </div>
                </div>
            </div>
            
            <div class="bg-teal-50 rounded-2xl p-6 text-center">
                <i class="fas fa-headset text-3xl text-teal-600 mb-2"></i>
                <h3 class="font-bold">Need Help?</h3>
                <p class="text-sm text-gray-600 mt-1">Contact our support team</p>
                <a href="${pageContext.request.contextPath}/jsp/contact.jsp" class="inline-block mt-3 text-teal-600 hover:underline">Get Support →</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>