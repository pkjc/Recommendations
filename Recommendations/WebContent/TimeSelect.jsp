<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>

    <jsp:include page="navigation.jsp" />
    <div class="container">
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8" role="">
                <c:if test="${loggedIn}">
                    <div class="alert alert-info alert-dismissable" role="alert">
                        You're already logged in.
                        <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                    </div>
                </c:if>
 <h1>Select a Date and time</h1>
<sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/testdb"
        user="root" password="cse337project"
    />
     
    <sql:query var="listAvail"   dataSource="${myDS}">
        SELECT * FROM avail;
    </sql:query>
    
    <div align="center">
    <select name="Avails">
    <c:forEach var="avail" items="${listAvail.rows}">
    <option value="${avail.ID}"> ${avail.days} ${avail.times}</option>
	</c:forEach>
	</select>
	<form action="Confirmation.jsp">
<input type="submit" value="Submit"
                         /> 
                        </form>
	 </div>

            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="./assets/jquery.min.js"></script>
    <script src="./assets/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="./assets/ie10-viewport-bug-workaround.js"></script>
    <script src="./assets/offcanvas.js" type="text/javascript"></script>
</body>
</html>


