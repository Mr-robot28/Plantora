<%@ include file="includes/header.jsp" %>

<div class="max-w-4xl mx-auto px-4 py-12">
    <!-- Breadcrumb -->
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600">FAQ</span>
    </div>

    <div class="bg-white rounded-2xl shadow-lg overflow-hidden">
        <div class="bg-gradient-to-r from-teal-600 to-emerald-600 px-8 py-6 text-center">
            <i class="fas fa-question-circle text-5xl text-white mb-3"></i>
            <h1 class="text-3xl font-bold text-white">Frequently Asked Questions</h1>
            <p class="text-teal-100 mt-1">Find answers to common questions about our plants and services</p>
        </div>
        
        <div class="p-8 space-y-4">
            <!-- FAQ Categories -->
            <div class="flex flex-wrap gap-3 mb-8 pb-4 border-b border-gray-200">
                <button class="faq-cat-btn active px-4 py-2 rounded-full text-sm font-semibold bg-teal-600 text-white" data-cat="all">All Questions</button>
                <button class="faq-cat-btn px-4 py-2 rounded-full text-sm font-semibold bg-gray-100 text-gray-700 hover:bg-teal-100 transition" data-cat="ordering">Ordering</button>
                <button class="faq-cat-btn px-4 py-2 rounded-full text-sm font-semibold bg-gray-100 text-gray-700 hover:bg-teal-100 transition" data-cat="plants">Plants & Care</button>
                <button class="faq-cat-btn px-4 py-2 rounded-full text-sm font-semibold bg-gray-100 text-gray-700 hover:bg-teal-100 transition" data-cat="shipping">Shipping & Delivery</button>
                <button class="faq-cat-btn px-4 py-2 rounded-full text-sm font-semibold bg-gray-100 text-gray-700 hover:bg-teal-100 transition" data-cat="payment">Payments & Returns</button>
                <button class="faq-cat-btn px-4 py-2 rounded-full text-sm font-semibold bg-gray-100 text-gray-700 hover:bg-teal-100 transition" data-cat="appointment">Appointments</button>
            </div>

            <!-- FAQ Items - Ordering -->
            <div class="faq-item" data-cat="ordering">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">How do I place an order?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    To place an order, simply browse our plant catalog, add desired plants to your cart, proceed to checkout, enter your delivery address, select payment method, and confirm your order. You will receive a confirmation email once your order is placed.
                </div>
            </div>

            <div class="faq-item" data-cat="ordering">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Can I modify or cancel my order?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    You can modify or cancel your order within 1 hour of placing it. Please contact our customer support immediately at +91 98765 43210 or email support@greennursery.com for any changes.
                </div>
            </div>

            <div class="faq-item" data-cat="ordering">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Do I need to create an account to order?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    While you can browse without an account, you need to register to place an order. Registration allows you to track orders, save addresses, and view order history.
                </div>
            </div>

            <!-- FAQ Items - Plants & Care -->
            <div class="faq-item" data-cat="plants">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">How do I know which plant is right for my home?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Consider your space's lighting conditions. Low-light plants like Snake Plant and ZZ Plant work well in dim areas. For bright spaces, consider Monstera or Fiddle Leaf Fig. Check our Plant Care Guide for detailed recommendations.
                </div>
            </div>

            <div class="faq-item" data-cat="plants">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">How often should I water my plants?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Watering frequency depends on the plant type, pot size, and environment. As a general rule, water when the top 1-2 inches of soil feel dry. Succulents need less water, while tropical plants prefer consistently moist soil. Check our Plant Care Guide for specific plant requirements.
                </div>
            </div>

            <div class="faq-item" data-cat="plants">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Will my plant arrive healthy?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Yes! All our plants are carefully inspected before shipping and packed securely in eco-friendly packaging to ensure they reach you in perfect condition. We also offer a 7-day guarantee on all plants.
                </div>
            </div>

            <div class="faq-item" data-cat="plants">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Do you provide plant care support?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Absolutely! Our horticulture experts are available via email and phone to answer any plant care questions. You can also book a nursery visit for personalized guidance.
                </div>
            </div>

            <!-- FAQ Items - Shipping & Delivery -->
            <div class="faq-item" data-cat="shipping">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">How long does delivery take?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Delivery typically takes 3-7 business days depending on your location. Metro cities: 3-5 days, Tier 2 cities: 5-7 days, Remote areas: 7-10 days. You will receive a tracking number once your order ships.
                </div>
            </div>

            <div class="faq-item" data-cat="shipping">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Do you offer free shipping?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Yes, we offer free shipping on all orders above ₹500. For orders below ₹500, a flat shipping fee of ₹50 is applied.
                </div>
            </div>

            <div class="faq-item" data-cat="shipping">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Can I track my order?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Yes! Once your order is shipped, you will receive an email and SMS with a tracking number. You can also track your order by logging into your account and visiting "My Orders" section.
                </div>
            </div>

            <!-- FAQ Items - Payments & Returns -->
            <div class="faq-item" data-cat="payment">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">What payment methods do you accept?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    We accept Cash on Delivery (COD), Credit/Debit Cards (Visa, Mastercard, RuPay), UPI (Google Pay, PhonePe, Paytm), Net Banking, and Wallet payments.
                </div>
            </div>

            <div class="faq-item" data-cat="payment">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">What is your return policy?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    We offer a 7-day guarantee on all plants. If your plant arrives damaged or dies within 7 days, we will replace it or issue a full refund. Please refer to our Return Policy page for detailed information.
                </div>
            </div>

            <div class="faq-item" data-cat="payment">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">How long does refund processing take?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Refunds are processed within 5-7 business days after return approval. The amount will be credited to your original payment method.
                </div>
            </div>

            <!-- FAQ Items - Appointments -->
            <div class="faq-item" data-cat="appointment">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">How do I book a nursery visit?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    You can book a nursery visit through our "Book a Visit" page. Select your preferred date and time, fill in your details, and submit the form. You will receive a confirmation email once your appointment is scheduled.
                </div>
            </div>

            <div class="faq-item" data-cat="appointment">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">What are your nursery visiting hours?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    Our nursery is open Monday to Saturday from 10:00 AM to 5:00 PM. We remain closed on Sundays. Last appointment is at 4:00 PM.
                </div>
            </div>

            <div class="faq-item" data-cat="appointment">
                <button class="faq-question w-full text-left p-4 bg-gray-50 rounded-xl hover:bg-teal-50 transition flex justify-between items-center">
                    <span class="font-semibold text-gray-800">Is there any fee for nursery consultation?</span>
                    <i class="fas fa-chevron-down text-teal-600 transition-transform"></i>
                </button>
                <div class="faq-answer hidden p-4 text-gray-600 border-l-4 border-teal-500 ml-4 mt-1">
                    No, nursery consultations are completely free! Our experts are happy to guide you on plant selection and care tips.
                </div>
            </div>
        </div>

        <!-- Still Have Questions? -->
        <div class="bg-teal-50 p-8 text-center">
            <i class="fas fa-headset text-4xl text-teal-600 mb-3"></i>
            <h3 class="text-xl font-bold text-gray-800 mb-2">Still Have Questions?</h3>
            <p class="text-gray-600 mb-4">Our customer support team is here to help you</p>
            <div class="flex flex-wrap justify-center gap-4">
                <a href="${pageContext.request.contextPath}/jsp/contact.jsp" class="bg-teal-600 text-white px-6 py-3 rounded-xl font-semibold hover:bg-teal-700 transition">
                    <i class="fas fa-envelope mr-2"></i>Contact Us
                </a>
                <a href="tel:+919876543210" class="border-2 border-teal-600 text-teal-600 px-6 py-3 rounded-xl font-semibold hover:bg-teal-50 transition">
                    <i class="fas fa-phone-alt mr-2"></i>Call Support
                </a>
            </div>
        </div>
    </div>
