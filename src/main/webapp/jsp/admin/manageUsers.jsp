<%@ include file="../includes/header.jsp" %>
<%@ page import="com.greennursery.model.User" %>
<%@ page import="java.util.List" %>
<%
    if (!"ADMIN".equals(session.getAttribute("role"))) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
    List<User> users = (List<User>) request.getAttribute("users");
%>

<div class="bg-gray-50 min-h-screen py-8">
    <div class="max-w-7xl mx-auto px-4">
        <div class="mb-6">
            <h1 class="text-3xl font-bold text-gray-800">Manage Users</h1>
            <p class="text-gray-500">View all registered users</p>
        </div>

        <!-- Stats Summary -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-4 mb-6">
            <div class="bg-gradient-to-r from-teal-500 to-teal-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Total Users</p>
                <p class="text-3xl font-bold"><%= users != null ? users.size() : 0 %></p>
            </div>
            <div class="bg-gradient-to-r from-blue-500 to-blue-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Regular Users</p>
                <p class="text-3xl font-bold">
                    <% 
                        int regularCount = 0;
                        if (users != null) {
                            for (User u : users) {
                                if (!"ADMIN".equals(u.getRole())) regularCount++;
                            }
                        }
                    %>
                    <%= regularCount %>
                </p>
            </div>
            <div class="bg-gradient-to-r from-purple-500 to-purple-600 rounded-2xl p-4 text-white">
                <p class="text-sm opacity-90">Admin Users</p>
                <p class="text-3xl font-bold">
                    <% 
                        int adminCount = 0;
                        if (users != null) {
                            for (User u : users) {
                                if ("ADMIN".equals(u.getRole())) adminCount++;
                            }
                        }
                    %>
                    <%= adminCount %>
                </p>
            </div>
        </div>

        <!-- Search -->
        <div class="bg-white rounded-2xl shadow-lg p-4 mb-6">
            <div class="flex flex-wrap gap-4">
                <div class="flex-1 min-w-[200px]">
                    <div class="relative">
                        <i class="fas fa-search absolute left-3 top-1/2 -translate-y-1/2 text-gray-400"></i>
                        <input type="text" id="searchInput" placeholder="Search by name or email..." 
                               class="w-full pl-10 pr-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                    </div>
                </div>
                <select id="roleFilter" class="px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500 bg-white">
                    <option value="">All Roles</option>
                    <option value="USER">Users</option>
                    <option value="ADMIN">Admins</option>
                </select>
                <button onclick="filterUsers()" class="bg-teal-600 text-white px-6 py-3 rounded-xl hover:bg-teal-700 transition">
                    <i class="fas fa-search mr-2"></i>Search
                </button>
                <button onclick="resetFilters()" class="border-2 border-gray-300 text-gray-600 px-6 py-3 rounded-xl hover:bg-gray-50 transition">
                    Reset
                </button>
            </div>
        </div>

        <!-- Users Table -->
        <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
            <div class="overflow-x-auto">
                <table class="w-full" id="usersTable">
                    <thead class="bg-gray-50 border-b border-gray-200">
                        <tr>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">ID</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">User</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Email</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Phone</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Role</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Status</th>
                            <th class="px-6 py-3 text-left text-sm font-semibold text-gray-600">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% if (users != null && !users.isEmpty()) { %>
                            <% for (User user : users) { %>
                            <tr class="border-b border-gray-100 hover:bg-gray-50 transition user-row" 
                                data-name="<%= user.getName().toLowerCase() %>" 
                                data-email="<%= user.getEmail().toLowerCase() %>"
                                data-role="<%= user.getRole() %>">
                                <td class="px-6 py-4 text-sm text-gray-500">#<%= user.getUserId() %></td>
                                <td class="px-6 py-4">
                                    <div class="flex items-center gap-3">
                                        <div class="w-10 h-10 bg-gradient-to-r from-teal-500 to-emerald-500 rounded-full flex items-center justify-center text-white font-bold">
                                            <%= user.getName().charAt(0) %>
                                        </div>
                                        <div>
                                            <p class="font-semibold text-gray-800"><%= user.getName() %></p>
                                            <p class="text-xs text-gray-400">Joined 2024</p>
                                        </div>
                                    </div>
                                </td>
                                <td class="px-6 py-4 text-sm text-gray-600"><%= user.getEmail() %></td>
                                <td class="px-6 py-4 text-sm"><%= user.getPhone() != null && !user.getPhone().isEmpty() ? user.getPhone() : "<span class='text-gray-400'>Not provided</span>" %></td>
                                <td class="px-6 py-4">
                                    <% if ("ADMIN".equals(user.getRole())) { %>
                                        <span class="px-3 py-1 rounded-full text-xs font-semibold bg-purple-100 text-purple-700">
                                            <i class="fas fa-crown mr-1"></i> Admin
                                        </span>
                                    <% } else { %>
                                        <span class="px-3 py-1 rounded-full text-xs font-semibold bg-teal-100 text-teal-700">
                                            <i class="fas fa-user mr-1"></i> User
                                        </span>
                                    <% } %>
                                </td>
                                <td class="px-6 py-4">
                                    <span class="px-2 py-1 rounded-full text-xs font-semibold bg-green-100 text-green-700">
                                        <i class="fas fa-circle text-[8px] mr-1"></i> Active
                                    </span>
                                </td>
                                <td class="px-6 py-4">
                                    <div class="flex gap-3">
                                        <button onclick="viewUser(<%= user.getUserId() %>)" 
                                                class="text-blue-600 hover:text-blue-800 transition" title="View Details">
                                            <i class="fas fa-eye"></i>
                                        </button>
                                        <% if (!"ADMIN".equals(user.getRole())) { %>
                                            <a href="${pageContext.request.contextPath}/admin/deleteUser?id=<%= user.getUserId() %>" 
                                               class="text-red-600 hover:text-red-800 transition" 
                                               title="Delete User"
                                               onclick="return confirm('Are you sure you want to delete user <%= user.getName() %>? This action cannot be undone.')">
                                                <i class="fas fa-trash-alt"></i>
                                            </a>
                                        <% } %>
                                    </div>
                                </td>
                            </tr>
                            <% } %>
                        <% } else { %>
                            <tr>
                                <td colspan="7" class="px-6 py-12 text-center text-gray-400">
                                    <i class="fas fa-users text-5xl mb-3 block"></i>
                                    No users found
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
            
            <!-- Pagination -->
            <% if (users != null && users.size() > 10) { %>
            <div class="px-6 py-4 border-t border-gray-200 flex justify-between items-center">
                <p class="text-sm text-gray-500">Showing 1 to <%= Math.min(10, users.size()) %> of <%= users.size() %> results</p>
                <div class="flex gap-2">
                    <button class="w-8 h-8 rounded-lg border border-gray-300 text-gray-500 hover:bg-teal-600 hover:text-white transition">«</button>
                    <button class="w-8 h-8 rounded-lg bg-teal-600 text-white">1</button>
                    <button class="w-8 h-8 rounded-lg border border-gray-300 text-gray-500 hover:bg-teal-600 hover:text-white transition">2</button>
                    <button class="w-8 h-8 rounded-lg border border-gray-300 text-gray-500 hover:bg-teal-600 hover:text-white transition">»</button>
                </div>
            </div>
            <% } %>
        </div>
        
        <!-- Export Button -->
        <div class="mt-6 flex justify-end">
            <button onclick="exportUsers()" class="bg-gray-600 text-white px-5 py-2 rounded-xl hover:bg-gray-700 transition flex items-center gap-2">
                <i class="fas fa-download"></i> Export Users
            </button>
        </div>
    </div>
</div>

<!-- User Details Modal -->
<div id="userModal" class="fixed inset-0 bg-black/50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-2xl max-w-md w-full mx-4 overflow-hidden animate-fade-in">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-6 py-4 flex justify-between items-center">
            <h3 class="text-white font-bold text-lg">User Details</h3>
            <button onclick="closeModal()" class="text-white hover:text-gray-200">&times;</button>
        </div>
        <div class="p-6" id="modalContent">
            <!-- Dynamic content -->
        </div>
    </div>
</div>

<script>
    function filterUsers() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase();
        const roleFilter = document.getElementById('roleFilter').value;
        const rows = document.querySelectorAll('.user-row');
        
        rows.forEach(row => {
            const name = row.getAttribute('data-name');
            const email = row.getAttribute('data-email');
            const role = row.getAttribute('data-role');
            
            const matchesSearch = name.includes(searchTerm) || email.includes(searchTerm);
            const matchesRole = !roleFilter || role === roleFilter;
            
            row.style.display = matchesSearch && matchesRole ? '' : 'none';
        });
    }
    
    function resetFilters() {
        document.getElementById('searchInput').value = '';
        document.getElementById('roleFilter').value = '';
        const rows = document.querySelectorAll('.user-row');
        rows.forEach(row => row.style.display = '');
    }
    
    function viewUser(userId) {
        // Fetch user details via AJAX or show modal with static info
        const modal = document.getElementById('userModal');
        const modalContent = document.getElementById('modalContent');
        
        // Find the row
        const rows = document.querySelectorAll('.user-row');
        let userData = null;
        rows.forEach(row => {
            if (row.querySelector('td').innerText.includes('#' + userId)) {
                const name = row.querySelector('.font-semibold')?.innerText || 'N/A';
                const email = row.cells[2]?.innerText || 'N/A';
                const phone = row.cells[3]?.innerText || 'Not provided';
                const role = row.cells[4]?.innerText || 'User';
                
                userData = { name, email, phone, role, userId };
            }
        });
        
        if (userData) {
            modalContent.innerHTML = `
                <div class="space-y-4">
                    <div class="text-center">
                        <div class="w-20 h-20 bg-gradient-to-r from-teal-500 to-emerald-500 rounded-full flex items-center justify-center text-white text-3xl font-bold mx-auto">
                            ${userData.name.charAt(0)}
                        </div>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">Full Name</p>
                        <p class="font-semibold">${userData.name}</p>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">Email Address</p>
                        <p class="font-semibold">${userData.email}</p>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">Phone Number</p>
                        <p class="font-semibold">${userData.phone}</p>
                    </div>
                    <div class="border-b border-gray-100 pb-3">
                        <p class="text-xs text-gray-400">Role</p>
                        <p class="font-semibold">${userData.role}</p>
                    </div>
                    <div>
                        <p class="text-xs text-gray-400">User ID</p>
                        <p class="font-semibold">#${userData.userId}</p>
                    </div>
                </div>
            `;
            modal.classList.remove('hidden');
            modal.classList.add('flex');
        }
    }
    
    function closeModal() {
        const modal = document.getElementById('userModal');
        modal.classList.add('hidden');
        modal.classList.remove('flex');
    }
    
    function exportUsers() {
        alert('Export functionality would download user list as CSV');
        // In production: window.location.href = '/admin/exportUsers';
    }
    
    // Close modal on outside click
    document.getElementById('userModal').addEventListener('click', function(e) {
        if (e.target === this) closeModal();
    });
    
    // Live search
    document.getElementById('searchInput').addEventListener('keyup', function() {
        filterUsers();
    });
</script>

<%@ include file="../includes/footer.jsp" %>