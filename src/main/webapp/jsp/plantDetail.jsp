<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.Plant" %>
<%@ page import="com.greennursery.dao.PlantDAO" %>
<%
    Plant plant = (Plant) request.getAttribute("plant");
    if (plant == null) {
        response.sendRedirect(request.getContextPath() + "/plants");
        return;
    }
%>

<div class="max-w-7xl mx-auto px-4 py-12">
    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-8">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <a href="${pageContext.request.contextPath}/plants" class="hover:text-teal-600">Catalog</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600"><%= plant.getName() %></span>
    </div>

    <div class="grid md:grid-cols-2 gap-12">
        <!-- Product Image Gallery -->
        <div class="space-y-4">
            <div class="bg-white rounded-2xl overflow-hidden shadow-lg group">
                <img src="<%= plant.getImageUrl() %>" alt="<%= plant.getName() %>" 
                     class="w-full h-96 object-cover group-hover:scale-105 transition duration-500">
            </div>
            <div class="flex gap-4">
                <div class="w-24 h-24 rounded-xl overflow-hidden cursor-pointer border-2 border-teal-500">
                    <img src="<%= plant.getImageUrl() %>" alt="Thumb" class="w-full h-full object-cover">
                </div>
                <div class="w-24 h-24 rounded-xl overflow-hidden cursor-pointer border-2 border-transparent hover:border-teal-300 transition">
                    <img src="https://images.unsplash.com/photo-1614594975525-e45190c55d0b?w=100" alt="Thumb" class="w-full h-full object-cover">
                </div>
                <div class="w-24 h-24 rounded-xl overflow-hidden cursor-pointer border-2 border-transparent hover:border-teal-300 transition">
                    <img src="https://images.unsplash.com/photo-1593691509543-c55fb32d8de5?w=100" alt="Thumb" class="w-full h-full object-cover">
                </div>
            </div>
        </div>

        <!-- Product Info -->
        <div>
            <div class="mb-4">
                <span class="bg-teal-100 text-teal-700 text-sm font-semibold px-3 py-1 rounded-full"><%= plant.getCategory() %></span>
            </div>
            <h1 class="text-3xl md:text-4xl font-bold text-gray-800 mb-3"><%= plant.getName() %></h1>
            <div class="flex items-center gap-3 mb-4">
                <div class="flex text-yellow-400">
                    <i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i>
                </div>
                <span class="text-gray-500 text-sm">(128 reviews)</span>
                <span class="text-green-600 text-sm"><i class="fas fa-check-circle"></i> 150+ sold</span>
            </div>
            <div class="mb-6">
                <span class="text-4xl font-bold text-teal-600"><span class="rupee-sign">&#8377;</span><%= plant.getPrice() %></span>
                <% if (plant.getPrice() > 300) { %>
                <span class="text-gray-400 line-through ml-3"><span class="rupee-sign">&#8377;</span><%= (int)(plant.getPrice() * 1.2) %></span>
                <span class="bg-red-100 text-red-600 text-sm font-semibold px-2 py-1 rounded ml-3">Save 20%</span>
                <% } %>
            </div>
            
            <!-- Stock Status -->
            <div class="mb-6 p-4 bg-gray-50 rounded-xl">
                <div class="flex items-center gap-2 mb-2">
                    <i class="fas fa-boxes text-teal-600"></i>
                    <span class="font-semibold">Stock Status:</span>
                    <% if (plant.getStockQuantity() > 10) { %>
                        <span class="text-green-600">In Stock (<%= plant.getStockQuantity() %> available)</span>
                    <% } else if (plant.getStockQuantity() > 0) { %>
                        <span class="text-orange-600">Only <%= plant.getStockQuantity() %> left!</span>
                    <% } else { %>
                        <span class="text-red-600">Out of Stock</span>
                    <% } %>
                </div>
                <div class="w-full bg-gray-200 rounded-full h-2">
                    <div class="bg-teal-600 h-2 rounded-full" style="width: <%= Math.min(100, (plant.getStockQuantity() * 100 / 50)) %>%"></div>
                </div>
            </div>

            <p class="text-gray-600 leading-relaxed mb-6"><%= plant.getDescription() %></p>

            <!-- Quantity Selector -->
            <% if (plant.getStockQuantity() > 0) { %>
            <form method="post" action="${pageContext.request.contextPath}/cart" class="space-y-5">
                <input type="hidden" name="plantId" value="<%= plant.getPlantId() %>">
                <div class="flex items-center gap-4">
                    <span class="font-semibold text-gray-700">Quantity:</span>
                    <div class="flex items-center border border-gray-200 rounded-lg">
                        <button type="button" onclick="decrementQty()" class="px-3 py-2 hover:bg-gray-100 transition">-</button>
                        <input type="number" name="quantity" id="quantity" value="1" min="1" max="<%= plant.getStockQuantity() %>" 
                               class="w-16 text-center border-0 focus:outline-none">
                        <button type="button" onclick="incrementQty()" class="px-3 py-2 hover:bg-gray-100 transition">+</button>
                    </div>
                    <span class="text-gray-500 text-sm">Available: <%= plant.getStockQuantity() %></span>
                </div>

                <div class="flex flex-wrap gap-4">
                    <button type="submit" class="flex-1 bg-teal-600 text-white font-bold py-3 rounded-xl hover:bg-teal-700 transition flex items-center justify-center gap-2">
                        <i class="fas fa-shopping-cart"></i> Add to Cart
                    </button>
                    <button type="button" onclick="buyNow()" class="flex-1 bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition flex items-center justify-center gap-2">
                        <i class="fas fa-bolt"></i> Buy Now
                    </button>
                </div>
            </form>
            <% } else { %>
                <button disabled class="w-full bg-gray-300 text-gray-500 font-bold py-3 rounded-xl cursor-not-allowed">
                    Out of Stock
                </button>
            <% } %>

            <!-- Delivery Info -->
            <div class="mt-8 pt-6 border-t border-gray-200">
                <div class="grid grid-cols-2 gap-4 text-sm">
                    <div class="flex items-center gap-2"><i class="fas fa-truck text-teal-600"></i> Free Delivery on orders <span class="rupee-sign">₹</span>500+</div>
                    <div class="flex items-center gap-2"><i class="fas fa-undo-alt text-teal-600"></i> 7-Day Return Policy</div>
                    <div class="flex items-center gap-2"><i class="fas fa-shield-alt text-teal-600"></i> Secure Checkout</div>
                    <div class="flex items-center gap-2"><i class="fas fa-headset text-teal-600"></i> 24/7 Customer Support</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Product Details Tabs -->
    <div class="mt-16">
        <div class="border-b border-gray-200">
            <div class="flex gap-8">
                <button onclick="showTab('description')" id="tabDescBtn" class="pb-3 font-semibold text-teal-600 border-b-2 border-teal-600">Description</button>
                <button onclick="showTab('care')" id="tabCareBtn" class="pb-3 font-semibold text-gray-500 hover:text-teal-600 transition">Care Instructions</button>
                <button onclick="showTab('reviews')" id="tabReviewsBtn" class="pb-3 font-semibold text-gray-500 hover:text-teal-600 transition">Reviews (128)</button>
            </div>
        </div>
        
        <div id="description" class="tab-content pt-6">
            <div class="prose max-w-none">
                <p class="text-gray-600 leading-relaxed"><%= plant.getDescription() %></p>
                <ul class="mt-4 space-y-2 text-gray-600">
                    <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> Premium quality plant sourced from certified growers</li>
                    <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> Shipped in secure, eco-friendly packaging</li>
                    <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> Includes free plant care guide</li>
                    <li><i class="fas fa-check-circle text-teal-600 mr-2"></i> 7-day health guarantee</li>
                </ul>
            </div>
        </div>
        
        <div id="care" class="tab-content pt-6 hidden">
            <div class="grid md:grid-cols-2 gap-6">
                <div class="bg-gray-50 rounded-xl p-5">
                    <h3 class="font-bold text-lg mb-3"><i class="fas fa-sun text-teal-600 mr-2"></i> Light Requirements</h3>
                    <p class="text-gray-600">Bright indirect sunlight. Avoid direct afternoon sun which can burn leaves.</p>
                </div>
                <div class="bg-gray-50 rounded-xl p-5">
                    <h3 class="font-bold text-lg mb-3"><i class="fas fa-tint text-teal-600 mr-2"></i> Watering</h3>
                    <p class="text-gray-600">Water when top 1-2 inches of soil feels dry. Do not overwater.</p>
                </div>
                <div class="bg-gray-50 rounded-xl p-5">
                    <h3 class="font-bold text-lg mb-3"><i class="fas fa-temperature-low text-teal-600 mr-2"></i> Temperature</h3>
                    <p class="text-gray-600">Ideal temperature: 18-28°C. Protect from cold drafts.</p>
                </div>
                <div class="bg-gray-50 rounded-xl p-5">
                    <h3 class="font-bold text-lg mb-3"><i class="fas fa-seedling text-teal-600 mr-2"></i> Fertilizer</h3>
                    <p class="text-gray-600">Feed with balanced liquid fertilizer every 2-3 weeks during growing season.</p>
                </div>
            </div>
        </div>
        
        <div id="reviews" class="tab-content pt-6 hidden">
            <div class="space-y-6">
                <div class="flex items-center gap-6 pb-6 border-b border-gray-200">
                    <div class="text-center">
                        <div class="text-5xl font-bold text-gray-800">4.8</div>
                        <div class="flex text-yellow-400 mt-2"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star-half-alt"></i></div>
                        <p class="text-gray-500 text-sm mt-1">Based on 128 reviews</p>
                    </div>
                    <div class="flex-1 space-y-2">
                        <div class="flex items-center gap-2"><span class="w-12 text-sm">5 ★</span><div class="flex-1 bg-gray-200 rounded-full h-2"><div class="bg-teal-600 h-2 rounded-full w-4/5"></div></div><span class="text-sm">80%</span></div>
                        <div class="flex items-center gap-2"><span class="w-12 text-sm">4 ★</span><div class="flex-1 bg-gray-200 rounded-full h-2"><div class="bg-teal-600 h-2 rounded-full w-1/6"></div></div><span class="text-sm">15%</span></div>
                        <div class="flex items-center gap-2"><span class="w-12 text-sm">3 ★</span><div class="flex-1 bg-gray-200 rounded-full h-2"><div class="bg-teal-600 h-2 rounded-full w-1/20"></div></div><span class="text-sm">3%</span></div>
                    </div>
                </div>
                
                <div class="space-y-4">
                    <div class="border-b border-gray-100 pb-4">
                        <div class="flex items-center gap-2 mb-2"><div class="flex text-yellow-400"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div><span class="font-semibold">Priya S.</span><span class="text-gray-400 text-xs">2 days ago</span></div>
                        <p class="text-gray-600">Absolutely beautiful plant! Arrived in perfect condition. Highly recommend!</p>
                    </div>
                    <div class="border-b border-gray-100 pb-4">
                        <div class="flex items-center gap-2 mb-2"><div class="flex text-yellow-400"><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i><i class="fas fa-star"></i></div><span class="font-semibold">Rajesh K.</span><span class="text-gray-400 text-xs">5 days ago</span></div>
                        <p class="text-gray-600">Great quality plant. Packaging was excellent. Will order again.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Related Products -->
    <section class="mt-16">
        <h2 class="text-2xl font-bold text-gray-800 mb-6">You May Also Like</h2>
        <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            <!-- Related products would be dynamically loaded here -->
        </div>
    </section>
