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
 * RegisterController
 */
@WebServlet(description = "New account creation entry point", urlPatterns = { "/register" })
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		response.sendRedirect("register.jsp");
	}


	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		RegisterService registerService = new RegisterService();
		boolean isRegSuccessful = false;
		
		isRegSuccessful = handleRegistration(request, registerService);
		
		handleRedirection(request, response, isRegSuccessful);
	}

	//Passes info to model to complete business logic
	private boolean handleRegistration(HttpServletRequest request, RegisterService registerService) {
		Patient patient;
		Doctor doctor;
		boolean isRegSuccessful;
		
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String isDoctor = request.getParameter("isDoctor");
		
		if(isDoctor != null && !isDoctor.isEmpty()){
			System.out.println();
			doctor = new Doctor(fName, lName, email, password);
			isRegSuccessful = registerService.registerDoctor(doctor);
		}else{
			System.out.println("You Entered : "+ fName + " " + lName + " " + email + " " + password);
			patient = new Patient(fName, lName, email, password);
			isRegSuccessful = registerService.registerPatient(patient);
		}
		return isRegSuccessful;
	}
	
	//Redirects user after registration is successful or failed
	private void handleRedirection(HttpServletRequest request, HttpServletResponse response, boolean isRegSuccessful)
			throws ServletException, IOException {
		request.setAttribute("isRegSuccessful", isRegSuccessful);
		if(!isRegSuccessful){
			request.getRequestDispatcher("/register.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}
	}
}
