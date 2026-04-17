<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.dao.PlantDAO" %>
<%@ page import="com.greennursery.model.Plant" %>
<%@ page import="java.util.List" %>
<%
    List<Plant> featured = new PlantDAO().getAllPlants();
    if (featured.size() > 8) featured = featured.subList(0, 8);
%>

<!-- HERO SECTION -->
<section class="relative overflow-hidden bg-gradient-to-br from-emerald-900 via-teal-800 to-cyan-700">
    <!-- Animated Background -->
    <div class="absolute inset-0 opacity-20">
        <div class="absolute top-20 left-10 w-72 h-72 bg-white rounded-full blur-3xl animate-pulse"></div>
        <div class="absolute bottom-20 right-10 w-96 h-96 bg-yellow-300 rounded-full blur-3xl animate-pulse delay-1000"></div>
    </div>
    
    <div class="relative max-w-7xl mx-auto px-4 py-20 md:py-32">
        <div class="grid md:grid-cols-2 gap-12 items-center">
            <div class="text-white fade-up" style="animation: slideUp 0.6s ease-out">
                <div class="inline-block bg-white/20 backdrop-blur-sm rounded-full px-4 py-1 text-sm mb-6">
                    <i class="fas fa-seedling"></i> Welcome to Green Nursery
                </div>
                <h1 class="text-5xl md:text-6xl lg:text-7xl font-extrabold leading-tight mb-6">
                    Bring Nature<br>Into Your <span class="text-emerald-300">Home</span>
                </h1>
                <p class="text-lg md:text-xl text-gray-100 mb-8 leading-relaxed">
                    Discover handpicked indoor & outdoor plants. Freshly sourced, expertly cared for, 
                    and delivered safely to your doorstep with free plant care consultation.
                </p>
                <div class="flex flex-wrap gap-4">
                    <a href="${pageContext.request.contextPath}/plants" 
                       class="bg-white text-teal-700 font-bold px-8 py-4 rounded-xl hover:shadow-2xl transition-all duration-300 flex items-center gap-2 group">
                        <span>Shop Now</span>
                        <i class="fas fa-arrow-right group-hover:translate-x-1 transition"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/appointment" 
                       class="border-2 border-white text-white px-8 py-4 rounded-xl hover:bg-white hover:text-teal-700 transition-all duration-300 flex items-center gap-2">
                        <i class="fas fa-calendar-alt"></i>
                        <span>Book a Visit</span>
                    </a>
                </div>
                <!-- Trust Badges -->
                <div class="flex gap-6 mt-8 text-sm">
                    <div class="flex items-center gap-2"><i class="fas fa-truck-fast"></i> Free Delivery</div>
                    <div class="flex items-center gap-2"><i class="fas fa-shield-alt"></i> 7-Day Guarantee</div>
                    <div class="flex items-center gap-2"><i class="fas fa-headset"></i> 24/7 Support</div>
                </div>
            </div>
            <div class="relative fade-up" style="animation: slideUp 0.6s ease-out 0.2s both">
                <div class="relative">
                    <img src="https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?w=600" 
                         alt="Hero Plant" 
                         class="rounded-3xl shadow-2xl w-full object-cover transform hover:scale-105 transition duration-700">
                    <div class="absolute -bottom-6 -left-6 bg-white rounded-2xl p-4 shadow-xl">
                        <div class="flex items-center gap-3">
                            <div class="text-3xl"><i class="fas fa-star"></i> 4.9</div>
                            <div><p class="text-sm font-semibold">10,000+</p><p class="text-xs text-gray-500">Happy Customers</p></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Wave Divider -->
    <div class="absolute bottom-0 left-0 w-full overflow-hidden leading-[0]">
        <svg class="relative block w-full h-12 md:h-16" viewBox="0 0 1200 120" preserveAspectRatio="none">
            <path d="M321.39,56.44c58-10.79,114.16-30.13,172-41.86,82.39-16.72,168.19-17.73,250.45-.39C823.78,31,906.67,72,985.66,92.83c70.05,18.48,146.53,26.09,214.34,3V120H0V95.8C0,95.8,0,0,0,0Z" fill="#f9fafb"></path>
        </svg>
    </div>
</section>

<!-- STATS SECTION -->
<section class="bg-gray-50 py-16">
    <div class="max-w-7xl mx-auto px-4">
        <div class="grid grid-cols-2 md:grid-cols-4 gap-8">
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="text-5xl mb-3 group-hover:scale-110 transition"><i class="fas fa-leaf"></i></div>
                <p class="text-3xl font-bold text-teal-600">500+</p>
                <p class="text-gray-500 text-sm">Plant Varieties</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="text-5xl mb-3 group-hover:scale-110 transition"><i class="fas fa-users"></i></div>
                <p class="text-3xl font-bold text-teal-600">10K+</p>
                <p class="text-gray-500 text-sm">Happy Customers</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="text-5xl mb-3 group-hover:scale-110 transition"><i class="fas fa-trophy"></i></div>
                <p class="text-3xl font-bold text-teal-600">15+</p>
                <p class="text-gray-500 text-sm">Years Experience</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="text-5xl mb-3 group-hover:scale-110 transition"><i class="fas fa-seedling"></i></div>
                <p class="text-3xl font-bold text-teal-600">100%</p>
                <p class="text-gray-500 text-sm">Organic Plants</p>
            </div>
        </div>
    </div>
