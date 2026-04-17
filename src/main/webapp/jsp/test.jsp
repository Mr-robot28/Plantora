<%@ page import="com.greennursery.dao.PlantDAO" %>
<%@ page import="com.greennursery.model.Plant" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>Simple Test</title>
</head>
<body>
    <h1>Direct Database Test (No CSS, No Icons)</h1>
    
    <%
    PlantDAO dao = new PlantDAO();
    List<Plant> plants = dao.getAllPlants();
    
    out.println("<table border='1' cellpadding='10'>");
    out.println("<tr><th>ID</th><th>Name</th><th>Price from getPrice()</th></tr>");
    
    for (Plant p : plants) {
        out.println("<tr>");
        out.println("<td>" + p.getPlantId() + "</td>");
        out.println("<td>" + p.getName() + "</td>");
        out.println("<td>" + p.getPrice() + "</td>");
        out.println("</tr>");
    }
    out.println("</table>");
    %>
    
    <hr/>
    
    <h2>Raw HTML Output Test</h2>
    <%
    for (Plant p : plants) { 
        out.println("<p>Plant: " + p.getName() + " - Price: " + p.getPrice() + "</p>");
    } 
    %>
</body>
</html>