    
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    // Etwas wurde übermittelt
    if (request.getParameter("id") != null) {        
        String sql = "";
        if (request.getParameter("de").equals(request.getParameter("deutsch"))
            && (request.getParameter("fr").equals(request.getParameter("fremdsprache")))) {
            // Zähler hochzählen weil richtig
            sql = "UPDATE APP.VOKABEL SET COUNTER = COUNTER + 1 WHERE id = " + request.getParameter("id");
        }
        else {
            // Zähler runterzählen weil falsch 
            sql = "UPDATE APP.VOKABEL SET COUNTER = COUNTER - 1 WHERE id = " + request.getParameter("id");
        }
    }
%>

<!-- Wenn einmal übermittelt: -->

<sql:query var="resultat" dataSource="jdbc/vokabeltrainer">
    SELECT * FROM APP.VOKABEL ORDER BY counter, RANDOM() FETCH FIRST 1 ROWS ONLY
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    </head>
    <body>

        
        <nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
            <a class="navbar-brand" href="/">Vokabeltrainer</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarsExampleDefault">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Abfragen</a>
                    </li>
                </ul> 
            </div>
        </nav>

        <main role="main" class="container" style="margin-top: 70px">
            
            <div class="starter-template">
                <c:set var="zufallsZahl">
                    <%= java.lang.Math.round(java.lang.Math.random()) %>
                </c:set>
                <h1>Abfrage</h1>
                <form action="abfragen.jsp" method="post">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="deutsch">Deutsch</label>
                                <input 
                                    <c:if test="${zufallsZahl == 1}">
                                        value="${resultat.getRows()[0].deutsch}"
                                        readonly
                                    </c:if>
                                    <c:if test="${zufallsZahl == 0}">
                                        autofocus
                                    </c:if>    
                                    type="text" name="deutsch" class="form-control" placeholder="Deutsch">
                                
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="deutsch">Fremdsprache</label>
                                <input 
                                    <c:if test="${zufallsZahl == 0}">
                                        value="${resultat.getRows()[0].fremdsprache}" 
                                        readonly
                                    </c:if>
                                    <c:if test="${zufallsZahl == 1}">
                                        autofocus
                                    </c:if>    
                                    type="text" name="fremdsprache" class="form-control" placeholder="Fremdsprache">
                            </div>
                        </div>
                    </div>
                    <input type="hidden" name="id" value ="${resultat.getRows()[0].id}">
                    <input type="hidden" name="de" value ="${resultat.getRows()[0].deutsch}">
                    <input type="hidden" name="fr" value ="${resultat.getRows()[0].fremdsprache}">
                    <button type="submit" class="btn btn-primary">Abschicken</button>
                </form>
            </div>

        </main>
    </body>
</html>
