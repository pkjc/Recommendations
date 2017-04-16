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

import com.recom.dao.DoctorDAO;
import com.recom.dao.PatientDAO;
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
		if(request.getParameter("patID") != null){
			PatientDAO patDAO = new PatientDAO();
			Patient patient = new Patient();
			patient = patDAO.getPatientByID(Integer.parseInt(request.getParameter("patID")));
			
			request.getSession().setAttribute("patient", patient);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
			
		}else if(request.getParameter("docID") != null){
			DoctorDAO docDAO = new DoctorDAO();
			Doctor doctor = new Doctor();
			doctor = docDAO.getDoctorByID(Integer.parseInt(request.getParameter("docID")));
			
			request.getSession().setAttribute("doctor", doctor);
			request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
			
		}else if(request.getParameter("startTest") != null){
			PatientDAO patDAO = new PatientDAO();
			Patient patient = new Patient();
			patient = patDAO.getPatientByID(Integer.parseInt(request.getParameter("startTest")));
			
			request.getSession().setAttribute("patient", patient);
			request.getRequestDispatcher("/take-test").forward(request, response);
			
		}else{
			response.sendRedirect("login.jsp");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		LoginService loginService = new LoginService();
	
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String isDoctor = request.getParameter("isDoctor");

		if(isDoctor != null && !isDoctor.isEmpty()){
			handleDocValidation(request, response, loginService, email, password);
		}else{
			handlePatValidation(request, response, loginService, email, password);
		}
	}

	private void handlePatValidation(HttpServletRequest request, HttpServletResponse response,
			LoginService loginService, String email, String password)
					throws ServletException, IOException {
		Patient patient;
		Cookie loginCookie;
		HttpSession session = request.getSession();
		patient = new Patient("", "", email, password);
		patient = loginService.LoginPatient(patient);
		
		System.out.println("patient.getID() " + patient.getID());

		if(patient.getID()==0){
			request.setAttribute("InvalidUser", "true");
			request.getRequestDispatcher("/login.jsp").include(request, response);
		}else{
			loginCookie = new Cookie("patID", patient.getID() + "");
			loginCookie.setMaxAge(60*60*24*365);
			response.addCookie(loginCookie);
			session.setAttribute("patient", patient);
			request.setAttribute("loggedIn", true);
			response.sendRedirect("dashboard.jsp");
		}
	}

	private void handleDocValidation(HttpServletRequest request, HttpServletResponse response,
			LoginService loginService, String email, String password)
					throws ServletException, IOException {
		Doctor doctor;
		Cookie loginCookie;
		HttpSession session = request.getSession();
		System.out.println("In Doc Login");
		doctor = new Doctor("", "", email, password);
		doctor = loginService.LoginDoctor(doctor);

		System.out.println("doctor.getID() " + doctor.getID());

		if(doctor.getID()==0){
			request.setAttribute("InvalidUser", true);
			request.getRequestDispatcher("/login.jsp").include(request, response);
		}else{
			loginCookie = new Cookie("docID", doctor.getID() + "");
			loginCookie.setMaxAge(60*60*24*365);
			response.addCookie(loginCookie);
			session.setAttribute("doctor", doctor);
			request.setAttribute("loggedIn", true);
			response.sendRedirect("dashboard.jsp");
		}
	}
}
