<%@page import="com.mycompany.trianglecalculator.Calculator"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Resultados</title>
</head>
<body>
    <h1>Resultados del Cálculo</h1>
    <%
        String baseStr = request.getParameter("base");
        String alturaStr = request.getParameter("altura");
        
        double base = Double.parseDouble(baseStr);
        double altura = Double.parseDouble(alturaStr);
        
        Calculator triangulo = new Calculator(base, altura);
        double area = triangulo.calcularArea();
        double perimetro = triangulo.calcularPerimetro();
    %>
    <p>Base: <%= base %></p>
    <p>Altura: <%= altura %></p>
    <p>Área: <%= area %></p>
    <p>Perímetro: <%= perimetro %></p>
    <a href="<%= request.getContextPath() %>/index.html">Calcular otro triángulo</a>
</body>
</html>