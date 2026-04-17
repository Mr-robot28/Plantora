<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.dao.CartDAO" %>
<%@ page import="com.greennursery.model.*" %>
<%@ page import="java.util.List" %>
<%
    User u = (User) session.getAttribute("user");
    if (u == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    List<CartItem> items = new CartDAO().getCartItems(u.getUserId());
    if (items == null || items.isEmpty()) {
        response.sendRedirect(request.getContextPath() + "/cart");
        return;
    }
    double subtotal = items.stream().mapToDouble(CartItem::getSubtotal).sum();
    double gst = subtotal * 0.05;
    double total = subtotal + gst;
%>

<div class="max-w-6xl mx-auto px-4 py-12">
    <div class="text-center mb-8">
        <h1 class="text-4xl font-bold text-gray-800 mb-2">Checkout</h1>
        <p class="text-gray-500">Complete your purchase</p>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <div class="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3 rounded-lg mb-6 flex items-center gap-3 max-w-2xl mx-auto">
        <i class="fas fa-exclamation-circle"></i>
        <span><%= request.getAttribute("error") %></span>
    </div>
    <% } %>

    <div class="grid lg:grid-cols-3 gap-8">
        <!-- Checkout Form -->
        <div class="lg:col-span-2">
            <form method="post" action="${pageContext.request.contextPath}/order" id="checkoutForm">
                <!-- Delivery Address -->
                <div class="bg-white rounded-2xl shadow-lg p-6 mb-6">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center gap-2">
                        <i class="fas fa-map-marker-alt text-teal-600"></i> Delivery Address
                    </h3>
                    <div class="space-y-4">
                        <div>
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Full Name</label>
                            <input type="text" value="<%= u.getName() %>" readonly
                                   class="w-full px-4 py-3 border border-gray-200 rounded-xl bg-gray-50">
                        </div>
                        <div>
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Phone Number</label>
                            <input type="text" value="<%= u.getPhone() != null ? u.getPhone() : "" %>" readonly
                                   class="w-full px-4 py-3 border border-gray-200 rounded-xl bg-gray-50">
                        </div>
                        <div>
                            <label class="block text-sm font-semibold text-gray-700 mb-2">Delivery Address *</label>
                            <textarea name="deliveryAddress" required rows="4" 
                                      placeholder="Enter your full delivery address (House No., Street, City, PIN Code)"
                                      class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500"></textarea>
                        </div>
                        <div class="grid grid-cols-2 gap-4">
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">City</label>
                                <input type="text" name="city" placeholder="City" required
                                       class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                            </div>
                            <div>
                                <label class="block text-sm font-semibold text-gray-700 mb-2">PIN Code</label>
                                <input type="text" name="pincode" placeholder="PIN Code" required
                                       class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Payment Method -->
                <div class="bg-white rounded-2xl shadow-lg p-6 mb-6">
                    <h3 class="text-lg font-bold text-gray-800 mb-4 flex items-center gap-2">
                        <i class="fas fa-credit-card text-teal-600"></i> Payment Method
                    </h3>
                    <div class="space-y-3">
                        <label class="flex items-center gap-3 p-3 border border-gray-200 rounded-xl cursor-pointer hover:bg-gray-50 transition">
                            <input type="radio" name="payment" value="cod" checked class="w-4 h-4 text-teal-600">
                            <div class="flex-1 flex items-center justify-between">
                                <div><i class="fas fa-money-bill-wave text-teal-600 mr-2"></i> Cash on Delivery</div>
                                <span class="text-xs text-green-600">Pay when delivered</span>
                            </div>
                        </label>
                        <label class="flex items-center gap-3 p-3 border border-gray-200 rounded-xl cursor-pointer hover:bg-gray-50 transition">
                            <input type="radio" name="payment" value="card" class="w-4 h-4 text-teal-600">
                            <div class="flex-1 flex items-center justify-between">
                                <div><i class="fab fa-cc-visa text-teal-600 mr-2"></i> Credit/Debit Card</div>
                                <span class="text-xs text-gray-400">Visa, Mastercard, RuPay</span>
                            </div>
                        </label>
                        <label class="flex items-center gap-3 p-3 border border-gray-200 rounded-xl cursor-pointer hover:bg-gray-50 transition">
                            <input type="radio" name="payment" value="upi" class="w-4 h-4 text-teal-600">
                            <div class="flex-1 flex items-center justify-between">
                                <div><i class="fas fa-qrcode text-teal-600 mr-2"></i> UPI / QR Code</div>
                                <span class="text-xs text-gray-400">Google Pay, PhonePe, Paytm</span>
                            </div>
                        </label>
                    </div>
                </div>

                <button type="submit" class="w-full bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-4 rounded-xl hover:shadow-lg transition text-lg">
                    Place Order <i class="fas fa-check-circle ml-2"></i>
                </button>
            </form>
        </div>

        <!-- Order Summary -->
        <div class="lg:col-span-1">
            <div class="bg-white rounded-2xl shadow-lg p-6 sticky top-24">
                <h3 class="text-lg font-bold text-gray-800 mb-4">Your Order</h3>
                <div class="space-y-3 max-h-80 overflow-y-auto">
                    <% for (CartItem ci : items) { %>
                    <div class="flex gap-3 py-2 border-b border-gray-100">
                        <img src="<%= ci.getPlantImage() %>" alt="<%= ci.getPlantName() %>" class="w-12 h-12 rounded-lg object-cover">
                        <div class="flex-1">
                            <p class="font-semibold text-sm"><%= ci.getPlantName() %></p>
                            <p class="text-xs text-gray-500">Qty: <%= ci.getQuantity() %></p>
                        </div>
                        <p class="font-semibold text-teal-600"><span class="rupee-sign">₹</span><%= ci.getSubtotal() %></p>
                    </div>
                    <% } %>
                </div>
                
                <div class="mt-4 pt-4 border-t border-gray-200 space-y-2">
                    <div class="flex justify-between text-gray-600">
                        <span>Subtotal</span>
                        <span><span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span><%= subtotal %></span>
                    </div>
                    <div class="flex justify-between text-gray-600">
                        <span>GST (5%)</span>
                        <span><span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span><%= Math.round(gst) %></span>
                    </div>
                    <div class="flex justify-between font-bold text-xl pt-2">
                        <span>Total</span>
                        <span class="text-teal-600"><span class="rupee-sign"><span class="rupee-sign">&#8377;</span></span><%= Math.round(total) %></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>