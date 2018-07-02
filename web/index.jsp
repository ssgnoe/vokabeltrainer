    
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="resultat" dataSource="jdbc/vokabeltrainer">
    SELECT * FROM APP.VOKABEL
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
                    <a class="nav-link" href="#">Übersicht</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="abfragen.jsp">Abfragen</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="neu.jsp">Neu</a>
                </li>
              </ul> 
            </div>
        </nav>

          <main role="main" class="container" style="margin-top: 70px">

            <div class="starter-template">
                <h1>Vokabelübersicht</h1>
                
                <table class="table table-striped table-bordered" id="overview">
                    <thead>
                        <th>Deutsch</th>
                        <th>Fremdsprache</th>
                        <th>Counter</th>
                        <th>Löschen</th>
                    </thead>
                    <tbody>
                        <c:forEach var="zeile" items="${resultat.rows}">
                            <tr>
                                <td>${zeile.deutsch}</td>
                                <td>${zeile.fremdsprache}</td>
                                <td>${zeile.counter}</td>
                                <td><a href="delete.jsp?id=${zeile.id}" class="btn btn-danger">X</a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
                <div class="alert alert-info">
                    <p>Counter: Richtig: +1, Falsch: -1</p>
                    <a class="btn btn-danger" href="kill.jsp">Counter zurücksetzen</a>
                </div>
            </div>

          </main>
        <script
        src="https://code.jquery.com/jquery-3.3.1.min.js"
        integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
        crossorigin="anonymous"></script>

        <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

        <script>
            $(document).ready(function() {
                $('#overview').DataTable({
                    'paging': false,
                    "info":     false
                });
            } );
        </script>
    </body>
</html>
