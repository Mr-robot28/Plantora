<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.Order" %>
<%@ page import="java.util.List" %>
<%
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<div class="max-w-6xl mx-auto px-4 py-12">
    <div class="text-center mb-12">
        <h1 class="text-4xl font-bold text-gray-800 mb-2">My Orders</h1>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        <p class="text-gray-500 mt-4">Track and manage your orders</p>
    </div>

    <% if (orders == null || orders.isEmpty()) { %>
    <div class="text-center py-20 bg-white rounded-2xl shadow-sm">
        <div class="text-7xl mb-4"><i class="fas fa-box-open"></i></div>
        <h3 class="text-xl font-semibold text-gray-700 mb-2">No orders yet</h3>
        <p class="text-gray-400 mb-6">Start shopping to see your orders here</p>
        <a href="${pageContext.request.contextPath}/plants" class="bg-teal-600 text-white px-6 py-3 rounded-xl hover:bg-teal-700 transition">
            Browse Plants
        </a>
    </div>
    <% } else { %>
    <div class="space-y-4">
        <% for (Order order : orders) { 
            String statusClass = "";
            String statusIcon = "";
            switch(order.getStatus()) {
            case "PENDING": statusIcon = "<i class='fas fa-clock mr-1'></i>"; break;
            case "CONFIRMED": statusIcon = "<i class='fas fa-check mr-1'></i>"; break;
            case "SHIPPED": statusIcon = "<i class='fas fa-truck mr-1'></i>"; break;
            case "DELIVERED": statusIcon = "<i class='fas fa-check-circle mr-1'></i>"; break;
            case "CANCELLED": statusIcon = "<i class='fas fa-times-circle mr-1'></i>"; break;
            }
        %>
        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition">
            <div class="flex flex-wrap justify-between items-start gap-4">
                <div>
                    <p class="text-sm text-gray-500">Order ID</p>
                    <p class="font-bold text-lg">#GN<%= order.getOrderId() %></p>
                </div>
                <div>
                    <p class="text-sm text-gray-500">Order Date</p>
                    <p class="font-semibold"><%= order.getOrderDate() %></p>
                </div>
                <div>
                    <p class="text-sm text-gray-500">Total Amount</p>
                    <p class="font-bold text-teal-600"><span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span><%= order.getTotalAmount() %></p>
                </div>
                <div>
                    <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full text-sm font-semibold <%= statusClass %>">
                        <span><%= statusIcon %></span> <%= order.getStatus() %>
                    </span>
                </div>
                <a href="${pageContext.request.contextPath}/order?view=detail&orderId=<%= order.getOrderId() %>" 
                   class="text-teal-600 hover:underline font-semibold">
                    View Details <i class="fas fa-arrow-right"></i>
                </a>
            </div>
            
            <!-- Progress Bar -->
            <div class="mt-4 pt-4 border-t border-gray-100">
                <div class="flex justify-between text-xs text-gray-500 mb-1">
                    <span>Order Placed</span><span>Confirmed</span><span>Shipped</span><span>Delivered</span>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2">
                    <%
                        int progress = 0;
                        switch(order.getStatus()) {
                            case "PENDING": progress = 10; break;
                            case "CONFIRMED": progress = 35; break;
                            case "SHIPPED": progress = 70; break;
                            case "DELIVERED": progress = 100; break;
                            default: progress = 0;
                        }
                    %>
                    <div class="bg-teal-600 h-2 rounded-full" style="width: <%= progress %>%"></div>
                </div>
            </div>
        </div>
        <% } %>
    </div>
    <% } %>
</div>

<%@ include file="includes/footer.jsp" %>