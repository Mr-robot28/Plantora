<%@ include file="includes/header.jsp" %>

<div class="max-w-4xl mx-auto px-4 py-12">
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600">Terms of Service</span>
    </div>

    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6">
            <h1 class="text-3xl font-bold text-white">Terms of Service</h1>
            <p class="text-teal-100 mt-1">Last updated: January 2024</p>
        </div>
        
        <div class="p-8 space-y-6">
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">1. Acceptance of Terms</h2>
                <p class="text-gray-600 leading-relaxed">By accessing and using Green Nursery website, you agree to be bound by these Terms of Service and all applicable laws and regulations.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">2. Account Registration</h2>
                <p class="text-gray-600 leading-relaxed">You must be at least 18 years old to create an account. You are responsible for maintaining the confidentiality of your account credentials.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">3. Orders and Payments</h2>
                <ul class="list-disc list-inside text-gray-600 space-y-2 ml-4">
                    <li>All orders are subject to availability</li>
                    <li>Prices are subject to change without notice</li>
                    <li>We reserve the right to refuse or cancel orders</li>
                    <li>Payment must be completed at the time of order</li>
                </ul>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">4. Product Information</h2>
                <p class="text-gray-600 leading-relaxed">We strive to display accurate product information, including images and descriptions. However, actual plants may vary slightly due to natural variations.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">5. Limitation of Liability</h2>
                <p class="text-gray-600 leading-relaxed">Green Nursery shall not be liable for any indirect, incidental, or consequential damages arising from the use of our products or website.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">6. Modifications</h2>
                <p class="text-gray-600 leading-relaxed">We reserve the right to modify these terms at any time. Continued use of the website constitutes acceptance of the modified terms.</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>