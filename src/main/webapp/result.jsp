<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Resultados</title>
</head>
<body>
    <h1>Resultados del Cálculo</h1>
    <p>Área: <%= request.getAttribute("area") %></p>
    <p>Perímetro: <%= request.getAttribute("perimetro") %></p>
    <a href="<%= request.getContextPath() %>/index.jsp">Calcular otro triángulo</a>
</body>
</html>
