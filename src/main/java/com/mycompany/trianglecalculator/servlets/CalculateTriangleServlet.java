package com.mycompany.trianglecalculator.servlets;

import com.mycompany.trianglecalculator.Calculator;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class CalculateTriangleServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String baseStr = request.getParameter("base");
        String alturaStr = request.getParameter("altura");

        double base = Double.parseDouble(baseStr);
        double altura = Double.parseDouble(alturaStr);

        Calculator triangulo = new Calculator(base, altura);
        double area = triangulo.calcularArea();
        double perimetro = triangulo.calcularPerimetro();

        // Guardar resultados en cookies
        Cookie baseCookie = new Cookie("base", baseStr);
        Cookie alturaCookie = new Cookie("altura", alturaStr);
        Cookie areaCookie = new Cookie("area", String.valueOf(area));
        Cookie perimetroCookie = new Cookie("perimetro", String.valueOf(perimetro));

        baseCookie.setMaxAge(60*60*24); // 1 día
        alturaCookie.setMaxAge(60*60*24);
        areaCookie.setMaxAge(60*60*24);
        perimetroCookie.setMaxAge(60*60*24);

        response.addCookie(baseCookie);
        response.addCookie(alturaCookie);
        response.addCookie(areaCookie);
        response.addCookie(perimetroCookie);

        // Redirigir a result.jsp con los resultados
        request.setAttribute("area", area);
        request.setAttribute("perimetro", perimetro);
        request.getRequestDispatcher("result.jsp").forward(request, response);
    }
}
