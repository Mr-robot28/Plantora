<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
%>

<div class="max-w-2xl mx-auto px-4 py-12">
    <div class="bg-white rounded-3xl shadow-xl overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6 text-white">
            <h1 class="text-2xl font-bold">Edit Profile</h1>
            <p class="text-teal-100">Update your personal information</p>
        </div>
        
        <div class="p-8">
            <form action="${pageContext.request.contextPath}/updateProfile" method="post" class="space-y-5">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Full Name</label>
                    <input type="text" name="name" value="<%= user.getName() %>" required
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Email Address</label>
                    <input type="email" value="<%= user.getEmail() %>" readonly disabled
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl bg-gray-50 text-gray-500">
                    <p class="text-xs text-gray-400 mt-1">Email cannot be changed</p>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Phone Number</label>
                    <input type="tel" name="phone" value="<%= user.getPhone() != null ? user.getPhone() : "" %>"
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">New Password (optional)</label>
                    <input type="password" name="password" placeholder="Leave blank to keep current"
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div class="flex gap-4 pt-4">
                    <button type="submit" class="flex-1 bg-teal-600 text-white font-semibold py-3 rounded-xl hover:bg-teal-700 transition">
                        Save Changes <i class="fas fa-save ml-2"></i>
                    </button>
                    <a href="${pageContext.request.contextPath}/jsp/profile.jsp" class="flex-1 text-center border-2 border-gray-300 text-gray-600 font-semibold py-3 rounded-xl hover:bg-gray-50 transition">
                        Cancel
                    </a>
                </div>
            </form>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>