<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.dao.OrderDAO" %>
<%@ page import="com.greennursery.model.Order" %>
<%
    Integer orderId = (Integer) session.getAttribute("lastOrderId");
    if (orderId == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/index.jsp");
        return;
    }
    Order order = new OrderDAO().getOrderById(orderId);
    session.removeAttribute("lastOrderId");
%>

<div class="min-h-screen bg-gradient-to-br from-green-50 to-teal-50 flex items-center justify-center px-4 py-20">
    <div class="max-w-2xl w-full bg-white rounded-3xl shadow-2xl overflow-hidden text-center">
        <!-- Success Animation -->
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-6 py-12">
            <div class="w-24 h-24 bg-white rounded-full flex items-center justify-center mx-auto mb-4 animate-bounce">
                <i class="fas fa-check-circle text-teal-600 text-5xl"></i>
            </div>
            <h1 class="text-3xl font-bold text-white mb-2">Order Confirmed!</h1>
            <p class="text-teal-100">Thank you for shopping with Green Nursery</p>
        </div>
        
        <div class="p-8">
            <div class="bg-gray-50 rounded-xl p-6 mb-6">
                <p class="text-gray-600 mb-2">Order ID</p>
                <p class="text-2xl font-bold text-teal-600">#GN<%= orderId %></p>
                <div class="flex justify-center gap-6 mt-4 text-sm">
                    <div><span class="text-gray-500">Date:</span> <%= order.getOrderDate() %></div>
                    <div><span class="text-gray-500">Total:</span> <span class="font-bold"><span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span><%= order.getTotalAmount() %></span></div>
                </div>
            </div>
            
            <p class="text-gray-600 mb-6">
                A confirmation email has been sent to your registered email address.<br>
                Your order will be delivered within 3-5 business days.
            </p>
            
            <div class="flex flex-wrap gap-4 justify-center">
                <a href="${pageContext.request.contextPath}/order?view=detail&orderId=<%= orderId %>" 
                   class="bg-teal-600 text-white px-6 py-3 rounded-xl font-semibold hover:bg-teal-700 transition">
                    <i class="fas fa-eye mr-2"></i> View Order
                </a>
                <a href="${pageContext.request.contextPath}/plants" 
                   class="border-2 border-teal-600 text-teal-600 px-6 py-3 rounded-xl font-semibold hover:bg-teal-50 transition">
                    <i class="fas fa-leaf mr-2"></i> Continue Shopping
                </a>
            </div>
        </div>
        
        <!-- Order Steps -->
        <div class="bg-gray-50 px-8 py-6">
            <div class="flex justify-between items-center">
                <div class="text-center"><div class="w-8 h-8 bg-teal-600 text-white rounded-full flex items-center justify-center mx-auto mb-1"><span class="text-white-600">&#10003;</span></div><p class="text-xs">Order Placed</p></div>
                <div class="flex-1 h-0.5 bg-teal-600"></div>
                <div class="text-center"><div class="w-8 h-8 bg-gray-300 text-gray-500 rounded-full flex items-center justify-center mx-auto mb-1">2</div><p class="text-xs">Processing</p></div>
                <div class="flex-1 h-0.5 bg-gray-300"></div>
                <div class="text-center"><div class="w-8 h-8 bg-gray-300 text-gray-500 rounded-full flex items-center justify-center mx-auto mb-1">3</div><p class="text-xs">Shipped</p></div>
                <div class="flex-1 h-0.5 bg-gray-300"></div>
                <div class="text-center"><div class="w-8 h-8 bg-gray-300 text-gray-500 rounded-full flex items-center justify-center mx-auto mb-1">4</div><p class="text-xs">Delivered</p></div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>