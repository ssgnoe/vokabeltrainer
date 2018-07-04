    
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:query var="resultat" dataSource="jdbc/vokabeltrainer">
    SELECT * FROM APP.VOKABEL
</sql:query>

<!DOCTYPE html>
<html>
    <head>
        <title>Vokabelübersicht</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    </head>
    <body>
        <c:set var="page">index</c:set>
        <%@ include file="nav.jsp" %>

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
                                <td
                                    <c:if test="${zeile.counter < 0}">
                                        class="bg-danger"
                                    </c:if>                                    
                                    >${zeile.counter}</td>
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
                    "info": false,
                    "language": {
                        "url": "https://cdn.datatables.net/plug-ins/1.10.19/i18n/German.json"
                    }
                });
            } );
        </script>
    </body>
</html>
