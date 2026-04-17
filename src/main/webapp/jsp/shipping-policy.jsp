<%@ include file="includes/header.jsp" %>

<div class="max-w-4xl mx-auto px-4 py-12">
    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600">Shipping Policy</span>
    </div>

    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6">
            <h1 class="text-3xl font-bold text-white">Shipping Policy</h1>
            <p class="text-teal-100 mt-1">Last updated: January 2024</p>
        </div>
        
        <div class="p-8 space-y-6">
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">1. Delivery Areas</h2>
                <p class="text-gray-600 leading-relaxed">We currently deliver across all major cities in India. Delivery to remote areas may take additional 2-3 business days.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">2. Shipping Charges</h2>
                <p class="text-gray-600 leading-relaxed">Free shipping on all orders above ₹500. For orders below ₹500, a flat shipping fee of ₹50 will be applied.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">3. Delivery Timeline</h2>
                <ul class="list-disc list-inside text-gray-600 space-y-2 ml-4">
                    <li>Metro Cities: 3-5 business days</li>
                    <li>Tier 2 Cities: 5-7 business days</li>
                    <li>Remote Areas: 7-10 business days</li>
                </ul>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">4. Tracking Your Order</h2>
                <p class="text-gray-600 leading-relaxed">Once your order is shipped, you will receive a tracking number via email and SMS. You can track your order on our website under "My Orders" section.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">5. Packaging</h2>
                <p class="text-gray-600 leading-relaxed">All plants are carefully packed in eco-friendly, secure packaging to ensure they reach you in perfect condition.</p>
            </div>
            
            <div class="bg-teal-50 rounded-xl p-4">
                <i class="fas fa-envelope text-teal-600 mr-2"></i>
                <span class="text-gray-700">For shipping-related queries, contact us at: <strong>shipping@greennursery.com</strong></span>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>