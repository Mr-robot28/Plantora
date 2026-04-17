<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.model.Plant" %>
<%@ page import="java.util.List" %>
<%
    if (!"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    List<Plant> plants = (List<Plant>) request.getAttribute("plants");
%>

<div class="bg-gray-50 min-h-screen py-8">
    <div class="max-w-7xl mx-auto px-4">
        <div class="flex justify-between items-center mb-6">
            <div>
                <h1 class="text-3xl font-bold text-gray-800">Manage Plants</h1>
                <p class="text-gray-500">Add, edit, or remove plants from catalog</p>
            </div>
            <a href="${pageContext.request.contextPath}/admin/plants?action=add" 
               class="bg-teal-600 text-white px-6 py-3 rounded-xl hover:bg-teal-700 transition flex items-center gap-2">
                <i class="fas fa-plus"></i> Add New Plant
            </a>
        </div>

        <!-- Search Bar -->
        <div class="bg-white rounded-2xl shadow-lg p-4 mb-6">
            <div class="flex gap-4">
                <input type="text" placeholder="Search plants..." class="flex-1 px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                <button class="bg-teal-600 text-white px-6 py-3 rounded-xl">Search</button>
            </div>
        </div>

        <!-- Plants Table -->
        <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full">
                    <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">ID</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Image</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Name</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Category</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Price</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Stock</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Plant p : plants) { %>
                        <tr class="border-b border-gray-100 hover:bg-gray-50 transition">
                            <td class="px-6 py-4 text-sm"><%= p.getPlantId() %></td>
                            <td class="px-6 py-4"><img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>" class="w-12 h-12 rounded-lg object-cover"></td>
                            <td class="px-6 py-4 font-semibold"><%= p.getName() %></td>
                            <td class="px-6 py-4"><span class="px-2 py-1 bg-teal-100 text-teal-700 text-xs rounded-full"><%= p.getCategory() %></span></td>
                            <td class="px-6 py-4 text-teal-600 font-bold"><span class="rupee-sign">&#8377;</span><%= p.getPrice() %></td>
                            <td class="px-6 py-4">
                                <% if (p.getStockQuantity() > 10) { %>
                                    <span class="text-green-600"><%= p.getStockQuantity() %></span>
                                <% } else if (p.getStockQuantity() > 0) { %>
                                    <span class="text-orange-600"><%= p.getStockQuantity() %></span>
                                <% } else { %>
                                    <span class="text-red-600">Out of stock</span>
                                <% } %>
                            </td>
                            <td class="px-6 py-4">
                                <div class="flex gap-2">
                                    <a href="${pageContext.request.contextPath}/admin/editPlant?id=<%= p.getPlantId() %>" 
                                       class="text-blue-600 hover:underline">Edit</a>
                                    <a href="${pageContext.request.contextPath}/admin/deletePlant?id=<%= p.getPlantId() %>" 
                                       class="text-red-600 hover:underline" 
                                       onclick="return confirm('Delete this plant?')">Delete</a>
                                </div>
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