</div>

<script>
    function decrementQty() {
        let qty = document.getElementById('quantity');
        let val = parseInt(qty.value);
        if (val > 1) qty.value = val - 1;
    }
    function incrementQty() {
        let qty = document.getElementById('quantity');
        let val = parseInt(qty.value);
        let max = <%= plant.getStockQuantity() %>;
        if (val < max) qty.value = val + 1;
    }
    function buyNow() {
        let form = document.createElement('form');
        form.method = 'POST';
        form.action = '${pageContext.request.contextPath}/cart';
        let plantInput = document.createElement('input');
        plantInput.name = 'plantId';
        plantInput.value = '<%= plant.getPlantId() %>';
        let qtyInput = document.createElement('input');
        qtyInput.name = 'quantity';
        qtyInput.value = document.getElementById('quantity').value;
        form.appendChild(plantInput);
        form.appendChild(qtyInput);
        document.body.appendChild(form);
        form.submit();
    }
    function showTab(tab) {
        document.querySelectorAll('.tab-content').forEach(el => el.classList.add('hidden'));
        document.getElementById(tab).classList.remove('hidden');
        ['DescBtn', 'CareBtn', 'ReviewsBtn'].forEach(btn => {
            let el = document.getElementById('tab' + btn);
            if (el) {
                el.classList.remove('text-teal-600', 'border-teal-600');
                el.classList.add('text-gray-500', 'border-transparent');
            }
        });
        let activeBtn = document.getElementById('tab' + tab.charAt(0).toUpperCase() + tab.slice(1) + 'Btn');
        if (activeBtn) {
            activeBtn.classList.add('text-teal-600', 'border-teal-600');
            activeBtn.classList.remove('text-gray-500', 'border-transparent');
        }
    }
</script>

<%@ include file="includes/footer.jsp" %>