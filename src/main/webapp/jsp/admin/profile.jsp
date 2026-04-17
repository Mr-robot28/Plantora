<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
%>

<div class="max-w-5xl mx-auto px-4 py-12">
    <div class="bg-white rounded-3xl shadow-xl overflow-hidden">
        <!-- Profile Header -->
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-12 text-center text-white">
            <div class="w-28 h-28 bg-white/20 rounded-full flex items-center justify-center mx-auto mb-4 text-5xl backdrop-blur-sm">
                <%= user.getName().charAt(0) %>
            </div>
            <h1 class="text-2xl font-bold"><%= user.getName() %></h1>
            <p class="text-teal-100"><%= user.getRole() %></p>
            <p class="text-teal-100 text-sm mt-1">Member since 2024</p>
        </div>
        
        <div class="p-8">
            <div class="grid md:grid-cols-2 gap-6">
                <div class="bg-gray-50 rounded-xl p-5">
                    <div class="flex items-center gap-3 mb-3">
                        <i class="fas fa-user text-teal-600"></i>
                        <h3 class="font-semibold text-gray-700">Personal Information</h3>
                    </div>
                    <div class="space-y-2 text-sm">
                        <p><span class="text-gray-500">Full Name:</span> <%= user.getName() %></p>
                        <p><span class="text-gray-500">Email:</span> <%= user.getEmail() %></p>
                        <p><span class="text-gray-500">Phone:</span> <%= user.getPhone() != null ? user.getPhone() : "Not provided" %></p>
                    </div>
                </div>
                <div class="bg-gray-50 rounded-xl p-5">
                    <div class="flex items-center gap-3 mb-3">
                        <i class="fas fa-chart-line text-teal-600"></i>
                        <h3 class="font-semibold text-gray-700">Account Statistics</h3>
                    </div>
                    <div class="space-y-2 text-sm">
                        <p><span class="text-gray-500">Total Orders:</span> 0</p>
                        <p><span class="text-gray-500">Plants Purchased:</span> 0</p>
                        <p><span class="text-gray-500">Appointments:</span> 0</p>
                    </div>
                </div>
            </div>
            
            <div class="flex gap-4 mt-8">
                <a href="${pageContext.request.contextPath}/jsp/editProfile.jsp" class="flex-1 text-center bg-teal-600 text-white font-semibold py-3 rounded-xl hover:bg-teal-700 transition">
                    Edit Profile <i class="fas fa-edit ml-2"></i>
                </a>
                <a href="${pageContext.request.contextPath}/order" class="flex-1 text-center border-2 border-teal-600 text-teal-600 font-semibold py-3 rounded-xl hover:bg-teal-50 transition">
                    My Orders <i class="fas fa-box ml-2"></i>
                </a>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>