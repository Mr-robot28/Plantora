<%@ include file="includes/header.jsp" %>

<div class="min-h-screen flex items-center justify-center py-20 px-4" style="background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);">
    <div class="max-w-md w-full bg-white rounded-3xl shadow-2xl overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-6 py-8 text-center text-white">
            <div class="text-6xl mb-3"><i class="fas fa-lock"></i></div>
            <h2 class="text-3xl font-bold">Forgot Password?</h2>
            <p class="text-teal-100 mt-2">We'll help you reset it</p>
        </div>
        
        <div class="p-8">
            <p class="text-gray-600 text-center mb-6">Enter your email address and we'll send you a link to reset your password.</p>
            
            <form action="#" method="post" class="space-y-5">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Email Address</label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="email" required placeholder="you@example.com"
                               class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                </div>
                <button type="submit" class="w-full bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition">
                    Send Reset Link <i class="fas fa-paper-plane ml-2"></i>
                </button>
            </form>
            
            <div class="mt-6 text-center">
                <a href="${pageContext.request.contextPath}/login" class="text-teal-600 hover:underline">&larr; Back to Login</a>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>