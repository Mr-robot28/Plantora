<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.model.Order" %>
<%@ page import="java.util.List" %>
<%
    if (!"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    List<Order> orders = (List<Order>) request.getAttribute("orders");
%>

<div class="bg-gray-50 min-h-screen py-8">
    <div class="max-w-7xl mx-auto px-4">
        <div class="mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Orders</h1>
            <p class="text-gray-500">View and update order statuses</p>
        </div>

        <!-- Filters -->
        <div class="bg-white rounded-2xl shadow-lg p-4 mb-6 flex flex-wrap gap-4">
            <select class="px-4 py-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                <option>All Orders</option>
                <option>Pending</option>
                <option>Confirmed</option>
                <option>Shipped</option>
                <option>Delivered</option>
                <option>Cancelled</option>
            </select>
            <input type="text" placeholder="Search by Order ID" class="flex-1 px-4 py-2 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
            <button class="bg-teal-600 text-white px-6 py-2 rounded-xl">Filter</button>
        </div>

        <!-- Orders Table -->
        <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Order ID</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">User ID</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Date</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Total</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Status</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Order order : orders) { %>
                        <tr class="border-b border-gray-100 hover:bg-gray-50 transition">
                            <td class="px-6 py-4 font-semibold">#GN<%= order.getOrderId() %></td>
                            <td class="px-6 py-4">User #<%= order.getUserId() %></td>
                            <td class="px-6 py-4 text-sm"><%= order.getOrderDate() %></td>
                            <td class="px-6 py-4 font-bold text-teal-600"><span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span><%= order.getTotalAmount() %></td>
                            <td class="px-6 py-4">
                                <form action="${pageContext.request.contextPath}/admin/updateOrder" method="post" class="inline">
                                    <input type="hidden" name="orderId" value="<%= order.getOrderId() %>">
                                    <select name="status" onchange="this.form.submit()" 
                                            class="px-3 py-1 text-sm rounded-full border-0 font-semibold
                                            <%= order.getStatus().equals("DELIVERED") ? "bg-green-100 text-green-700" : 
                                               order.getStatus().equals("CANCELLED") ? "bg-red-100 text-red-700" : 
                                               order.getStatus().equals("SHIPPED") ? "bg-purple-100 text-purple-700" :
                                               order.getStatus().equals("CONFIRMED") ? "bg-blue-100 text-blue-700" : "bg-yellow-100 text-yellow-700" %>">
                                        <option value="PENDING" <%= order.getStatus().equals("PENDING") ? "selected" : "" %>>Pending</option>
                                        <option value="CONFIRMED" <%= order.getStatus().equals("CONFIRMED") ? "selected" : "" %>>Confirmed</option>
                                        <option value="SHIPPED" <%= order.getStatus().equals("SHIPPED") ? "selected" : "" %>>Shipped</option>
                                        <option value="DELIVERED" <%= order.getStatus().equals("DELIVERED") ? "selected" : "" %>>Delivered</option>
                                        <option value="CANCELLED" <%= order.getStatus().equals("CANCELLED") ? "selected" : "" %>>Cancelled</option>
                                    </select>
                                </form>
                            </td>
                            <td class="px-6 py-4">
                                <a href="${pageContext.request.contextPath}/order?view=detail&orderId=<%= order.getOrderId() %>" 
                                   class="text-blue-600 hover:underline">View</a>
                            </td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>