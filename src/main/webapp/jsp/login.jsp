<%@ include file="includes/header.jsp"%>

<div class="min-h-screen flex items-center justify-center py-20 px-4"
	style="background: linear-gradient(135deg, #f0fdf4 0%, #dcfce7 100%);">
	<div
		class="max-w-md w-full bg-white rounded-3xl shadow-2xl overflow-hidden transform transition-all hover:scale-[1.02] duration-500">
		<div
			class="bg-gradient-to-r from-teal-600 to-emerald-600 px-6 py-8 text-center text-white">
			<div class="text-6xl mb-3">
				<i class="fas fa-leaf"></i>
			</div>
			<h2 class="text-3xl font-bold">Welcome Back!</h2>
			<p class="text-teal-100 mt-2">Sign in to your Plantora
				account</p>
		</div>

		<div class="p-8">
			<%
			if (request.getAttribute("error") != null) {
			%>
			<div
				class="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3 rounded-lg mb-6 flex items-center gap-3">
				<i class="fas fa-exclamation-circle"></i> <span><%=request.getAttribute("error")%></span>
			</div>
			<%
			}
			%>
			<%
			if ("true".equals(request.getParameter("registered"))) {
			%>
			<div
				class="bg-green-50 border-l-4 border-green-500 text-green-700 px-4 py-3 rounded-lg mb-6 flex items-center gap-3">
				<i class="fas fa-check-circle"></i> <span>Registered
					successfully! Please log in.</span>
			</div>
			<%
			}
			%>
			<%
			if ("true".equals(request.getParameter("logout"))) {
			%>
			<div
				class="bg-blue-50 border-l-4 border-blue-500 text-blue-700 px-4 py-3 rounded-lg mb-6 flex items-center gap-3">
				<i class="fas fa-info-circle"></i> <span>You have been logged
					out successfully.</span>
			</div>
			<%
			}
			%>

			<form method="post" action="${pageContext.request.contextPath}/login"
				class="space-y-5">
				<div>
					<label class="block text-sm font-semibold text-gray-700 mb-2">Email
						Address</label>
					<div class="relative">
						<i
							class="fas fa-envelope absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
						<input type="email" name="email" required
							placeholder="you@example.com"
							class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent">
					</div>
				</div>
				<div>
					<label class="block text-sm font-semibold text-gray-700 mb-2">Password</label>
					<div class="relative">
						<i
							class="fas fa-lock absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
						<input type="password" name="password" required
							placeholder="Enter your password"
							class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 focus:border-transparent">
					</div>
				</div>
				<div class="flex justify-between items-center">
					<label class="flex items-center gap-2 text-sm text-gray-600">
						<input type="checkbox" class="rounded text-teal-600">
						Remember me
					</label> <a
						href="${pageContext.request.contextPath}/jsp/forgotPassword.jsp"
						class="text-sm text-teal-600 hover:underline">Forgot password?</a>
				</div>
				<button type="submit"
					class="w-full bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition transform hover:scale-[1.02]">
					Sign In <i class="fas fa-arrow-right ml-2"></i>
				</button>
			</form>

			<div class="mt-6 text-center">
				<p class="text-gray-500">
					Don't have an account? <a
						href="${pageContext.request.contextPath}/register"
						class="text-teal-600 font-semibold hover:underline">Create one</a>
				</p>
			</div>

			<div class="mt-8 pt-6 border-t border-gray-200">
				<p class="text-center text-xs text-gray-400">
					Demo Credentials:<br>Admin: admin@greennursery.com / admin123<br>User:
					user@example.com / user123
				</p>
			</div>
		</div>
	</div>
</div>

<%@ include file="includes/footer.jsp"%>