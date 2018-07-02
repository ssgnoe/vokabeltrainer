<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:update dataSource = "jdbc/vokabeltrainer">
    UPDATE APP.VOKABEL SET COUNTER = 0 WHERE id > 0
</sql:update>
<c:redirect url = "index.jsp"></c:redirect>