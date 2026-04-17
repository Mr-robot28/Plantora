<%@ include file="includes/header.jsp" %>

<section class="relative bg-gradient-to-r from-teal-600 to-emerald-600 py-20">
    <div class="max-w-7xl mx-auto px-4 text-center text-white">
        <h1 class="text-5xl md:text-6xl font-bold mb-4">Get In Touch</h1>
        <p class="text-xl">We'd love to hear from you</p>
    </div>
</section>

<section class="max-w-7xl mx-auto px-4 py-20">
    <div class="grid md:grid-cols-2 gap-12">
        <!-- Contact Form -->
        <div class="bg-white rounded-2xl shadow-xl p-8">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Send us a Message</h2>
            <form action="#" method="post" class="space-y-5">
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Your Name</label>
                    <input type="text" required class="w-full border border-gray-200 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Email Address</label>
                    <input type="email" required class="w-full border border-gray-200 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Subject</label>
                    <input type="text" required class="w-full border border-gray-200 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-teal-500">
                </div>
                <div>
                    <label class="block text-sm font-semibold text-gray-700 mb-2">Message</label>
                    <textarea rows="5" required class="w-full border border-gray-200 rounded-xl px-4 py-3 focus:outline-none focus:ring-2 focus:ring-teal-500"></textarea>
                </div>
                <button type="submit" class="w-full bg-gradient-to-r from-teal-600 to-emerald-600 text-white font-bold py-3 rounded-xl hover:shadow-lg transition">
                    Send Message <i class="fas fa-paper-plane ml-2"></i>
                </button>
            </form>
        </div>
        
        <!-- Contact Info -->
        <div>
            <div class="bg-teal-50 rounded-2xl p-8 mb-6">
                <h2 class="text-2xl font-bold text-gray-800 mb-6">Contact Information</h2>
                <div class="space-y-4">
                    <div class="flex items-start gap-4">
                        <div class="w-12 h-12 bg-teal-600 rounded-full flex items-center justify-center text-white"><i class="fas fa-map-marker-alt"></i></div>
                        <div><p class="font-semibold">Visit Us</p><p class="text-gray-500">123 Green Valley, Pune, Maharashtra 411001</p></div>
                    </div>
                    <div class="flex items-start gap-4">
                        <div class="w-12 h-12 bg-teal-600 rounded-full flex items-center justify-center text-white"><i class="fas fa-phone-alt"></i></div>
                        <div><p class="font-semibold">Call Us</p><p class="text-gray-500">+91 98765 43210<br>+91 87654 32109</p></div>
                    </div>
                    <div class="flex items-start gap-4">
                        <div class="w-12 h-12 bg-teal-600 rounded-full flex items-center justify-center text-white"><i class="fas fa-envelope"></i></div>
                        <div><p class="font-semibold">Email Us</p><p class="text-gray-500">hello@greennursery.com<br>support@greennursery.com</p></div>
                    </div>
                    <div class="flex items-start gap-4">
                        <div class="w-12 h-12 bg-teal-600 rounded-full flex items-center justify-center text-white"><i class="fas fa-clock"></i></div>
                        <div><p class="font-semibold">Business Hours</p><p class="text-gray-500">Monday - Saturday: 9:00 AM - 7:00 PM<br>Sunday: Closed</p></div>
                    </div>
                </div>
            </div>
            
            <!-- Social Links -->
            <div class="bg-white rounded-2xl shadow-xl p-8">
                <h3 class="font-bold text-lg mb-4">Follow Us</h3>
                <div class="flex gap-4">
                    <a href="#" class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center hover:bg-teal-600 hover:text-white transition"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center hover:bg-teal-600 hover:text-white transition"><i class="fab fa-instagram"></i></a>
                    <a href="#" class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center hover:bg-teal-600 hover:text-white transition"><i class="fab fa-twitter"></i></a>
                    <a href="#" class="w-12 h-12 bg-gray-100 rounded-full flex items-center justify-center hover:bg-teal-600 hover:text-white transition"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
    </div>
    
    <!-- Map -->
    <div class="mt-12 rounded-2xl overflow-hidden shadow-xl">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3783.293!2d73.856743!3d18.520430!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c147e8f6c7d1%3A0x4b4f4f4f4f4f4f4f!2sPune!5e0!3m2!1sen!2sin!4v1699999999999!5m2!1sen!2sin" 
                width="100%" height="300" style="border:0;" allowfullscreen="" loading="lazy"></iframe>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>