<%@ page import="com.greennursery.model.User" %>
<%@ page import="com.greennursery.dao.CartDAO" %>
<%
    User sessionUser = (User) session.getAttribute("user");
    int cartCount = 0;
    if (sessionUser != null) {
        cartCount = new CartDAO().getCartCount(sessionUser.getUserId());
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Green Nursery - Premium Plants Delivered</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#0d9488',
                        secondary: '#059669',
                        accent: '#10b981',
                        dark: '#064e3b',
                        light: '#ecfdf5'
                    },
                    fontFamily: {
                        'sans': ['Inter', 'system-ui', 'sans-serif'],
                    }
                }
            }
        }
    </script>
    <style>
        * { font-family: 'Inter', sans-serif; }
        .nav-link { position: relative; transition: all 0.3s ease; }
        .nav-link::after {
            content: '';
            position: absolute;
            width: 0;
            height: 2px;
            bottom: -4px;
            left: 0;
            background: linear-gradient(135deg, #10b981, #059669);
            transition: width 0.3s ease;
        }
        .nav-link:hover::after { width: 100%; }
        .btn-primary {
            background: linear-gradient(135deg, #059669, #0d9488);
            transition: all 0.3s ease;
        }
        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 25px -5px rgba(5, 150, 105, 0.4);
        }
        .card-hover {
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
        }
        .card-hover:hover {
            transform: translateY(-8px);
            box-shadow: 0 25px 40px -12px rgba(0, 0, 0, 0.15);
        }
        .dropdown-menu {
            opacity: 0;
            visibility: hidden;
            transform: translateY(-10px);
            transition: all 0.3s ease;
        }
        .group:hover .dropdown-menu {
            opacity: 1;
            visibility: visible;
            transform: translateY(0);
        }
    </style>
</head>
<body class="bg-gradient-to-br from-gray-50 via-white to-gray-100 font-sans">

<!-- NAVBAR -->
<nav class="bg-white shadow-lg sticky top-0 z-50 backdrop-blur-lg bg-white/95">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between items-center h-16 md:h-20">
            <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="flex items-center space-x-3 group">
                <i class="fas fa-leaf text-3xl text-teal-600 group-hover:scale-110 transition"></i>
                <div>
                    <span class="text-xl md:text-2xl font-extrabold bg-gradient-to-r from-primary to-secondary bg-clip-text text-transparent">Green Nursery</span>
                    <p class="text-[10px] text-gray-400 -mt-1">Premium Plant Store</p>
                </div>
            </a>

            <div class="hidden md:flex items-center space-x-8">
                <a href="${pageContext.request.contextPath}/plants" class="nav-link text-gray-700 hover:text-primary font-medium">Catalog</a>
                <a href="${pageContext.request.contextPath}/jsp/about.jsp" class="nav-link text-gray-700 hover:text-primary font-medium">About</a>
                <a href="${pageContext.request.contextPath}/jsp/contact.jsp" class="nav-link text-gray-700 hover:text-primary font-medium">Contact</a>
                
                <% if (sessionUser != null) { %>
                    <a href="${pageContext.request.contextPath}/cart" class="relative">
                        <i class="fas fa-shopping-cart text-2xl text-gray-700 hover:text-primary transition"></i>
                        <% if (cartCount > 0) { %>
                            <span class="absolute -top-2 -right-3 bg-red-500 text-white text-xs font-bold rounded-full w-5 h-5 flex items-center justify-center"><%= cartCount %></span>
                        <% } %>
                    </a>
                    <a href="${pageContext.request.contextPath}/appointment" class="nav-link text-gray-700 hover:text-primary font-medium">
                        <i class="fas fa-calendar-alt mr-1"></i> Book Visit
                    </a>
                    
                    <% if ("ADMIN".equals(sessionUser.getRole())) { %>
                        <a href="${pageContext.request.contextPath}/admin/dashboard" class="bg-gradient-to-r from-amber-500 to-orange-500 text-white px-4 py-2 rounded-lg hover:shadow-lg transition flex items-center gap-2">
                            <i class="fas fa-crown"></i> Admin
                        </a>
                    <% } %>
                    
                    <div class="relative group">
                        <button class="flex items-center space-x-2 bg-gradient-to-r from-gray-100 to-gray-50 px-4 py-2 rounded-full hover:shadow-md transition">
                            <div class="w-8 h-8 bg-gradient-to-r from-primary to-secondary rounded-full flex items-center justify-center text-white font-bold">
                                <%= sessionUser.getName().charAt(0) %>
                            </div>
                            <span class="font-medium text-gray-700"><%= sessionUser.getName().split(" ")[0] %></span>
                            <i class="fas fa-chevron-down text-xs text-gray-500"></i>
                        </button>
                        <div class="dropdown-menu absolute right-0 mt-2 w-56 bg-white rounded-xl shadow-2xl overflow-hidden z-50">
                            <a href="${pageContext.request.contextPath}/jsp/profile.jsp" class="flex items-center px-4 py-3 text-gray-700 hover:bg-light transition group">
                                <i class="fas fa-user-circle w-5 text-primary"></i><span class="ml-3">My Profile</span>
                                <i class="fas fa-arrow-right ml-auto opacity-0 group-hover:opacity-100 transition"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/order" class="flex items-center px-4 py-3 text-gray-700 hover:bg-light transition group">
                                <i class="fas fa-box w-5 text-primary"></i><span class="ml-3">My Orders</span>
                                <i class="fas fa-arrow-right ml-auto opacity-0 group-hover:opacity-100 transition"></i>
                            </a>
                            <a href="${pageContext.request.contextPath}/appointment?view=history" class="flex items-center px-4 py-3 text-gray-700 hover:bg-light transition group">
                                <i class="fas fa-calendar-check w-5 text-primary"></i><span class="ml-3">Appointments</span>
                                <i class="fas fa-arrow-right ml-auto opacity-0 group-hover:opacity-100 transition"></i>
                            </a>
                            <hr class="my-1">
                            <a href="${pageContext.request.contextPath}/logout" class="flex items-center px-4 py-3 text-red-600 hover:bg-red-50 transition group">
                                <i class="fas fa-sign-out-alt w-5"></i><span class="ml-3">Logout</span>
                            </a>
                        </div>
                    </div>
                <% } else { %>
                    <a href="${pageContext.request.contextPath}/login" class="btn-primary text-white px-6 py-2 rounded-lg font-semibold">Login</a>
                    <a href="${pageContext.request.contextPath}/register" class="border-2 border-primary text-primary px-6 py-2 rounded-lg font-semibold hover:bg-primary hover:text-white transition">Register</a>
                <% } %>
            </div>

            <button id="mobileMenuBtn" class="md:hidden text-2xl text-gray-700"><i class="fas fa-bars"></i></button>
        </div>
    </div>

    <div id="mobileMenu" class="hidden md:hidden bg-white border-t border-gray-100 py-4 px-4 space-y-3">
        <a href="${pageContext.request.contextPath}/plants" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-leaf w-5"></i><span>Catalog</span></a>
        <a href="${pageContext.request.contextPath}/jsp/about.jsp" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-info-circle w-5"></i><span>About</span></a>
        <a href="${pageContext.request.contextPath}/jsp/contact.jsp" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-envelope w-5"></i><span>Contact</span></a>
        <% if (sessionUser != null) { %>
            <a href="${pageContext.request.contextPath}/cart" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-shopping-cart w-5"></i><span>Cart (<%= cartCount %>)</span></a>
            <a href="${pageContext.request.contextPath}/appointment" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-calendar-alt w-5"></i><span>Book Visit</span></a>
            <a href="${pageContext.request.contextPath}/jsp/profile.jsp" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-user w-5"></i><span>Profile</span></a>
            <a href="${pageContext.request.contextPath}/order" class="flex items-center space-x-2 py-2 text-gray-700 hover:text-primary transition"><i class="fas fa-box w-5"></i><span>Orders</span></a>
            <a href="${pageContext.request.contextPath}/logout" class="flex items-center space-x-2 py-2 text-red-600"><i class="fas fa-sign-out-alt w-5"></i><span>Logout</span></a>
        <% } else { %>
            <a href="${pageContext.request.contextPath}/login" class="block btn-primary text-white text-center py-2 rounded-lg">Login</a>
            <a href="${pageContext.request.contextPath}/register" class="block border-2 border-primary text-primary text-center py-2 rounded-lg">Register</a>
        <% } %>
    </div>
</nav>

<script>
    document.getElementById('mobileMenuBtn').addEventListener('click', function() {
        document.getElementById('mobileMenu').classList.toggle('hidden');
    });
</script>