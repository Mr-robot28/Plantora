<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

<section class="relative bg-gradient-to-r from-teal-600 to-emerald-600 py-20">
    <div class="max-w-7xl mx-auto px-4 text-center text-white">
        <h1 class="text-5xl md:text-6xl font-bold mb-4 animate-fade-in">About Plantora</h1>
        <p class="text-xl max-w-2xl mx-auto">Nurturing nature, one plant at a time since 2010</p>
    </div>
</section>

<section class="max-w-7xl mx-auto px-4 py-20">
    <div class="grid md:grid-cols-2 gap-12 items-center">
        <div>
            <p class="text-teal-600 font-semibold mb-2">Our Story</p>
            <h2 class="text-4xl font-bold text-gray-800 mb-6">Bringing Greenery to Every Home</h2>
            <p class="text-gray-600 mb-4 leading-relaxed">
                Founded in 2010, Plantora started as a small family-owned nursery with a passion for plants 
                and a dream to make gardening accessible to everyone. Today, we've grown into one of India's 
                most trusted online plant stores, serving over 10,000 happy customers.
            </p>
            <p class="text-gray-600 mb-4 leading-relaxed">
                Our mission is simple: to provide high-quality, healthy plants that bring joy and tranquility 
                to your living spaces. We work directly with certified organic growers to ensure every plant 
                meets our strict quality standards.
            </p>
            <p class="text-gray-600 leading-relaxed">
                Whether you're a seasoned gardener or just starting your plant journey, our team of experts 
                is here to guide you every step of the way.
            </p>
            <div class="flex gap-4 mt-8">
                <div class="flex items-center gap-2"><i class="fas fa-check-circle text-teal-600"></i> 500+ Plant Varieties</div>
                <div class="flex items-center gap-2"><i class="fas fa-check-circle text-teal-600"></i> 100% Organic</div>
                <div class="flex items-center gap-2"><i class="fas fa-check-circle text-teal-600"></i> Free Delivery</div>
            </div>
        </div>
        <div class="relative">
            <img src="https://images.unsplash.com/photo-1466692476868-aef1dfb1e735?w=600" alt="Nursery" class="rounded-2xl shadow-2xl">
            <div class="absolute -bottom-6 -left-6 bg-white rounded-xl p-4 shadow-lg">
                <div class="flex items-center gap-3">
                    <div class="text-3xl"><i class="fas fa-leaf"></i></div>
                    <div><p class="font-bold">15+ Years</p><p class="text-sm text-gray-500">of Excellence</p></div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="bg-gray-50 py-20">
    <div class="max-w-7xl mx-auto px-4">
        <div class="text-center mb-12">
            <h2 class="text-3xl font-bold text-gray-800">Our Core Values</h2>
            <div class="w-24 h-1 bg-teal-500 mx-auto rounded-full mt-2"></div>
        </div>
        <div class="grid md:grid-cols-3 gap-8">
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm">
                <div class="w-16 h-16 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fas fa-leaf text-2xl text-teal-600"></i>
                </div>
                <h3 class="font-bold text-xl mb-2">Sustainability</h3>
                <p class="text-gray-500">Committed to eco-friendly practices and reducing carbon footprint</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm">
                <div class="w-16 h-16 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fas fa-heart text-2xl text-teal-600"></i>
                </div>
                <h3 class="font-bold text-xl mb-2">Quality First</h3>
                <p class="text-gray-500">Every plant undergoes rigorous quality checks before shipping</p>
            </div>
            <div class="text-center p-6 bg-white rounded-2xl shadow-sm">
                <div class="w-16 h-16 bg-teal-100 rounded-full flex items-center justify-center mx-auto mb-4">
                    <i class="fas fa-users text-2xl text-teal-600"></i>
                </div>
                <h3 class="font-bold text-xl mb-2">Customer First</h3>
                <p class="text-gray-500">Your satisfaction is our top priority, always</p>
            </div>
        </div>
    </div>
</section>

<%@ include file="includes/footer.jsp" %>