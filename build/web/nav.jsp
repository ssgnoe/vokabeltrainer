<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<nav class="navbar navbar-expand-md navbar-dark bg-dark fixed-top">
    <a class="navbar-brand" href="/">Vokabeltrainer</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarsExampleDefault">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item
        <c:if test="${page == 'index'}">
            active
        </c:if>
        ">
            <a class="nav-link" href="index.jsp">Übersicht</a>
        </li>
        <li class="nav-item
        <c:if test="${page == 'abfragen'}">
            active
        </c:if>
        ">
            <a class="nav-link" href="abfragen.jsp">Abfragen</a>
        </li>
        <li class="nav-item
        <c:if test="${page == 'neu'}">
            active
        </c:if>
        ">
            <a class="nav-link" href="neu.jsp">Neu</a>
        </li>
      </ul> 
    </div>
</nav>