<%-- 
    Document   : ResumenNotas
    Created on : 11 oct. 2023, 22:56:49
    Author     : jose
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Resumen de Notas</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    </head>
    <body>

        <% Map<String, String> datos = (Map<String, String>) request.getAttribute("datos");
        %>
        
        <div class="container mt-4">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Ingreso de Datos</h5>

                    <form class="row g-3" action="Grabado" method="post">
                        <div class="row my-3">
                            <div class="col">
                                <label for="practicasPromediadas" class="form-label">Practicas Promediadas:</label>
                                <input type="text" id="practicasPromediadas" name="practicasPromediadas" class="form-control" 
                                       value="<%=(datos != null && datos.containsKey("notasProm")) ? datos.get("notasProm") : ""%>">
                            </div>
                            <div class="col">
                                <label for="promPracticas" class="form-label">Promedio de Practicas:</label>
                                <input type="text" id="promPracticas" name="promPracticas" class="form-control"
                                       value="<%=(datos != null && datos.containsKey("promedio")) ? datos.get("promedio").substring(0,4) : ""%>">
                            </div>
                            <div class="col">
                                <label for="practicaEliminada" class="form-label">Practica Eliminada:</label>
                                <input type="text" id="practicaEliminada" name="practicaEliminada" class="form-control"
                                       value="<%=(datos != null && datos.containsKey("eliminada")) ? datos.get("eliminada") : ""%>">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="puntaje" class="form-label">Puntaje:</label>
                            </div>
                            <div class="col">
                                <input type="text" id="puntaje" name="puntaje" class="form-control"
                                       value="<%=(datos != null && datos.containsKey("puntaje")) ? datos.get("puntaje").substring(0,4) : ""%>">
                            </div>
                            <div class="col">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="promFinal" class="form-label">Promedio Final:</label>
                            </div>
                            <div class="col">
                                <input type="text" id="promFinal" name="promFinal" class="form-control"
                                       value="<%=(datos != null && datos.containsKey("promFinal")) ? datos.get("promFinal").substring(0,4) : ""%>">
                            </div>
                            <div class="col">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <div class="col">
                                <label for="condicion" class="form-label">Condicion:</label>
                            </div>
                            <div class="col">
                                <input type="text" id="condicion" name="condicion" class="form-control"
                                       value="<%=(datos != null && datos.containsKey("condicion")) ? datos.get("condicion") : ""%>">
                            </div>
                            <div class="col">
                                <button class="btn btn-primary" type="sumbit">Grabar</button>
                            </div>
                        </div>
                    </form>    
                </div>
            </div>
        </div>
    </body>   
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</html>
