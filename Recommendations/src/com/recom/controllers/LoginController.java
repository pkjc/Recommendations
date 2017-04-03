package com.recom.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.recom.model.Doctor;
import com.recom.model.Patient;
import com.recom.services.LoginService;
import com.recom.services.RegisterService;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		LoginService loginService = new LoginService();
		Patient patient;
		Doctor doctor;
		HttpSession session = request.getSession();
		Cookie loginCookie;
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String isDoctor = request.getParameter("isDoctor");

		patient = new Patient("", "", email, password);
		doctor = new Doctor("", "", email, password);

		if(isDoctor != null && !isDoctor.isEmpty()){
			/*patient = loginService.LoginPatient(patient);
			session.setAttribute("patient", patient);
			
			if(patient.getID()==0){
				requestDispatcher = request.getRequestDispatcher("/login.jsp");
			}else{
				requestDispatcher = request.getRequestDispatcher("/dashboard.jsp");
			}*/
		}else{
			patient = loginService.LoginPatient(patient);
			session.setAttribute("patient", patient);
			System.out.println("patient.getID() " + patient.getID());
			if(patient.getID()==0){
				boolean invUser = true;
				request.setAttribute("InvUser", "true");
				request.getRequestDispatcher("/login.jsp").include(request, response);
			}else{
				loginCookie = new Cookie("patID", patient.getID() + "");
				loginCookie.setMaxAge(60*60*24*365);
				response.addCookie(loginCookie);
				request.getRequestDispatcher("/dashboard.jsp").include(request, response);
			}
		}
	}
}
