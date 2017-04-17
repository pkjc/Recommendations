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
 <h1>Select a Day and Time</h1>
        <select name="Day">
    <option value = "Monday">Monday</option>
    <option value = "Tuesday">Tuesday</option>
    <option value = "Wednesday">Wednesday</option>
    <option value = "Thursday">Thursday</option>
    <option value = "Friday">Friday</option>
    <option value = "Saturday">Saturday</option>
    <option value = "Sunday">Sunday</option>
</select>

<select name="Time">
    <option value = "9">9 - 10 am</option>
    <option value = "10">10 - 11 am</option>
    <option value = "11">11 am - 12 pm</option>
    <option value = "12">12 - 1 pm</option>
    <option value = "1">1 - 2 pm</option>
    <option value = "2">2 - 3 pm</option>
    <option value = "3">3 - 4 pm</option>
</select>

<input type="submit" value="Submit" name="submit" />
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

