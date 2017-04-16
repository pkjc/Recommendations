<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.recom.utils.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<jsp:include page="head.jsp" />
<body>
	<%
	boolean cookieFound = new CookieChecker().checkCookie(request);
	if (cookieFound) {
		if(request.getSession().getAttribute("patID") != null){
			if(request.getSession().getAttribute("patient") == null){
				System.out.println("pat is : " + request.getSession().getAttribute("patient"));
				response.sendRedirect("login?startTest=" + request.getSession().getAttribute("patID"));
			}
		}else if(request.getSession().getAttribute("docID") != null){
			if(request.getSession().getAttribute("doctor") == null){
				response.sendRedirect("login?docID=" + request.getSession().getAttribute("docID"));		
			}
		}
	} else {
		session.setAttribute("plsLogin", true);
		response.sendRedirect("login.jsp");
	}
%>
	<jsp:include page="navigation.jsp" />
	<div class="container">
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8" role="">
				<h1>Start Test <c:out value="${patient.fName}"/></h1>
				<hr>
				<form class="form-horizontal" id="form" action="takeTest" method="post">
					<div class="form-group">
						<label for="" class="col-md-3 control-label"> <c:out
								value="${questionsList[0].questionText}" />
						</label>
						<div class="col-md-9">
							<input type="text" class="form-control" id="q1" name="q1"
								placeholder="">
						</div>
					</div>
					<div class="form-group">
						<label for="" class="col-md-3 control-label"> <c:out
								value="${questionsList[1].questionText}" />
						</label>
						<div class="col-md-9">
							<input type="checkbox" class="form-control" id="q2" name="q2"
								placeholder="">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-3 col-md-12">
							<button type="submit" class="btn btn-info">Submit</button>
						</div>
					</div>
				</form>
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