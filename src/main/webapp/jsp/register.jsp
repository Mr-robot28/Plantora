<%@ include file="includes/header.jsp" %>

<div class="min-h-screen flex items-center justify-center py-20 px-4" style="background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);">
    <div class="max-w-md w-full bg-white rounded-3xl shadow-2xl overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-6 py-8 text-center text-white">
            <div class="text-6xl mb-3"><i class="fas fa-seedling"></i></div>
            <h2 class="text-3xl font-bold">Join Plantora</h2>
            <p class="text-teal-100 mt-2">Create your account and start your plant journey</p>
        </div>
        
        <div class="p-8">
            <% if (request.getAttribute("error") != null) { %>
            <div class="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3 rounded-lg mb-6 flex items-center gap-3">
                <i class="fas fa-exclamation-circle"></i>
                <span><%= request.getAttribute("error") %></span>
            </div>
            <% } %>
            
            <form method="post" action="${pageContext.request.contextPath}/register" class="space-y-4">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Full Name</label>
                    <div class="relative">
                        <i class="fas fa-user absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="text" name="name" required placeholder="John Doe"
                               class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Email Address</label>
                    <div class="relative">
                        <i class="fas fa-envelope absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="email" name="email" required placeholder="you@example.com"
                               class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Phone Number</label>
                    <div class="relative">
                        <i class="fas fa-phone absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="tel" name="phone" placeholder="+91 98765 43210"
                               class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Password</label>
                    <div class="relative">
                        <i class="fas fa-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="password" name="password" required placeholder="Min 6 characters"
                               class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                </div>
                <button type="submit" class="w-full bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition transform hover:scale-[1.02]">
                    Create Account <i class="fas fa-user-plus ml-2"></i>
                </button>
            </form>
            
            <div class="mt-6 text-center">
                <p class="text-gray-500">Already have an account? <a href="${pageContext.request.contextPath}/login" class="text-teal-600 font-semibold hover:underline">Sign in</a></p>
            </div>
            
            <p class="text-center text-xs text-gray-400 mt-6">By signing up, you agree to our Terms of Service and Privacy Policy</p>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>