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
 <h1>Available Times</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>Please pick the time your are free to see patients. </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Please Select your Available Times.</td>
                </tr>
  <tr>
                    <td><form action="Confirmation.jsp">
                   <strong>Pick the days available:</strong>
                   
                   <input type="checkbox" name="Day" value="0" checked="checked" />
                       <option>Monday</option>
                   <input type="checkbox" name="Day" value="1" checked="checked" />
                       <option>Tuesday</option>
                   <input type="checkbox" name="Day" value="2" checked="checked" />
                       <option>Wednesday</option>
                   <input type="checkbox" name="Day" value="3" checked="checked" />
                       <option>Thursday</option>
                   <input type="checkbox" name="Day" value="4" checked="checked" />
                       <option>Friday</option>
                   <input type="checkbox" name="Day" value="5" checked="checked" />
                       <option>Saturday</option>
                   <input type="checkbox" name="Day" value="6" checked="checked" />
                       <option>Sunday</option>
                   
                        </form></td>
                        
  </tr>
                
                <tr><td>  <form action="Confirmation.jsp">
                            <strong>Pick the time available:</strong>
                   <input type="checkbox" name="Time" value="0" checked="checked" />
                       <option>8am-9am</option>
                   <input type="checkbox" name="Time" value="1" checked="checked" />
                       <option>9am-10am</option>
                   <input type="checkbox" name="Time" value="2" checked="checked" />
                       <option>10am-11am</option>
                   <input type="checkbox" name="Time" value="3" checked="checked" />
                       <option>11am-12pm</option>
                   <input type="checkbox" name="Time" value="4" checked="checked" />
                       <option>12pm-1pm</option>
                   <input type="checkbox" name="Time" value="5" checked="checked" />
                       <option>1pm-2pm</option>
                   <input type="checkbox" name="Time" value="6" checked="checked" />
                       <option>2pm-3pm</option>
                    <input type="checkbox" name="Time" value="7" checked="checked" />
                       <option>3pm-4pm</option>
                   <input type="checkbox" name="Time" value="8" checked="checked" />
                       <option>4pm-5pm</option>    
                        <tr><td><input type="submit" value="Submit"
                         /> 
                    </td></tr>    
                        </form></td></tr>

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

