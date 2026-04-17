<%@ include file="includes/header.jsp" %>

<div class="max-w-4xl mx-auto px-4 py-12">
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600">Return Policy</span>
    </div>

    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6">
            <h1 class="text-3xl font-bold text-white">Return Policy</h1>
            <p class="text-teal-100 mt-1">Last updated: January 2024</p>
        </div>
        
        <div class="p-8 space-y-6">
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">1. 7-Day Guarantee</h2>
                <p class="text-gray-600 leading-relaxed">We offer a 7-day guarantee on all plants. If your plant arrives damaged or dies within 7 days of delivery, we will replace it or issue a full refund.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">2. Eligibility for Return</h2>
                <ul class="list-disc list-inside text-gray-600 space-y-2 ml-4">
                    <li>Plant arrived damaged or broken</li>
                    <li>Wrong plant delivered</li>
                    <li>Plant shows signs of disease or pest infestation</li>
                    <li>Plant dies within 7 days of delivery (with photo proof)</li>
                </ul>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">3. Non-Returnable Items</h2>
                <ul class="list-disc list-inside text-gray-600 space-y-2 ml-4">
                    <li>Plants damaged due to customer negligence</li>
                    <li>Plants after 7 days of delivery</li>
                    <li>Sale items (unless damaged)</li>
                    <li>Planters and accessories</li>
                </ul>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">4. Return Process</h2>
                <p class="text-gray-600 leading-relaxed">To initiate a return, please contact us within 7 days of delivery with photos of the damaged plant. Our team will verify and arrange for replacement or refund.</p>
            </div>
            
            <div>
                <h2 class="text-xl font-bold text-gray-800 mb-3">5. Refund Timeline</h2>
                <p class="text-gray-600 leading-relaxed">Refunds are processed within 5-7 business days after return approval. The amount will be credited to your original payment method.</p>
            </div>
            
            <div class="bg-teal-50 rounded-xl p-4">
                <i class="fas fa-phone-alt text-teal-600 mr-2"></i>
                <span class="text-gray-700">For return requests, call us at: <strong>+91 98765 43210</strong></span>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>