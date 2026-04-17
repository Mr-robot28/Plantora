<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.dao.*" %>
<%
    if (!"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    int plantCount = new PlantDAO().getAllPlants().size();
    int orderCount = new OrderDAO().getAllOrders().size();
    int userCount = new UserDAO().getAllUsers().size();
    int apptCount = new AppointmentDAO().getAllAppointments().size();
%>

<div class="bg-gradient-to-r from-teal-50 to-emerald-50 min-h-screen py-8">
    <div class="max-w-7xl mx-auto px-4">
        <!-- Header -->
        <div class="mb-8">
            <h1 class="text-3xl font-bold text-gray-800">Admin Dashboard</h1>
            <p class="text-gray-500">Welcome back, <%= ((com.greennursery.model.User)session.getAttribute("user")).getName() %></p>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-2 md:grid-cols-4 gap-6 mb-10">
            <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition transform hover:scale-105">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm">Total Plants</p>
                        <p class="text-3xl font-bold text-teal-600"><%= plantCount %></p>
                    </div>
                    <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center"><i class="fas fa-leaf text-teal-600 text-xl"></i></div>
                </div>
            </div>
            <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition transform hover:scale-105">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm">Total Orders</p>
                        <p class="text-3xl font-bold text-blue-600"><%= orderCount %></p>
                    </div>
                    <div class="w-12 h-12 bg-blue-100 rounded-full flex items-center justify-center"><i class="fas fa-shopping-cart text-blue-600 text-xl"></i></div>
                </div>
            </div>
            <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition transform hover:scale-105">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm">Total Users</p>
                        <p class="text-3xl font-bold text-purple-600"><%= userCount %></p>
                    </div>
                    <div class="w-12 h-12 bg-purple-100 rounded-full flex items-center justify-center"><i class="fas fa-users text-purple-600 text-xl"></i></div>
                </div>
            </div>
            <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition transform hover:scale-105">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-500 text-sm">Appointments</p>
                        <p class="text-3xl font-bold text-orange-600"><%= apptCount %></p>
                    </div>
                    <div class="w-12 h-12 bg-orange-100 rounded-full flex items-center justify-center"><i class="fas fa-calendar-alt text-orange-600 text-xl"></i></div>
                </div>
            </div>
        </div>

        <!-- Recent Activity -->
        <div class="grid lg:grid-cols-2 gap-8">
            <!-- Recent Orders -->
            <div class="bg-white rounded-2xl shadow-lg p-6">
                <div class="flex justify-between items-center mb-4">
                    <h2 class="text-xl font-bold text-gray-800">Recent Orders</h2>
                    <a href="${pageContext.request.contextPath}/admin/orders" class="text-teal-600 text-sm hover:underline">View All</a>
                </div>
                <div class="space-y-3">
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="font-semibold">#GN1001</span>
                        <span class="text-sm"><span class="rupee-sign">&#8377;</span>1,299</span>
                        <span class="px-2 py-1 bg-yellow-100 text-yellow-700 text-xs rounded-full">Pending</span>
                    </div>
                    <div class="flex justify-between items-center py-2 border-b border-gray-100">
                        <span class="font-semibold">#GN1002</span>
                        <span class="text-sm"><span class="rupee-sign">&#8377;</span>799</span>
                        <span class="px-2 py-1 bg-green-100 text-green-700 text-xs rounded-full">Delivered</span>
                    </div>
                </div>
            </div>

            <!-- Quick Actions -->
            <div class="bg-white rounded-2xl shadow-lg p-6">
                <h2 class="text-xl font-bold text-gray-800 mb-4">Quick Actions</h2>
                <div class="grid grid-cols-2 gap-4">
                    <a href="${pageContext.request.contextPath}/admin/plants?action=add" class="bg-teal-50 text-teal-600 p-4 rounded-xl text-center hover:bg-teal-100 transition">
                        <i class="fas fa-plus-circle text-2xl mb-2 block"></i> Add Plant
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/orders" class="bg-blue-50 text-blue-600 p-4 rounded-xl text-center hover:bg-blue-100 transition">
                        <i class="fas fa-truck text-2xl mb-2 block"></i> Update Orders
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/appointments" class="bg-orange-50 text-orange-600 p-4 rounded-xl text-center hover:bg-orange-100 transition">
                        <i class="fas fa-calendar-check text-2xl mb-2 block"></i> Manage Appointments
                    </a>
                    <a href="${pageContext.request.contextPath}/admin/users" class="bg-purple-50 text-purple-600 p-4 rounded-xl text-center hover:bg-purple-100 transition">
                        <i class="fas fa-users-cog text-2xl mb-2 block"></i> Manage Users
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../includes/footer.jsp" %>