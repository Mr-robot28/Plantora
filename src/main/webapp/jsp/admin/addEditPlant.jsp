<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.model.Plant" %>
<%
    if (!"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    Plant plant = (Plant) request.getAttribute("plant");
    boolean isEdit = (plant != null);
%>

<div class="bg-gray-50 min-h-screen py-8">
    <div class="max-w-3xl mx-auto px-4">
        <div class="bg-white rounded-3xl shadow-xl overflow-hidden">
            <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6">
                <h1 class="text-2xl font-bold text-white"><%= isEdit ? "Edit Plant" : "Add New Plant" %></h1>
                <p class="text-teal-100"><%= isEdit ? "Update plant information" : "Add a new plant to the catalog" %></p>
            </div>
            
            <form class="p-8" action="${pageContext.request.contextPath}/admin/savePlant" method="post">
                <% if (isEdit) { %>
                <input type="hidden" name="plantId" value="<%= plant.getPlantId() %>">
                <% } %>
                
                <div class="space-y-5">
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Plant Name *</label>
                        <input type="text" name="name" required value="<%= isEdit ? plant.getName() : "" %>"
                               class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                    
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Category *</label>
                        <select name="category" required class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                            <option value="">Select Category</option>
                            <option value="Indoor" <%= isEdit && "Indoor".equals(plant.getCategory()) ? "selected" : "" %>>Indoor Plants</option>
                            <option value="Outdoor" <%= isEdit && "Outdoor".equals(plant.getCategory()) ? "selected" : "" %>>Outdoor Plants</option>
                            <option value="Succulent" <%= isEdit && "Succulent".equals(plant.getCategory()) ? "selected" : "" %>>Succulents</option>
                            <option value="Flowering" <%= isEdit && "Flowering".equals(plant.getCategory()) ? "selected" : "" %>>Flowering Plants</option>
                            <option value="Herbs" <%= isEdit && "Herbs".equals(plant.getCategory()) ? "selected" : "" %>>Herbs</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Description</label>
                        <textarea name="description" rows="4" 
                                  class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500"><%= isEdit ? plant.getDescription() : "" %></textarea>
                    </div>
                    
                    <div class="grid grid-cols-2 gap-4">
                        <div>
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Price (<span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span>) *</label>
                            <input type="number" name="price" step="0.01" required value="<%= isEdit ? plant.getPrice() : "" %>"
                                   class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                        </div>
                        <div>
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Stock Quantity *</label>
                            <input type="number" name="stock" required value="<%= isEdit ? plant.getStockQuantity() : "" %>"
                                   class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                        </div>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 mb-2">Image URL</label>
                        <input type="url" name="imageUrl" value="<%= isEdit ? plant.getImageUrl() : "" %>"
                               class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                        <p class="text-xs text-gray-400 mt-1">Enter a valid image URL (Unsplash, etc.)</p>
                    </div>
                    
                    <div class="flex gap-4 pt-4">
                        <button type="submit" class="flex-1 bg-teal-600 text-white font-bold py-3 rounded-xl hover:bg-teal-700 transition">
                            <%= isEdit ? "Update Plant" : "Add Plant" %>
                        </button>
                        <a href="${pageContext.request.contextPath}/admin/plants" 
                           class="flex-1 text-center border-2 border-gray-300 text-gray-600 font-semibold py-3 rounded-xl hover:bg-gray-50 transition">
                            Cancel
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>