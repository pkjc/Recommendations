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
			if (request.getSession().getAttribute("patID") != null) {
				if (request.getSession().getAttribute("patient") == null) {
					System.out.println("pat is : " + request.getSession().getAttribute("patient"));
					response.sendRedirect("login?startTest=" + request.getSession().getAttribute("patID"));
				}
			} else if (request.getSession().getAttribute("docID") != null) {
				if (request.getSession().getAttribute("doctor") != null) {
					response.sendRedirect("dashboard.jsp");
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
				<h1>
					Start Test
					<c:out value="${patient.fName}" />
				</h1>
				<hr>
				<form class="form-horizontal" id="form" action="take-test"
					method="post">
					
					<div class="form-group" id="q1block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[1].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q1" name="q1">
								<option value="null">--------------</option>
								<option value="M">Male</option>
								<option value="F">Female</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q2block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[0].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q2" name="q2">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[2].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[3].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[4].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[5].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[6].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[7].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: ;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[8].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display:;" id="q3block">
						<label for="" class="col-md-5 control-label"> <c:out
								value="${questionsList[9].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="20-30">20-30</option>
								<option value="30-40">30-40</option>
								<option value="40-60">40-60</option>
								<option value="60+">More than 60</option>
							</select>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-4 col-md-8">
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
	<script>
		$('#q1').on('change', function() {
			var selection = $(this).val();
			switch (selection) {
			case "M":
				$("#q2block").show()
				break;
			case "F":
				$("#q3block").show()
				break;
			default:
				$("#q2block").hide()
			}
		});
	</script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/ie10-viewport-bug-workaround.js"></script>
	<script src="./assets/offcanvas.js" type="text/javascript"></script>
</body>
</html>