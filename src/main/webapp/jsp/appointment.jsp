<%@ include file="includes/header.jsp" %>
<%@ page import="com.greennursery.model.User" %>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/jsp/login.jsp");
        return;
    }
%>

<div class="max-w-4xl mx-auto px-4 py-12">
    <div class="text-center mb-8">
        <h1 class="text-4xl font-bold text-gray-800 mb-2">Book a Nursery Visit</h1>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        <p class="text-gray-500 mt-4">Visit our nursery and get expert guidance from our horticulturists</p>
    </div>

    <% if (request.getAttribute("error") != null) { %>
    <div class="bg-red-50 border-l-4 border-red-500 text-red-700 px-4 py-3 rounded-lg mb-6">
        <i class="fas fa-exclamation-circle mr-2"></i> <%= request.getAttribute("error") %>
    </div>
    <% } %>

    <div class="grid md:grid-cols-2 gap-8">
        <!-- Booking Form -->
        <div class="bg-white rounded-2xl shadow-xl p-6">
            <h3 class="text-xl font-bold text-gray-800 mb-4">Schedule Your Visit</h3>
            <form action="${pageContext.request.contextPath}/appointment" method="post" class="space-y-4">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Your Name</label>
                    <input type="text" value="<%= user.getName() %>" readonly
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl bg-gray-50">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Email</label>
                    <input type="email" value="<%= user.getEmail() %>" readonly
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl bg-gray-50">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Select Date *</label>
                    <input type="date" name="date" required min="<%= new java.text.SimpleDateFormat("yyyy-MM-dd").format(new java.util.Date()) %>"
                           class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Select Time *</label>
                    <select name="time" required class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500">
                        <option value="">Select time slot</option>
                        <option value="10:00">10:00 AM - 11:00 AM</option>
                        <option value="11:00">11:00 AM - 12:00 PM</option>
                        <option value="12:00">12:00 PM - 01:00 PM</option>
                        <option value="14:00">02:00 PM - 03:00 PM</option>
                        <option value="15:00">03:00 PM - 04:00 PM</option>
                        <option value="16:00">04:00 PM - 05:00 PM</option>
                    </select>
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Message (Optional)</label>
                    <textarea name="message" rows="3" placeholder="Any specific plants or queries you'd like to discuss?"
                              class="w-full px-4 py-3 border border-gray-200 rounded-xl focus:outline-none focus:ring-2 focus:ring-teal-500"></textarea>
                </div>
                <button type="submit" class="w-full bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition">
                    Book Appointment <i class="fas fa-calendar-check ml-2"></i>
                </button>
            </form>
        </div>

        <!-- Info Section -->
        <div class="space-y-6">
            <div class="bg-teal-50 rounded-2xl p-6">
                <div class="flex items-center gap-3 mb-4">
                    <i class="fas fa-clock text-teal-600 text-2xl"></i>
                    <h3 class="font-bold text-lg">Visit Hours</h3>
                </div>
                <div class="space-y-2 text-gray-600">
                    <p>Monday - Saturday: 10:00 AM - 5:00 PM</p>
                    <p>Sunday: Closed</p>
                    <p class="text-sm text-gray-500 mt-2">Last appointment at 4:00 PM</p>
                </div>
            </div>

            <div class="bg-white rounded-2xl shadow-lg p-6">
                <div class="flex items-center gap-3 mb-4">
                    <i class="fas fa-map-marker-alt text-teal-600 text-2xl"></i>
                    <h3 class="font-bold text-lg">Our Location</h3>
                </div>
                <p class="text-gray-600">123 Green Valley, Pune, Maharashtra 411001</p>
                <div class="mt-4 h-40 rounded-xl overflow-hidden">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3783.293!2d73.856743!3d18.520430!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c147e8f6c7d1%3A0x4b4f4f4f4f4f4f4f!2sPune!5e0!3m2!1sen!2sin!4v1699999999999!5m2!1sen!2sin" 
                            width="100%" height="100%" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
                </div>
            </div>

            <div class="bg-white rounded-2xl shadow-lg p-6">
                <div class="flex items-center gap-3 mb-4">
                    <i class="fas fa-phone-alt text-teal-600 text-2xl"></i>
                    <h3 class="font-bold text-lg">Need Assistance?</h3>
                </div>
                <p class="text-gray-600">Call us: <strong>+91 98765 43210</strong></p>
                <p class="text-gray-500 text-sm mt-2">For any queries regarding appointments</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>