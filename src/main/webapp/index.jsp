<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.Cookie"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page import="jakarta.servlet.http.HttpServletRequest"%>
<%@page import="jakarta.servlet.http.HttpServletResponse"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Triángulo Equilátero</title>
</head>
<body>
    <%
        String userName = (String) session.getAttribute("userName");

        if (userName == null) {
    %>
            <form method="post" action="SaveUserNameServlet">
                Nombre: <input type="text" name="userName" required>
                <input type="submit" value="Guardar Nombre">
            </form>
    <%
        } else {
            out.println("<h1>Hola, " + userName + "!</h1>");
        }

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            String base = null, altura = null, area = null, perimetro = null;
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("base")) base = cookie.getValue();
                if (cookie.getName().equals("altura")) altura = cookie.getValue();
                if (cookie.getName().equals("area")) area = cookie.getValue();
                if (cookie.getName().equals("perimetro")) perimetro = cookie.getValue();
            }
            if (base != null && altura != null && area != null && perimetro != null) {
                out.println("<p>Último Triángulo Calculado:</p>");
                out.println("<p>Base: " + base + "</p>");
                out.println("<p>Altura: " + altura + "</p>");
                out.println("<p>Área: " + area + "</p>");
                out.println("<p>Perímetro: " + perimetro + "</p>");
            }
        }
    %>
    <h1>Cálculo de Área y Perímetro de un Triángulo Equilátero</h1>
    <form action="CalculateTriangleServlet" method="post">
        Base: <input type="text" name="base" required><br>
        Altura: <input type="text" name="altura" required><br>
        <input type="submit" value="Calcular">
    </form>
</body>
</html>
