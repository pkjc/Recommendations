package com.recom.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		Patient patient;
		Doctor doctor;
		
		String fName = request.getParameter("fName");
		String lName = request.getParameter("lName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String isDoctor = request.getParameter("isDoctor");
		
		if(isDoctor != null && !isDoctor.isEmpty()){
			System.out.println();
			doctor = new Doctor(fName, lName, email, password);
			registerService.registerDoctor(doctor);
		}else{
			System.out.println("You Entered : "+ fName + " " + lName + " " + email + " " + password);
			patient = new Patient(fName, lName, email, password);
			registerService.registerPatient(patient);
		}
		request.setAttribute("newReg", request.getParameter("newReg"));
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/login.jsp");
		requestDispatcher.forward(request, response);
	}
}
