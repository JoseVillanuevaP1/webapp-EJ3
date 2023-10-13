/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.webapp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.OptionalDouble;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author jose
 */
@WebServlet(name = "ServletForm", urlPatterns = {"/ServletForm", "/Registrar Notas", "/Ingresar Notas", "/Resumen de Notas", "/Grabado"})
public class ServletForm extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, NumberFormatException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {

            String path = request.getServletPath();

            switch (path) {
                case "/Registrar Notas":
                    request.getRequestDispatcher("/WEB-INF/RegistrarNotas.jsp").forward(request, response);
                    break;
                case "/Ingresar Notas":
                    request.getRequestDispatcher("/WEB-INF/IngresarNotas.jsp").forward(request, response);
                    break;
                case "/Resumen de Notas":

                    String pc1 = request.getParameter("practica1");
                    String pc2 = request.getParameter("practica2");
                    String pc3 = request.getParameter("practica3");
                    String pc4 = request.getParameter("practica4");
                    String EF = request.getParameter("examenFinal");

                    Map<String, String> errores = new HashMap<>();
                    double pc1X = 0.0,
                     pc2X = 0.0,
                     pc3X = 0.0,
                     pc4X = 0.0,
                     EFX = 0.0;

                    if (pc1 == null || pc1.isEmpty()) {

                        errores.put("errPC1", "Ingrese la practica 1");
                    } else {

                        try {
                            pc1X = Double.parseDouble(pc1);
                            if (pc1X < 0 || pc1X > 20) {
                                errores.put("errPC1", "La PC1 debe ser positiva y menor que 20.");
                            }
                        } catch (NumberFormatException e) {
                            errores.put("errPC1", "La PC1 debe ser un numero");
                        }
                    }
                    if (pc2 == null || pc2.isEmpty()) {
                        errores.put("errPC2", "Ingrese la practica 2");
                    } else {
                        try {
                            pc2X = Double.parseDouble(pc2);
                            if (pc2X < 0 || pc2X > 20) {
                                errores.put("errPC2", "La PC2 debe ser positiva y menor que 20.");
                            }
                        } catch (NumberFormatException e) {
                            errores.put("errPC2", "La PC2 debe ser un numero");
                        }
                    }

                    if (pc3 == null || pc3.isEmpty()) {
                        errores.put("errPC3", "Ingrese la practica 3");
                    } else {
                        try {
                            pc3X = Double.parseDouble(pc3);
                            if (pc3X < 0 || pc3X > 20) {
                                errores.put("errPC3", "La PC3 debe ser positiva y menor que 20.");
                            }
                        } catch (NumberFormatException e) {
                            errores.put("errPC3", "La PC3 debe ser un numero");
                        }
                    }

                    if (pc4 == null || pc4.isEmpty()) {
                        errores.put("errPC4", "Ingrese la practica 4");
                    } else {
                        try {
                            pc4X = Double.parseDouble(pc4);
                            if (pc4X < 0 || pc4X > 20) {
                                errores.put("errPC4", "La PC1 debe ser positiva y menor que 20.");
                            }
                        } catch (NumberFormatException e) {
                            errores.put("errPC4", "La PC4 debe ser un numero");
                        }
                    }
                    if (EF == null || EF.isEmpty()) {
                        errores.put("errEF", "Ingrese el Examen Final");
                    } else {
                        try {
                            EFX = Double.parseDouble(EF);
                            if (EFX < 0 || EFX > 20) {
                                errores.put("errEF", "El EF debe ser positivo y menor que 20.");
                            }
                        } catch (NumberFormatException e) {
                            errores.put("errEF", "El EF debe ser un numero");
                        }
                    }

                    if (errores.isEmpty()) {

                        Map<String, String> datos = new HashMap<>();

                        //formamos un arreglo con las 4 notas
                        ArrayList<Double> notas = new ArrayList<>();
                        notas.add(pc1X);
                        notas.add(pc2X);
                        notas.add(pc3X);
                        notas.add(pc4X);

                        // Encontrar el valor mínimo en el ArrayList
                        double menor = Collections.min(notas);
                        datos.put("eliminada", String.valueOf(menor));

                        // Encontrar la posición del valor mínimo y eliminarlo
                        int posicionMinimo = notas.indexOf(menor);
                        notas.remove(posicionMinimo);

                        //obtener la cadena de Notas
                        Optional<String> notasProm = notas.stream()
                                .map((num) -> num.toString())
                                .reduce((palabra1, palabra2) -> palabra1 + "-" + palabra2);
                        datos.put("notasProm", notasProm.get());

                        //obtener promedio
                        OptionalDouble promedio = notas.stream()
                                .mapToDouble(Double::doubleValue)
                                .average();
                        datos.put("promedio", String.valueOf(promedio.getAsDouble()));

                        double puntaje = EFX + promedio.getAsDouble();
                        datos.put("puntaje", String.valueOf(puntaje));

                        double promFinal = (puntaje) / 2;
                        datos.put("promFinal", String.valueOf(promFinal));

                        String condicion = "Aprobado";

                        if (promFinal < 13) {
                            condicion = "Desaprobado";
                        }
                        datos.put("condicion", condicion);

                        request.setAttribute("datos", datos);
                        request.getRequestDispatcher("/WEB-INF/ResumenNotas.jsp").forward(request, response);

                    } else {
                        request.setAttribute("errores", errores);
                        request.getRequestDispatcher("/WEB-INF/IngresarNotas.jsp").forward(request, response);
                    }
                    break;

                case "/Grabado":
                    request.getRequestDispatcher("/WEB-INF/Grabado.jsp").forward(request, response);
                    break;
                default:
                    break;
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
