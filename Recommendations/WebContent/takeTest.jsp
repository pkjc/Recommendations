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

					<div class="form-group" style="display:;" id="q1block">
						<label for="" class="col-md-5 control-label"> 1. <c:out
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

					<div class="form-group" style="display:;" id="q2block">
						<label for="" class="col-md-5 control-label"> 2. <c:out
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

					<div class="form-group" style="display:;" id="q3block">
						<label for="" class="col-md-5 control-label"> 3. <c:out
								value="${questionsList[2].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q3" name="q3">
								<option value="null">--------------</option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q4block">
						<label for="" class="col-md-5 control-label"> 4. <c:out
								value="${questionsList[3].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q4" name="q4">
								<option value="null">--------------</option>
								<option>Cervical</option>
								<option>Skin</option>
								<option>Ovarian</option>
								<option>Testicular</option>
								<option>Lung</option>
								<option>Blatter</option>
								<option>Prostate</option>
								<option>Colon</option>
								<option>Breast</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q5block">
						<label for="" class="col-md-5 control-label"> 5. <c:out
								value="${questionsList[4].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q5" name="q5">
								<option value="null">--------------</option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q6block">
						<label for="" class="col-md-5 control-label"> 6. <c:out
								value="${questionsList[5].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q6" name="q6">
								<option value="null">--------------</option>
								<option value="one">Less than one pack a day</option>
								<option value="oneplus">One or more packs a day</option>
								<option value="twoplus">More than two packs a day</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q7block">
						<label for="" class="col-md-5 control-label"> 7. <c:out
								value="${questionsList[6].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q7" name="q7">
								<option value="null">--------------</option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q8block">
						<label for="" class="col-md-5 control-label"> 8. <c:out
								value="${questionsList[7].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q8" name="q8">
								<option value="null">--------------</option>
								<option value="5">5-10 years</option>
								<option value="10">10-15 years</option>
								<option value="15">15+ years</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q9block">
						<label for="" class="col-md-5 control-label"> 9. <c:out
								value="${questionsList[8].questionText}" />
						</label>
						<div class="col-md-7">
							<ul>
								<li>Cough that won't quit</li>
								<li>Change in cough, sound or feel</li>
								<li>Breathing changes or shortness of breath</li>
								<li>Pain in chest, pain in chest, or back</li>
								<li>Raspy, hoarse voice</li>
							</ul>
							<select class="form-control" id="q9" name="q9">
								<option value="null">--------------</option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
							</select>
						</div>
					</div>
					
					<div class="form-group" style="display: none;" id="q9ablock">
						<label for="" class="col-md-5 control-label"> 9. <c:out
								value="${questionsList[8].questionText}" />
						</label>
						<div class="col-md-7">
							<ul>
								<li>Any tenderness or lumping in breast</li>
								<li>Change in skin texture or enlargement of pores</li>
								<li>Unexplained swelling or shrinkage of breast on one side.</li>
							</ul>
							<select class="form-control" id="q9a" name="q9a">
								<option value="null">--------------</option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
							</select>
						</div>
					</div>

					<div class="form-group" style="display: none;" id="q10block">
						<label for="" class="col-md-5 control-label"> 10. <c:out
								value="${questionsList[9].questionText}" />
						</label>
						<div class="col-md-7">
							<select class="form-control" id="q10" name="q10">
								<option value="null">--------------</option>
								<option value="Y">Yes</option>
								<option value="N">No</option>
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
					$("#q5block").show()
					$("#q9block").show()
					break;
				case "F":
					$("#q9ablock").show()
					$("#q10block").show()
					$("#q5block").hide()
					$("#q9block").hide()
					break;
				default:
					$("#q4block").hide()
			}
		});
		
		$('#q3').on('change', function() {
			var selection = $(this).val();
			
			switch (selection) {
				case "Y":
					$("#q4block").show()
					break;
				default:
					$("#q4block").hide()
			}
		});
		
		$('#q5').on('change', function() {
			var selection = $(this).val();
			
			switch (selection) {
				case "Y":
					$("#q6block").show()
					break;
				case "N":
					$("#q7block").show()
					$("#q6block").hide()
					break;
				default:
					$("#q6block").hide()
			}
		});
		
		$('#q7').on('change', function() {
			var selection = $(this).val();
			
			switch (selection) {
				case "Y":
					$("#q8block").show()
					break;
				default:
					$("#q8block").hide()
			}
		});
		
		
	</script>
	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="./assets/ie10-viewport-bug-workaround.js"></script>
	<script src="./assets/offcanvas.js" type="text/javascript"></script>
</body>
</html>