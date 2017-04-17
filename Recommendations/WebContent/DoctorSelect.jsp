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
 <h1>Available Doctors</h1>
        <table border="0">
            <thead>
                <tr>
                    <th>Please pick the doctor you want. </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Please Select your Available Doctors.</td>
                </tr>
  <tr>
                    <td></td>
                    <td><form action="TimeSelect.jsp">
                   
                   
                  
                       <option>Doctor John Doe</option>
                       <input type="submit" value="Select" />
                   
                        </form></td>
                        <td></td>
                        <td><form action="TimeSelect2.jsp">
                   
                   
                   
                       <option>Doctor Bob Jones</option>
                       <input type="submit" value="Select" />
                   
                        </form></td>
                        <td></td>
                         <td><form action="TimeSelect3.jsp">
                   
                  
                   
                       <option>Doctor Dave Holms</option>
                       <input type="submit" value="Select" />
                   
                        </form></td>
                        
  </tr>
                
                

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
