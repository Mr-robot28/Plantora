<%@ include file="includes/header.jsp" %>

<div class="max-w-6xl mx-auto px-4 py-12">
    <div class="flex items-center gap-2 text-sm text-gray-500 mb-6">
        <a href="${pageContext.request.contextPath}/jsp/index.jsp" class="hover:text-teal-600">Home</a>
        <i class="fas fa-chevron-right text-xs"></i>
        <span class="text-teal-600">Plant Care Guide</span>
    </div>

    <div class="text-center mb-12">
        <h1 class="text-4xl font-bold text-gray-800 mb-4">Plant Care Guide</h1>
        <div class="w-24 h-1 bg-gradient-to-r from-teal-500 to-emerald-500 mx-auto rounded-full"></div>
        <p class="text-gray-500 mt-4 max-w-2xl mx-auto">Essential tips to keep your plants healthy and thriving</p>
    </div>

    <!-- Care Cards -->
    <div class="grid md:grid-cols-2 gap-8 mb-12">
        <div class="bg-white rounded-2xl shadow-lg p-6">
            <div class="flex items-center gap-3 mb-4">
                <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                    <i class="fas fa-tint text-teal-600 text-xl"></i>
                </div>
                <h2 class="text-xl font-bold text-gray-800">Watering Guide</h2>
            </div>
            <ul class="space-y-2 text-gray-600">
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Water when top 1-2 inches of soil feel dry</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Avoid overwatering - root rot is common</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Use room temperature water</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Water less in winter months</li>
            </ul>
        </div>

        <div class="bg-white rounded-2xl shadow-lg p-6">
            <div class="flex items-center gap-3 mb-4">
                <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                    <i class="fas fa-sun text-teal-600 text-xl"></i>
                </div>
                <h2 class="text-xl font-bold text-gray-800">Light Requirements</h2>
            </div>
            <ul class="space-y-2 text-gray-600">
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Bright indirect light for most indoor plants</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Avoid direct afternoon sun</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Low-light plants need 2-3 hours of indirect light</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Rotate plants weekly for even growth</li>
            </ul>
        </div>

        <div class="bg-white rounded-2xl shadow-lg p-6">
            <div class="flex items-center gap-3 mb-4">
                <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                    <i class="fas fa-temperature-low text-teal-600 text-xl"></i>
                </div>
                <h2 class="text-xl font-bold text-gray-800">Temperature & Humidity</h2>
            </div>
            <ul class="space-y-2 text-gray-600">
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Ideal temperature: 18-28°C</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Protect from cold drafts and AC vents</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Mist tropical plants regularly</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Use a humidifier for humidity-loving plants</li>
            </ul>
        </div>

        <div class="bg-white rounded-2xl shadow-lg p-6">
            <div class="flex items-center gap-3 mb-4">
                <div class="w-12 h-12 bg-teal-100 rounded-full flex items-center justify-center">
                    <i class="fas fa-seedling text-teal-600 text-xl"></i>
                </div>
                <h2 class="text-xl font-bold text-gray-800">Fertilizing</h2>
            </div>
            <ul class="space-y-2 text-gray-600">
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Fertilize during growing season (Spring-Summer)</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Use balanced liquid fertilizer every 2-3 weeks</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Don't fertilize dormant plants in winter</li>
                <li><i class="fas fa-check-circle text-teal-500 mr-2"></i> Dilute fertilizer to half strength</li>
            </ul>
        </div>
    </div>

    <!-- Common Problems -->
    <div class="bg-white rounded-2xl shadow-lg p-8">
        <h2 class="text-2xl font-bold text-gray-800 mb-6 text-center">Common Plant Problems & Solutions</h2>
        <div class="grid md:grid-cols-3 gap-6">
            <div class="text-center p-4">
                <i class="fas fa-leaf text-4xl text-yellow-500 mb-3"></i>
                <h3 class="font-bold text-gray-800">Yellow Leaves</h3>
                <p class="text-sm text-gray-500 mt-1">Usually overwatering. Let soil dry out.</p>
            </div>
            <div class="text-center p-4">
                <i class="fas fa-leaf text-4xl text-brown-500 mb-3"></i>
                <h3 class="font-bold text-gray-800">Brown Tips</h3>
                <p class="text-sm text-gray-500 mt-1">Low humidity or fluoride in water.</p>
            </div>
            <div class="text-center p-4">
                <i class="fas fa-bug text-4xl text-red-500 mb-3"></i>
                <h3 class="font-bold text-gray-800">Pest Infestation</h3>
                <p class="text-sm text-gray-500 mt-1">Use neem oil or insecticidal soap.</p>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>