<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<sql:update dataSource = "jdbc/vokabeltrainer">
    CREATE TABLE "APP"."VOKABEL"
    (
        ID INT not null 
            GENERATED ALWAYS AS IDENTITY
            (START WITH 1, INCREMENT BY 1), 

            DEUTSCH VARCHAR(250) not null,
            FREMDSPRACHE VARCHAR(250) not null,
            COUNTER INTEGER default 0 not null,
            primary key (ID)
    )
</sql:update>
<sql:update dataSource = "jdbc/vokabeltrainer">
    INSERT INTO APP."VOKABEL" (DEUTSCH, FREMDSPRACHE, COUNTER) 
	VALUES ('hallo', 'hello', DEFAULT)
</sql:update>
<sql:update dataSource = "jdbc/vokabeltrainer">
    INSERT INTO APP."VOKABEL" (DEUTSCH, FREMDSPRACHE, COUNTER) 
	VALUES ('ja', 'yes', DEFAULT)
</sql:update>
<sql:update dataSource = "jdbc/vokabeltrainer">
    INSERT INTO APP."VOKABEL" (DEUTSCH, FREMDSPRACHE, COUNTER) 
	VALUES ('nein', 'no', DEFAULT)
</sql:update>
<c:redirect url = "index.jsp"></c:redirect>