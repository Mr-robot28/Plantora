<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.CartItem" %>
<%@ page import="java.util.List" %>
<%
    List<CartItem> cartItems = (List<CartItem>) request.getAttribute("cartItems");
    Double total = (Double) request.getAttribute("cartTotal");
    if (total == null) total = 0.0;
%>

<div class="max-w-7xl mx-auto px-4 py-12">
    <div class="text-center mb-12">
        <h1 class="text-4xl md:text-5xl font-bold text-gray-800 mb-4">Shopping Cart</h1>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
    </div>

    <% if (cartItems == null || cartItems.isEmpty()) { %>
    <div class="text-center py-20 bg-white rounded-3xl shadow-sm">
        <div class="text-8xl mb-4"><i class="fas fa-shopping-cart"></i></div>
        <h3 class="text-2xl font-semibold text-gray-700 mb-2">Your cart is empty</h3>
        <p class="text-gray-400 mb-6">Looks like you haven't added any plants to your cart yet</p>
        <a href="${pageContext.request.contextPath}/plants" 
           class="inline-flex items-center gap-2 bg-gradient-to-r from-teal-600 to-emerald-600 text-white px-8 py-3 rounded-xl font-semibold hover:shadow-lg transition">
            <i class="fas fa-leaf"></i> Start Shopping
        </a>
    </div>
    <% } else { %>
    <div class="grid lg:grid-cols-3 gap-8">
        <!-- Cart Items -->
        <div class="lg:col-span-2 space-y-4">
            <% for (CartItem ci : cartItems) { %>
            <div class="bg-white rounded-2xl shadow-lg p-4 flex flex-col sm:flex-row gap-4 hover:shadow-xl transition group">
                <div class="w-28 h-28 flex-shrink-0 bg-gray-100 rounded-xl overflow-hidden">
                    <img src="<%= ci.getPlantImage() %>" alt="<%= ci.getPlantName() %>" 
                         class="w-full h-full object-cover group-hover:scale-110 transition duration-300">
                </div>
                <div class="flex-1">
                    <div class="flex flex-wrap justify-between gap-2">
                        <div>
                            <h3 class="font-bold text-lg text-gray-800"><%= ci.getPlantName() %></h3>
                            <p class="text-teal-600 font-semibold"><span class="rupee-sign">&#8377;</span><%= ci.getPlantPrice() %></p>
                        </div>
                        <div class="text-right">
                            <p class="font-bold text-gray-800"><span class="rupee-sign">&#8377;</span><%= ci.getSubtotal() %></p>
                            <a href="${pageContext.request.contextPath}/cart?action=remove&cartId=<%= ci.getCartId() %>" 
                               class="text-red-500 text-sm hover:underline inline-flex items-center gap-1 mt-1"
                               onclick="return confirm('Remove this item from cart?')">
                                <i class="fas fa-trash-alt"></i> Remove
                            </a>
                        </div>
                    </div>
                    <div class="flex items-center gap-3 mt-3">
                        <label class="text-sm text-gray-500">Quantity:</label>
                        <div class="flex items-center border border-gray-200 rounded-lg">
                            <button onclick="updateQty(<%= ci.getCartId() %>, '<%= ci.getPlantId() %>', 'dec')" class="px-3 py-1 hover:bg-gray-100 transition">-</button>
                            <span id="qty_<%= ci.getCartId() %>" class="px-4 py-1 min-w-[50px] text-center"><%= ci.getQuantity() %></span>
                            <button onclick="updateQty(<%= ci.getCartId() %>, '<%= ci.getPlantId() %>', 'inc')" class="px-3 py-1 hover:bg-gray-100 transition">+</button>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>

        <!-- Order Summary -->
        <div class="lg:col-span-1">
            <div class="bg-white rounded-2xl shadow-lg p-6 sticky top-24">
                <h3 class="text-xl font-bold text-gray-800 mb-4">Order Summary</h3>
                <div class="space-y-3 pb-4 border-b border-gray-200">
                    <div class="flex justify-between text-gray-600">
                        <span>Subtotal (<%= cartItems.size() %> items)</span>
                        <span><span class="rupee-sign">₹</span><%= total %></span>
                    </div>
                    <div class="flex justify-between text-gray-600">
                        <span>Delivery Charges</span>
                        <span class="text-green-600">FREE</span>
                    </div>
                    <div class="flex justify-between text-gray-600">
                        <span>GST (5%)</span>
                        <span><span class="rupee-sign">&#8377;</span><%= Math.round(total * 0.05) %></span>
                    </div>
                </div>
                <div class="flex justify-between font-bold text-xl mt-4 pb-4 border-b border-gray-200">
                    <span>Total Amount</span>
                    <span class="text-teal-600"><span class="rupee-sign">&#8377;</span><%= total + Math.round(total * 0.05) %></span>
                </div>
                
                <div class="mt-4 p-3 bg-gray-50 rounded-xl text-sm text-gray-500">
                    <i class="fas fa-truck mr-2 text-teal-600"></i> Free delivery on orders above <span class="rupee-sign">&#8377;</span>500
                </div>
                
                <div class="mt-6 space-y-3">
                    <input type="text" placeholder="Promo Code" 
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    <button class="w-full border-2 border-teal-600 text-teal-600 font-semibold py-3 rounded-xl hover:bg-teal-50 transition">
                        Apply Coupon
                    </button>
                    <a href="${pageContext.request.contextPath}/jsp/checkout.jsp" 
                       class="w-full block text-center bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition">
                        Proceed to Checkout <i class="fas fa-arrow-right ml-2"></i>
                    </a>
                    <a href="${pageContext.request.contextPath}/plants" 
                       class="w-full block text-center text-teal-600 hover:underline">
                        ← Continue Shopping
                    </a>
                </div>
            </div>
        </div>
    </div>
    <% } %>
</div>

<script>
    function updateQty(cartId, plantId, action) {
        let currentQty = parseInt(document.getElementById('qty_' + cartId).innerText);
        let newQty = action === 'inc' ? currentQty + 1 : currentQty - 1;
        if (newQty < 1) return;
        
        fetch('${pageContext.request.contextPath}/cart?action=update', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: 'cartId=' + cartId + '&quantity=' + newQty
        }).then(response => {
            if (response.ok) window.location.reload();
        });
    }
</script>

<%@ include file="includes/footer.jsp" %>