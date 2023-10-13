<%-- 
    Document   : IngresarNotas
    Created on : 11 oct. 2023, 18:28:31
    Author     : jose
--%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ingresar Notas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">  
    </head>
    <body>

        <%
            Map<String, String> errores = (Map<String, String>) request.getAttribute("errores");
        %>

        <div class="container mt-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ingreso de Datos</h5>

                    <form class="row g-3" action="Resumen de Notas" method="post">
                        <div class="row my-3">
                            <div class="col">
                                <div class="col-auto">
                                    <label for="alumno" class="col-form-label">Alumno:</label>
                                </div>
                            </div>
                            <div class="col">
                                <select class="form-select" id="alumno" name="alumno">
                                    <option value="Jose" ${param.alumno.equals("Jose")?"selected":""}>Jose</option>
                                    <option value="Henry" ${param.alumno.equals("Henry")?"selected":""}>Henry</option>
                                    <option value="Jorge" ${param.alumno.equals("Jorge")?"selected":""}>Jorge</option>
                                    <option value="Carlos" ${param.alumno.equals("Carlos")?"selected":""}>Carlos</option>
                                    <option value="Hans" ${param.alumno.equals("Hans")?"selected":""}>Hans</option>
                                </select>
                            </div>
                            <div class="col">
                                <div class="col-auto">
                                    <label for="curso" class="col-form-label">Curso:</label>
                                </div>
                            </div>
                            <div class="col">
                                <select class="form-select" id="curso" name="curso">
                                    <option value="UML" ${param.curso.equals("UML")?"selected":""}>UML</option>
                                    <option value="Java" ${param.curso.equals("Java")?"selected":""}>Java</option>
                                    <option value="PHP" ${param.curso.equals("PHP")?"selected":""}>PHP</option>
                                    <option value="BaseDatos" ${param.curso.equals("BaseDatos")?"selected":""}>Base de Datos</option>
                                    <option value="JavaScript" ${param.curso.equals("JavaScript")?"selected":""}>JavaScript</option>
                                </select>
                            </div>
                            <div class="col">
                                <button class="btn btn-primary" type="sumbit">Siguiente</button>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="practica1" class="form-label">Practica 1:</label>
                                <input type="text" id="practica1" name="practica1" class="form-control" autocomplete="off" value="${param.practica1}">

                                <% if (errores != null && errores.containsKey("errPC1")) {%>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <%=errores.get("errPC1")%>
                                </div>
                                <%}%>

                            </div>
                            <div class="col">
                                <label for="practica2" class="form-label">Practica 2:</label>
                                <input type="text" id="practica2" name="practica2" class="form-control" autocomplete="off" value="${param.practica2}">
                                <% if (errores != null && errores.containsKey("errPC2")) {%>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <%=errores.get("errPC2")%>
                                </div>
                                <%}%>
                            </div>
                            <div class="col">
                                <label for="practica3" class="form-label">Practica 3:</label>
                                <input type="text" id="practica3" name="practica3" class="form-control" autocomplete="off" value="${param.practica3}">
                                <% if (errores != null && errores.containsKey("errPC3")) {%>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <%=errores.get("errPC3")%>
                                </div>
                                <%}%>
                            </div>
                            <div class="col">
                                <label for="practica4" class="form-label">Practica 4:</label>
                                <input type="text" id="practica4" name="practica4" class="form-control" autocomplete="off" value="${param.practica4}">
                                <% if (errores != null && errores.containsKey("errPC4")) {%>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <%=errores.get("errPC4")%>
                                </div>
                                <%}%>
                            </div>
                            <div class="col">
                                <label for="examenFinal" class="form-label">Examen Final:</label>
                                <input type="text" id="examenFinal" name="examenFinal" class="form-control" autocomplete="off" value="${param.examenFinal}">
                                <% if (errores != null && errores.containsKey("errEF")) {%>
                                <div class="alert alert-danger mt-3" role="alert">
                                    <%=errores.get("errEF")%>
                                </div>
                                <%}%>
                            </div>
                        </div>
                    </form>    
                </div>
            </div>
        </div>



    </body> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
