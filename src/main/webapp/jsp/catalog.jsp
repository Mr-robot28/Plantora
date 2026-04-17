<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp"%>
<%@ page import="com.greennursery.model.Plant"%>
<%@ page import="java.util.List"%>
<%@ page import="java.text.DecimalFormat"%>
<%
List<Plant> plants = (List<Plant>) request.getAttribute("plants");
List<String> categories = (List<String>) request.getAttribute("categories");
String keyword = (String) request.getAttribute("keyword");
String selCat = (String) request.getAttribute("selectedCategory");
if (keyword == null) {
    keyword = "";
}
if (selCat == null) {
    selCat = "";
}
DecimalFormat priceFormatter = new DecimalFormat("#");
%>

<div class="max-w-7xl mx-auto px-4 py-12">
    <!-- Header Section -->
    <div class="text-center mb-12">
        <p class="text-teal-600 font-semibold tracking-wider text-sm uppercase">Our Collection</p>
        <h1 class="text-4xl md:text-5xl font-bold text-gray-800 mb-4">Plant Catalog</h1>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        <p class="text-gray-500 mt-4 max-w-2xl mx-auto">Discover our wide range of beautiful plants for every space</p>
    </div>

    <!-- Search and Filter Section -->
    <div class="bg-white rounded-2xl shadow-lg p-6 mb-10">
        <form method="get" action="${pageContext.request.contextPath}/plants" class="flex flex-wrap gap-4">
            <div class="flex-1 min-w-[200px]">
                <div class="relative">
                    <i class="fas fa-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                    <input type="text" name="q" value="<%= keyword %>" 
                           placeholder="Search plants..."
                           class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
            </div>
            <div class="w-48">
                <select name="category" class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                    <option value="">All Categories</option>
                    <% for (String cat : categories) { %>
                    <option value="<%= cat %>" <%= cat.equals(selCat) ? "selected" : "" %>><%= cat %></option>
                    <% } %>
                </select>
            </div>
            <div class="w-48">
                <select name="sort" class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                    <option value="newest">Newest First</option>
                    <option value="price_asc">Price: Low to High</option>
                    <option value="price_desc">Price: High to Low</option>
                    <option value="name_asc">Name: A to Z</option>
                </select>
            </div>
            <button type="submit" class="bg-gradient-to-r from-teal-600 to-emerald-600 text-white px-6 py-3 rounded-xl font-semibold hover:shadow-lg transition">
                <i class="fas fa-search mr-2"></i>Search
            </button>
            <a href="${pageContext.request.contextPath}/plants" class="border-2 border-gray-300 text-gray-600 px-6 py-3 rounded-xl font-semibold hover:bg-gray-50 transition">
                Reset
            </a>
        </form>
    </div>

    <!-- Results Count -->
    <div class="mb-6 flex justify-between items-center">
        <p class="text-gray-500">
            Showing <span class="font-semibold"><%= plants != null ? plants.size() : 0 %></span> products
        </p>
        <div class="flex items-center gap-2 text-sm">
            <span class="text-gray-500">View:</span>
            <button class="w-8 h-8 rounded-lg bg-teal-600 text-white">
                <i class="fas fa-th-large"></i>
            </button>
            <button class="w-8 h-8 rounded-lg border border-gray-300 text-gray-500">
                <i class="fas fa-list"></i>
            </button>
        </div>
    </div>

    <!-- Products Grid - No Emojis Used -->
    <% if (plants == null || plants.isEmpty()) { %>
    <div class="text-center py-20 bg-white rounded-2xl shadow-sm">
        <i class="fas fa-leaf text-7xl text-gray-300 mb-4"></i>
        <h3 class="text-xl font-semibold text-gray-700 mb-2">No plants found</h3>
        <p class="text-gray-400">Try a different search term or category</p>
        <a href="${pageContext.request.contextPath}/plants" class="inline-block mt-6 text-teal-600 hover:underline">Clear all filters</a>
    </div>
    <% } else { %>
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
        <% for (Plant plant : plants) { 
           int displayPrice = (int) Math.round(plant.getPrice());
           int originalPrice = (int) Math.round(plant.getPrice() * 1.2);
        %>
        <div class="bg-white rounded-2xl overflow-hidden shadow-lg card-hover group">
            <!-- Product Image -->
            <div class="relative h-56 overflow-hidden">
                <img src="<%= plant.getImageUrl() %>" 
                     alt="<%= plant.getName() %>"
                     class="w-full h-full object-cover group-hover:scale-110 transition duration-500" />
                
                <!-- Category Badge -->
                <span class="absolute top-3 left-3 bg-teal-500 text-white text-xs font-bold px-3 py-1 rounded-full z-10">
                    <%= plant.getCategory() %>
                </span>
                
                <!-- Stock Warning Badge -->
                <% if (plant.getStockQuantity() <= 5 && plant.getStockQuantity() > 0) { %>
                <span class="absolute top-3 right-3 bg-orange-500 text-white text-xs font-bold px-3 py-1 rounded-full z-10">
                    Only <%= plant.getStockQuantity() %> left
                </span>
                <% } %>
                
                <!-- Out of Stock Overlay -->
                <% if (plant.getStockQuantity() == 0) { %>
                <div class="absolute inset-0 bg-black bg-opacity-50 flex items-center justify-center text-white font-bold text-lg z-10">
                    Out of Stock
                </div>
                <% } %>
                
                <!-- Hover Actions -->
                <div class="absolute inset-0 bg-black bg-opacity-40 opacity-0 group-hover:opacity-100 transition flex items-center justify-center gap-3 z-20">
                    <a href="${pageContext.request.contextPath}/plants?view=detail&id=<%= plant.getPlantId() %>"
                       class="bg-white text-teal-700 p-3 rounded-full hover:scale-110 transition"
                       aria-label="View plant details">
                        <i class="fas fa-eye"></i>
                    </a>
                    <% if (plant.getStockQuantity() > 0) { %>
                    <form method="post" action="${pageContext.request.contextPath}/cart" class="inline">
                        <input type="hidden" name="plantId" value="<%= plant.getPlantId() %>" />
                        <input type="hidden" name="quantity" value="1" />
                        <button type="submit" class="bg-teal-600 text-white p-3 rounded-full hover:scale-110 transition"
                                aria-label="Add to cart">
                            <i class="fas fa-shopping-cart"></i>
                        </button>
                    </form>
                    <% } %>
                </div>
            </div>
            
            <!-- Product Info -->
            <div class="p-5">
                <h3 class="font-bold text-lg text-gray-800 mb-1"><%= plant.getName() %></h3>
                <p class="text-gray-400 text-sm line-clamp-2 mb-3"><%= plant.getDescription() %></p>
                
                <div class="flex items-center justify-between">
                    <!-- Price -->
                    <div>
                        <span class="text-2xl font-bold text-teal-600">
                            <span class="rupee-sign">₹</span><%= displayPrice %>
                        </span>
                        <% if (plant.getPrice() > 300) { %>
                        <span class="text-xs text-gray-400 line-through ml-2">
                            <span class="rupee-sign">₹</span><%= originalPrice %>
                        </span>
                        <% } %>
                    </div>
                    
                    <!-- Rating -->
                    <div class="flex items-center gap-1 text-yellow-400">
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star-half-alt"></i>
                    </div>
                </div>
            </div>
        </div>
        <% } %>
    </div>

    <div class="text-center mt-10">
    <p class="inline-flex items-center gap-2 px-6 py-3 bg-white shadow-md rounded-full text-teal-600 font-semibold text-lg border border-teal-100">
        <i class="fas fa-leaf text-green-500"></i>
        Explore Our Premium Plant Collection
    </p>
</div>
    <% } %>
</div>

<%@ include file="includes/footer.jsp"%>