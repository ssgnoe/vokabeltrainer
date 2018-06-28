    
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="resultat" dataSource="jdbc/vokabeltrainer">
    SELECT * FROM APP.VOKABEL ORDER BY RANDOM() FETCH FIRST 1 ROWS ONLY
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
                <form>
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="deutsch">Deutsch</label>
                                <input 
                                    <c:if test="${zufallsZahl == 1}">
                                        value="${resultat.getRows()[0].deutsch}"
                                        disabled
                                    </c:if>
                                    type="text" class="form-control" placeholder="Deutsch">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="deutsch">Fremdsprache</label>
                                <input 
                                    <c:if test="${zufallsZahl == 0}">
                                        value="${resultat.getRows()[0].fremdsprache}" 
                                        disabled
                                    </c:if>
                                    type="text" class="form-control" placeholder="Fremdsprache">
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Abschicken</button>
                </form>
            </div>

        </main>
    </body>
</html>
