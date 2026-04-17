<%@ include file="includes/header.jsp" %>

<div class="max-w-4xl mx-auto px-4 py-12">
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600">Privacy Policy</span>
    </div>

    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6">
            <h1 class="text-3xl font-bold text-white">Privacy Policy</h1>
            <p class="text-teal-100 mt-1">Last updated: January 2024</p>
        </div>
        
        <div class="p-8 space-y-6">
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">1. Information We Collect</h2>
                <p class="text-gray-600 leading-relaxed">We collect information you provide directly to us, including name, email address, phone number, shipping address, and payment information when you register, place an order, or contact us.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">2. How We Use Your Information</h2>
                <ul class="list-disc list-inside text-gray-600 space-y-2 ml-4">
                    <li>Process and fulfill your orders</li>
                    <li>Send order confirmations and updates</li>
                    <li>Respond to customer service requests</li>
                    <li>Send promotional offers (with your consent)</li>
                    <li>Improve our website and services</li>
                </ul>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">3. Information Sharing</h2>
                <p class="text-gray-600 leading-relaxed">We do not sell, trade, or rent your personal information to third parties. We may share information with trusted partners who assist in order fulfillment, payment processing, and delivery services.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">4. Data Security</h2>
                <p class="text-gray-600 leading-relaxed">We implement industry-standard security measures to protect your personal information. All payment transactions are encrypted using SSL technology.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">5. Cookies</h2>
                <p class="text-gray-600 leading-relaxed">We use cookies to enhance your browsing experience, analyze site traffic, and personalize content. You can disable cookies in your browser settings.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">6. Your Rights</h2>
                <p class="text-gray-600 leading-relaxed">You have the right to access, correct, or delete your personal information. Contact us at privacy@greennursery.com for any privacy-related requests.</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>