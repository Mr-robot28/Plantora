<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.model.Appointment" %>
<%@ page import="java.util.List" %>
<%
    if (!"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    List<Appointment> appointments = (List<Appointment>) request.getAttribute("appointments");
%>

<div class="bg-gray-50 min-h-screen py-8">
    <div class="max-w-7xl mx-auto px-4">
        <div class="mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Appointments</h1>
            <p class="text-gray-500">View and manage nursery visit bookings</p>
        </div>

        <!-- Stats Summary -->
        <div class="grid grid-cols-1 md:grid-cols-4 gap-4 mb-6">
            <div class="bg-gradient-to-r from-yellow-500 to-yellow-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Pending</p>
                <p class="text-3xl font-bold">
                    <% 
                        int pending = 0;
                        if (appointments != null) {
                            for (Appointment a : appointments) {
                                if ("PENDING".equals(a.getStatus())) pending++;
                            }
                        }
                    %>
                    <%= pending %>
                </p>
            </div>
            <div class="bg-gradient-to-r from-green-500 to-green-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Confirmed</p>
                <p class="text-3xl font-bold">
                    <% 
                        int confirmed = 0;
                        if (appointments != null) {
                            for (Appointment a : appointments) {
                                if ("CONFIRMED".equals(a.getStatus())) confirmed++;
                            }
                        }
                    %>
                    <%= confirmed %>
                </p>
            </div>
            <div class="bg-gradient-to-r from-red-500 to-red-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Cancelled</p>
                <p class="text-3xl font-bold">
                    <% 
                        int cancelled = 0;
                        if (appointments != null) {
                            for (Appointment a : appointments) {
                                if ("CANCELLED".equals(a.getStatus())) cancelled++;
                            }
                        }
                    %>
                    <%= cancelled %>
                </p>
            </div>
            <div class="bg-gradient-to-r from-blue-500 to-blue-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Total</p>
                <p class="text-3xl font-bold"><%= appointments != null ? appointments.size() : 0 %></p>
            </div>
        </div>

        <!-- Filters -->
        <div class="bg-white rounded-2xl shadow-lg p-4 mb-6">
            <div class="flex flex-wrap gap-4">
                <select id="statusFilter" class="px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                    <option value="">All Status</option>
                    <option value="PENDING">Pending</option>
                    <option value="CONFIRMED">Confirmed</option>
                    <option value="CANCELLED">Cancelled</option>
                </select>
                <input type="date" id="dateFilter" class="px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                <input type="text" id="searchFilter" placeholder="Search by user name..." 
                       class="flex-1 min-w-[200px] px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                <button onclick="filterAppointments()" class="bg-teal-600 text-white px-6 py-3 rounded-xl hover:bg-teal-700 transition">
                    <i class="fas fa-filter mr-2"></i>Filter
                </button>
                <button onclick="resetFilters()" class="border-2 border-gray-300 text-gray-600 px-6 py-3 rounded-xl hover:bg-gray-50 transition">
                    Reset
                </button>
            </div>
        </div>

        <!-- Appointments Table -->
        <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full" id="appointmentsTable">
                    <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">ID</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">User</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Date</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Time</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Message</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Status</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (appointments != null && !appointments.isEmpty()) { %>
                            <% for (Appointment apt : appointments) { 
                                String statusClass = "";
                                String statusIcon = "";
                                switch(apt.getStatus()) {
                                    case "PENDING": statusClass = "bg-yellow-100 text-yellow-700"; statusIcon = "⏳"; break;
                                    case "CONFIRMED": statusClass = "bg-green-100 text-green-700"; statusIcon = "✅"; break;
                                    case "CANCELLED": statusClass = "bg-red-100 text-red-700"; statusIcon = "❌"; break;
                                }
                            %>
                            <tr class="border-b border-gray-100 hover:bg-gray-50 transition appointment-row" 
                                data-status="<%= apt.getStatus() %>"
                                data-date="<%= apt.getDate() %>"
                                data-user="<%= apt.getUserName() != null ? apt.getUserName().toLowerCase() : "" %>">
                                <td class="px-6 py-4 text-sm text-gray-500">#AP<%= apt.getAppointmentId() %></td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-3">
                                        <div class="w-8 h-8 bg-teal-100 rounded-full flex items-center justify-center text-teal-600 font-bold">
                                            <%= apt.getUserName() != null ? apt.getUserName().charAt(0) : "U" %>
                                        </div>
                                        <span class="font-semibold text-gray-800"><%= apt.getUserName() != null ? apt.getUserName() : "User #" + apt.getUserId() %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-2">
                                        <i class="far fa-calendar-alt text-teal-500"></i>
                                        <span class="text-sm"><%= apt.getDate() %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-2">
                                        <i class="far fa-clock text-teal-500"></i>
                                        <span class="text-sm"><%= apt.getTime() %></span>
                                    </div>
                                </td>
                                <td class="px-6 py-4">
                                    <span class="text-sm text-gray-500 line-clamp-2 max-w-xs">
                                        <%= apt.getMessage() != null && !apt.getMessage().isEmpty() ? apt.getMessage() : "-" %>
                                    </span>
                                </td>
                                <td class="px-6 py-4">
                                    <form action="${pageContext.request.contextPath}/admin/updateAppointment" method="post" class="inline">
                                        <input type="hidden" name="appointmentId" value="<%= apt.getAppointmentId() %>">
                                        <select name="status" onchange="this.form.submit()" 
                                                class="px-3 py-1.5 text-sm rounded-full border-0 font-semibold cursor-pointer <%= statusClass %>">
                                            <option value="PENDING" <%= "PENDING".equals(apt.getStatus()) ? "selected" : "" %>><i class="fas fa-hourglass-half"></i> Pending</option>
                                            <option value="CONFIRMED" <%= "CONFIRMED".equals(apt.getStatus()) ? "selected" : "" %>><i class="fas fa-check-circle"></i> Confirmed</option>
                                            <option value="CANCELLED" <%= "CANCELLED".equals(apt.getStatus()) ? "selected" : "" %>><i class="fas fa-times-circle"></i> Cancelled</option>
                                        </select>
                                    </form>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex gap-2">
                                        <button onclick="viewAppointment(<%= apt.getAppointmentId() %>)" 
                                                class="text-blue-600 hover:text-blue-800 transition" title="View Details">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/deleteAppointment?id=<%= apt.getAppointmentId() %>" 
                                           class="text-red-600 hover:text-red-800 transition" title="Delete"
                                           onclick="return confirm('Delete this appointment?')">
                                            <i class="fas fa-trash-alt"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        <% } else { %>
                            <tr>
                                <td colspan="7" class="px-6 py-12 text-center text-gray-400">
                                    <i class="fas fa-calendar-times text-5xl mb-3 block"></i>
                                    No appointments found
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        </div>
        
        <!-- Bulk Actions -->
        <div class="mt-6 flex justify-between items-center">
            <div class="flex gap-3">
                <select id="bulkAction" class="px-4 py-2 border border-gray-200 rounded-xl">
                    <option value="">Bulk Actions</option>
                    <option value="CONFIRMED">Confirm Selected</option>
                    <option value="CANCELLED">Cancel Selected</option>
                </select>
                <button onclick="bulkUpdate()" class="bg-gray-600 text-white px-5 py-2 rounded-xl hover:bg-gray-700 transition">
                    Apply
                </button>
            </div>
            <button onclick="exportAppointments()" class="bg-teal-600 text-white px-5 py-2 rounded-xl hover:bg-teal-700 transition flex items-center gap-2">
                <i class="fas fa-download"></i> Export Report
            </button>
        </div>
    </div>
</div>

<!-- Appointment Details Modal -->
<div id="appointmentModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-2xl max-w-md w-full mx-4 overflow-hidden animate-fade-in">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-6 py-4 flex justify-between items-center">
            <h3 class="text-white font-bold text-lg">Appointment Details</h3>
            <button onclick="closeAppointmentModal()" class="text-white hover:text-gray-200 text-2xl">&times;</button>
        </div>
        <div class="p-6" id="appointmentModalContent">
            <!-- Dynamic content -->
        </div>
    </div>
</div>

<script>
    function filterAppointments() {
        const statusFilter = document.getElementById('statusFilter').value;
        const dateFilter = document.getElementById('dateFilter').value;
        const searchFilter = document.getElementById('searchFilter').value.toLowerCase();
        const rows = document.querySelectorAll('.appointment-row');
        
        rows.forEach(row => {
            const status = row.getAttribute('data-status');
            const date = row.getAttribute('data-date');
            const user = row.getAttribute('data-user');
            
            const matchesStatus = !statusFilter || status === statusFilter;
            const matchesDate = !dateFilter || date === dateFilter;
            const matchesSearch = !searchFilter || user.includes(searchFilter);
            
            row.style.display = matchesStatus && matchesDate && matchesSearch ? '' : 'none';
        });
    }
    
    function resetFilters() {
        document.getElementById('statusFilter').value = '';
        document.getElementById('dateFilter').value = '';
        document.getElementById('searchFilter').value = '';
        const rows = document.querySelectorAll('.appointment-row');
        rows.forEach(row => row.style.display = '');
    }
    
    function viewAppointment(id) {
        const modal = document.getElementById('appointmentModal');
        const modalContent = document.getElementById('appointmentModalContent');
        
        // Find the row
        const rows = document.querySelectorAll('.appointment-row');
        let aptData = null;
        rows.forEach(row => {
            if (row.querySelector('td').innerText.includes('#AP' + id)) {
                const user = row.cells[1]?.innerText || 'N/A';
                const date = row.cells[2]?.innerText || 'N/A';
                const time = row.cells[3]?.innerText || 'N/A';
                const message = row.cells[4]?.innerText || 'No message';
                const status = row.cells[5]?.innerText || 'Pending';
                
                aptData = { id, user, date, time, message, status };
            }
        });
        
        if (aptData) {
            modalContent.innerHTML = `
                <div class="space-y-4">
                    <div class="text-center">
                        <div class="w-16 h-16 bg-teal-100 rounded-full flex items-center justify-center mx-auto">
                            <i class="fas fa-calendar-check text-teal-600 text-2xl"></i>
                        </div>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">Appointment ID</p>
                        <p class="font-semibold">#AP${aptData.id}</p>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">User</p>
                        <p class="font-semibold">${aptData.user}</p>
                    </div>
                    <div class="grid grid-cols-2 gap-3 border-b border-gray-100 pb-3">
                        <div>
                            <p class="text-xs text-gray-400">Date</p>
                            <p class="font-semibold">${aptData.date}</p>
                        </div>
                        <div>
                            <p class="text-xs text-gray-400">Time</p>
                            <p class="font-semibold">${aptData.time}</p>
                        </div>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">Message</p>
                        <p class="text-gray-600">${aptData.message}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">Status</p>
                        <p class="font-semibold">${aptData.status}</p>
                    </div>
                </div>
            `;
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }
    }
    
    function closeAppointmentModal() {
        const modal = document.getElementById('appointmentModal');
        modal.classList.add('hidden');
        modal.classList.remove('flex');
    }
    
    function bulkUpdate() {
        const action = document.getElementById('bulkAction').value;
        if (!action) {
            alert('Please select an action');
            return;
        }
        alert(`Bulk update to ${action} would apply to selected appointments`);
    }
    
    function exportAppointments() {
        alert('Export functionality would download appointments as CSV');
    }
    
    // Close modal on outside click
    document.getElementById('appointmentModal').addEventListener('click', function(e) {
        if (e.target === this) closeAppointmentModal();
    });
    
    // Live search
    document.getElementById('searchFilter').addEventListener('keyup', function() {
        filterAppointments();
    });
</script>

<%@ include file="../includes/footer.jsp" %>