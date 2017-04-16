package com.recom.controllers;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.recom.model.Question;

import com.recom.services.TakeTestService;

/**
 * Servlet implementation class TakeTestController
 */
@WebServlet("/take-test")
public class TakeTestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		TakeTestService takeTestService = new TakeTestService();
		List<Question> questionsList = takeTestService.createTest();
		
		request.setAttribute("questionsList", questionsList);
		request.getRequestDispatcher("/takeTest.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
	}
}