</div>

<script>
    // FAQ Accordion functionality
    document.querySelectorAll('.faq-question').forEach(button => {
        button.addEventListener('click', () => {
            const answer = button.nextElementSibling;
            const icon = button.querySelector('.fa-chevron-down');
            
            // Close all other answers
            document.querySelectorAll('.faq-answer').forEach(otherAnswer => {
                if (otherAnswer !== answer && !otherAnswer.classList.contains('hidden')) {
                    otherAnswer.classList.add('hidden');
                    const otherIcon = otherAnswer.previousElementSibling.querySelector('.fa-chevron-down');
                    if (otherIcon) {
                        otherIcon.style.transform = 'rotate(0deg)';
                    }
                }
            });
            
            // Toggle current answer
            answer.classList.toggle('hidden');
            
            // Rotate icon
            if (icon) {
                if (answer.classList.contains('hidden')) {
                    icon.style.transform = 'rotate(0deg)';
                } else {
                    icon.style.transform = 'rotate(180deg)';
                }
            }
        });
    });
    
    // Category filter functionality
    document.querySelectorAll('.faq-cat-btn').forEach(btn => {
        btn.addEventListener('click', () => {
            const category = btn.getAttribute('data-cat');
            
            // Update active button styling
            document.querySelectorAll('.faq-cat-btn').forEach(b => {
                b.classList.remove('bg-teal-600', 'text-white');
                b.classList.add('bg-gray-100', 'text-gray-700');
            });
            btn.classList.add('bg-teal-600', 'text-white');
            btn.classList.remove('bg-gray-100', 'text-gray-700');
            
            // Filter FAQ items
            document.querySelectorAll('.faq-item').forEach(item => {
                if (category === 'all' || item.getAttribute('data-cat') === category) {
                    item.style.display = 'block';
                } else {
                    item.style.display = 'none';
                }
            });
        });
    });
</script>

<style>
    .faq-item {
        margin-bottom: 1rem;
    }
    .faq-question {
        cursor: pointer;
    }
    .faq-answer {
        border-radius: 0 0 0.75rem 0.75rem;
    }
</style>

<%@ include file="includes/footer.jsp" %>