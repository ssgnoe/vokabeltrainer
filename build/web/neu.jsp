    
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<% 
    // Etwas wurde übermittelt
    if (request.getParameter("deutsch") != null 
            && request.getParameter("fremdsprache") != null
            && !request.getParameter("deutsch").isEmpty() 
            && !request.getParameter("fremdsprache").isEmpty()) { %>
            <sql:update dataSource = "jdbc/vokabeltrainer">
                INSERT INTO APP.VOKABEL (DEUTSCH, FREMDSPRACHE) VALUES ('${param.deutsch}', '${param.fremdsprache}')
            </sql:update>
    <% }
%>

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
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Übersicht</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="abfragen.jsp">Abfragen</a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Neu</a>
                    </li>
                </ul> 
            </div>
        </nav>

        <main role="main" class="container" style="margin-top: 70px">
            
            <div class="starter-template">
                <h1>Hinzufügen von Vokabeln</h1>
                <c:if test='${not empty param.deutsch or not empty param.fremdsprache}'>
                    <div>
                        <c:choose>
                            <c:when test='${empty param.deutsch}'>
                                    <div class="alert alert-danger">Es fehlt das deutsche Wort!</div>
                            </c:when>
                            <c:when test='${empty param.fremdsprache}'>
                                    <div class="alert alert-danger">Es fehlt die Fremdsprache!</div>
                            </c:when>
                            
                            <c:otherwise>
                                <div class="alert alert-success">
                                    <p>Das Wort wurde hinzugefügt</p>
                                    <p>${param.deutsch} => ${param.fremdsprache}</p>                                   
                                </div>
                            </c:otherwise>
                        </c:choose>

                    </div>
                </c:if>
                <form action="neu.jsp" method="post">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="deutsch">Deutsch</label>
                                <input required autofocus type="text" name="deutsch" class="form-control" placeholder="Deutsch">
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label for="deutsch">Fremdsprache</label>
                                <input required type="text" name="fremdsprache" class="form-control" placeholder="Fremdsprache">
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary">Hinzufügen</button>
                </form>
            </div>

        </main>
    </body>
</html>