</section>

<!-- FEATURED PLANTS SECTION -->
<section class="max-w-7xl mx-auto px-4 py-20">
    <div class="text-center mb-12">
        <p class="text-teal-600 font-semibold tracking-wider text-sm uppercase mb-2">Our Collection</p>
        <h2 class="text-4xl md:text-5xl font-bold text-gray-800 mb-4">Featured Plants</h2>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        <p class="text-gray-500 mt-4 max-w-2xl mx-auto">Discover our most popular plants, handpicked for your home and garden</p>
    </div>
    
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
        <% for (Plant p : featured) { %>
        <div class="bg-white rounded-2xl overflow-hidden shadow-lg card-hover group">
            <div class="relative h-56 overflow-hidden">
                <img src="<%= p.getImageUrl() %>" alt="<%= p.getName() %>"
                     class="w-full h-full object-cover group-hover:scale-110 transition duration-500"/>
                <span class="absolute top-3 left-3 bg-teal-500 text-white text-xs font-bold px-3 py-1 rounded-full">
                    <%= p.getCategory() %>
                </span>
                <% if (p.getStockQuantity() <= 5 && p.getStockQuantity() > 0) { %>
                <span class="absolute top-3 right-3 bg-orange-500 text-white text-xs font-bold px-3 py-1 rounded-full">
                    Only <%= p.getStockQuantity() %> left
                </span>
                <% } %>
                <div class="absolute inset-0 bg-black/40 opacity-0 group-hover:opacity-100 transition flex items-center justify-center gap-3">
                    <a href="${pageContext.request.contextPath}/plants?view=detail&id=<%= p.getPlantId() %>"
                       class="bg-white text-teal-700 p-2 rounded-full hover:scale-110 transition">
                        <i class="fas fa-eye"></i>
                    </a>
                    <% if (p.getStockQuantity() > 0) { %>
                    <form method="post" action="${pageContext.request.contextPath}/cart">
                        <input type="hidden" name="plantId" value="<%= p.getPlantId() %>"/>
                        <input type="hidden" name="quantity" value="1"/>
                        <button type="submit" class="bg-teal-600 text-white p-2 rounded-full hover:scale-110 transition">
                            <i class="fas fa-shopping-cart"></i>
                        </button>
                    </form>
                    <% } %>
                </div>
            </div>
            <div class="p-5">
                <h3 class="font-bold text-lg text-gray-800 mb-1"><%= p.getName() %></h3>
                <p class="text-gray-400 text-sm line-clamp-2 mb-3"><%= p.getDescription() %></p>
                <div class="flex items-center justify-between">
                    <div>
                        <span class="text-2xl font-bold text-teal-600"><span class="rupee-sign">&#8377;</span><%= p.getPrice() %></span>
                        <% if (p.getPrice() > 300) { %>
                        <span class="text-xs text-gray-400 line-through ml-2"><span class="rupee-sign">&#8377;</span><%= (int)(p.getPrice() * 1.2) %></span>
                        <% } %>
                    </div>
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
    
    <div class="text-center mt-12">
        <a href="${pageContext.request.contextPath}/plants" 
           class="inline-flex items-center gap-2 bg-gradient-to-r from-teal-600 to-emerald-600 text-white px-8 py-3 rounded-xl font-semibold hover:shadow-xl transition-all hover:scale-105">
            <span>View All Plants</span>
            <i class="fas fa-arrow-right"></i>
        </a>
    </div>
</section>

<!-- CATEGORY BANNERS -->
<section class="max-w-7xl mx-auto px-4 py-12">
    <div class="grid md:grid-cols-3 gap-6">
        <div class="relative rounded-2xl overflow-hidden group cursor-pointer">
            <img src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=500" alt="Indoor" class="w-full h-64 object-cover group-hover:scale-105 transition duration-500">
            <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end p-6">
                <div>
                    <h3 class="text-white text-2xl font-bold">Indoor Plants</h3>
                    <p class="text-gray-200 text-sm">10+ varieties</p>
                </div>
            </div>
        </div>
        <div class="relative rounded-2xl overflow-hidden group cursor-pointer">
            <img src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=500" alt="Outdoor" class="w-full h-64 object-cover group-hover:scale-105 transition duration-500">
            <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end p-6">
                <div>
                    <h3 class="text-white text-2xl font-bold">Outdoor Plants</h3>
                    <p class="text-gray-200 text-sm">15+ varieties</p>
                </div>
            </div>
        </div>
        <div class="relative rounded-2xl overflow-hidden group cursor-pointer">
            <img src="https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=500" alt="Succulents" class="w-full h-64 object-cover group-hover:scale-105 transition duration-500">
            <div class="absolute inset-0 bg-gradient-to-t from-black/70 to-transparent flex items-end p-6">
                <div>
                    <h3 class="text-white text-2xl font-bold">Succulents</h3>
                    <p class="text-gray-200 text-sm">8+ varieties</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- WHY CHOOSE US -->
<section class="bg-gradient-to-r from-teal-50 to-emerald-50 py-20">
    <div class="max-w-7xl mx-auto px-4">
        <div class="text-center mb-12">
            <h2 class="text-4xl font-bold text-gray-800 mb-4">Why Choose Green Nursery?</h2>
            <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        </div>
        <div class="grid md:grid-cols-4 gap-8">
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="w-20 h-20 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4 group-hover:bg-teal-600 group-hover:scale-110 transition">
                    <i class="fas fa-seedling text-3xl text-teal-600 group-hover:text-white transition"></i>
                </div>
                <h3 class="font-bold text-lg mb-2">100% Organic</h3>
                <p class="text-gray-500 text-sm">All plants grown with natural fertilizers, no harmful chemicals</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="w-20 h-20 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4 group-hover:bg-teal-600 group-hover:scale-110 transition">
                    <i class="fas fa-truck text-3xl text-teal-600 group-hover:text-white transition"></i>
                </div>
                <h3 class="font-bold text-lg mb-2">Safe Delivery</h3>
                <p class="text-gray-500 text-sm">Carefully packed and delivered fresh to your doorstep</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="w-20 h-20 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4 group-hover:bg-teal-600 group-hover:scale-110 transition">
                    <i class="fas fa-chalkboard-user text-3xl text-teal-600 group-hover:text-white transition"></i>
                </div>
                <h3 class="font-bold text-lg mb-2">Expert Guidance</h3>
                <p class="text-gray-500 text-sm">Our horticulture experts provide lifetime plant care support</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm hover:shadow-xl transition group">
                <div class="w-20 h-20 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4 group-hover:bg-teal-600 group-hover:scale-110 transition">
                    <i class="fas fa-shield-alt text-3xl text-teal-600 group-hover:text-white transition"></i>
                </div>
                <h3 class="font-bold text-lg mb-2">7-Day Guarantee</h3>
                <p class="text-gray-500 text-sm">Not satisfied? Get a full refund within 7 days</p>
            </div>
        </div>
    </div>
</section>

<!-- TESTIMONIALS -->
<section class="max-w-7xl mx-auto px-4 py-20">
    <div class="text-center mb-12">
        <p class="text-teal-600 font-semibold tracking-wider text-sm uppercase">Testimonials</p>
        <h2 class="text-4xl font-bold text-gray-800 mb-4">What Our Customers Say</h2>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
    </div>
    <div class="grid md:grid-cols-3 gap-8">
        <!-- Testimonial 1 -->
        <div class="bg-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition">
            <div class="flex text-yellow-400 mb-4">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <p class="text-gray-600 mb-4">"Amazing quality plants! The Monstera I ordered arrived in perfect condition. Will definitely order again."</p>
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-gradient-to-r from-teal-500 to-emerald-500 rounded-full flex items-center justify-center text-white font-bold text-lg">
                    P
                </div>
                <div>
                    <p class="font-semibold text-gray-800">Priya Sharma</p>
                    <p class="text-xs text-gray-400">
                        <i class="fas fa-check-circle text-green-500 text-xs mr-1"></i> Verified Buyer
                    </p>
                </div>
            </div>
        </div>

        <!-- Testimonial 2 (Featured - slightly larger) -->
        <div class="bg-white p-6 rounded-2xl shadow-lg transform md:scale-105 hover:shadow-xl transition">
            <div class="flex text-yellow-400 mb-4">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <p class="text-gray-600 mb-4">"Beautiful plants and great customer service. The delivery was prompt and packaging was excellent."</p>
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-gradient-to-r from-teal-500 to-emerald-500 rounded-full flex items-center justify-center text-white font-bold text-lg">
                    R
                </div>
                <div>
                    <p class="font-semibold text-gray-800">Rajesh Kumar</p>
                    <p class="text-xs text-gray-400">
                        <i class="fas fa-check-circle text-green-500 text-xs mr-1"></i> Verified Buyer
                    </p>
                </div>
            </div>
        </div>

        <!-- Testimonial 3 -->
        <div class="bg-white p-6 rounded-2xl shadow-lg hover:shadow-xl transition">
            <div class="flex text-yellow-400 mb-4">
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
                <i class="fas fa-star"></i>
            </div>
            <p class="text-gray-600 mb-4">"Love the variety! The plants are healthy and thriving. Their plant care tips are very helpful."</p>
            <div class="flex items-center gap-3">
                <div class="w-10 h-10 bg-gradient-to-r from-teal-500 to-emerald-500 rounded-full flex items-center justify-center text-white font-bold text-lg">
                    N
                </div>
                <div>
                    <p class="font-semibold text-gray-800">Neha Gupta</p>
                    <p class="text-xs text-gray-400">
                        <i class="fas fa-check-circle text-green-500 text-xs mr-1"></i> Verified Buyer
                    </p>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>