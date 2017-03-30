package com.recom.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.recom.model.Doctor;
import com.recom.model.Patient;
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
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RegisterService registerService = new RegisterService();
		Patient patient;
		Doctor doctor;
		HttpSession session = request.getSession();
	
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String isDoctor = request.getParameter("isDoctor");
        
        patient = new Patient("", "", email, password);
		
		if(isDoctor != null && !isDoctor.isEmpty()){
			doctor = new Doctor("", "", email, password);
			registerService.registerDoctor(doctor);
		}else{
			registerService.registerPatient(patient);
		}
		
        session.setAttribute("patient", patient);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/dashboard.jsp");
		requestDispatcher.forward(request, response);
	}

}
