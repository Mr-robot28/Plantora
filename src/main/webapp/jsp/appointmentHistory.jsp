<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.Appointment" %>
<%@ page import="java.util.List" %>
<%
    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
%>

<div class="max-w-6xl mx-auto px-4 py-12">
    <div class="text-center mb-12">
        <h1 class="text-4xl font-bold text-gray-800 mb-2">My Appointments</h1>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        <p class="text-gray-500 mt-4">View and manage your nursery visit appointments</p>
    </div>

    <% if (request.getParameter("success") != null) { %>
    <div class="bg-green-50 border-l-4 border-green-500 text-green-700 px-4 py-3 rounded-lg mb-6 max-w-2xl mx-auto">
        <i class="fas fa-check-circle mr-2"></i> Appointment booked successfully!
    </div>
    <% } %>

    <% if (appointments == null || appointments.isEmpty()) { %>
    <div class="text-center py-20 bg-white rounded-2xl shadow-sm">
        <div class="text-7xl mb-4"><i class="fas fa-calendar-alt"></i></div>
        <h3 class="text-xl font-semibold text-gray-700 mb-2">No appointments yet</h3>
        <p class="text-gray-400 mb-6">Book your first nursery visit</p>
        <a href="${pageContext.request.contextPath}/appointment" class="bg-teal-600 text-white px-6 py-3 rounded-xl hover:bg-teal-700 transition">
            Book an Appointment
        </a>
    </div>
    <% } else { %>
    <div class="grid md:grid-cols-2 gap-6">
        <% for (Appointment apt : appointments) { 
            String statusClass = "";
            String statusIcon = "";
            switch(apt.getStatus()) {
                case "PENDING": statusClass = "bg-yellow-100 text-yellow-700"; statusIcon = "⏳"; break;
                case "CONFIRMED": statusClass = "bg-green-100 text-green-700"; statusIcon = "✅"; break;
                case "CANCELLED": statusClass = "bg-red-100 text-red-700"; statusIcon = "❌"; break;
            }
        %>
        <div class="bg-white rounded-2xl shadow-lg p-6 hover:shadow-xl transition">
            <div class="flex justify-between items-start mb-4">
                <div>
                    <p class="text-sm text-gray-500">Appointment ID</p>
                    <p class="font-bold text-lg">#AP<%= apt.getAppointmentId() %></p>
                </div>
                <span class="inline-flex items-center gap-1 px-3 py-1 rounded-full text-sm font-semibold <%= statusClass %>">
                    <span><%= statusIcon %></span> <%= apt.getStatus() %>
                </span>
            </div>
            
            <div class="space-y-2 text-gray-600">
                <div class="flex items-center gap-2"><i class="fas fa-calendar-day w-5 text-teal-600"></i> Date: <strong><%= apt.getDate() %></strong></div>
                <div class="flex items-center gap-2"><i class="fas fa-clock w-5 text-teal-600"></i> Time: <strong><%= apt.getTime() %></strong></div>
                <% if (apt.getMessage() != null && !apt.getMessage().isEmpty()) { %>
                <div class="flex items-start gap-2"><i class="fas fa-comment w-5 text-teal-600"></i> Message: <span class="text-gray-500"><%= apt.getMessage() %></span></div>
                <% } %>
            </div>
            
            <% if ("PENDING".equals(apt.getStatus())) { %>
            <div class="mt-4 pt-4 border-t border-gray-100 flex gap-3">
                <button onclick="cancelAppointment(<%= apt.getAppointmentId() %>)" class="flex-1 text-red-600 border border-red-600 py-2 rounded-lg hover:bg-red-50 transition">
                    Cancel
                </button>
                <a href="${pageContext.request.contextPath}/appointment" class="flex-1 text-center text-teal-600 border border-teal-600 py-2 rounded-lg hover:bg-teal-50 transition">
                    Reschedule
                </a>
            </div>
            <% } %>
        </div>
        <% } %>
    </div>
    <% } %>
</div>

<script>
    function cancelAppointment(id) {
        if (confirm('Are you sure you want to cancel this appointment?')) {
            window.location.href = '${pageContext.request.contextPath}/appointment?action=cancel&id=' + id;
        }
    }
</script>

<%@ include file="includes/footer.jsp" %>