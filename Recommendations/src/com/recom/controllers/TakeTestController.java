package com.recom.controllers;

import java.io.IOException;
import java.util.ArrayList;
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
		TakeTestService takeTestService = new TakeTestService();
		List<String> answersList = new ArrayList<String>();
		
		answersList.add(request.getParameter("q1"));
		answersList.add(request.getParameter("q2"));
		answersList.add(request.getParameter("q3"));
		answersList.add(request.getParameter("q4"));
		answersList.add(request.getParameter("q5"));
		answersList.add(request.getParameter("q6"));
		answersList.add(request.getParameter("q7"));
		answersList.add(request.getParameter("q8"));
		answersList.add(request.getParameter("q9"));
		answersList.add(request.getParameter("q9a"));
		answersList.add(request.getParameter("q10"));
		
		String testResult = takeTestService.evalTest(answersList);
		System.out.println("testResult.equals(You should get screened for breast cancer) " + testResult.equals("You should get screened for breast cancer."));
		if(testResult.equals("You should get screened for lung cancer.") || testResult.equals("You should get screened for breast cancer.")){
			request.setAttribute("testPositive", true);
		}else{
			request.setAttribute("testPositive", false);
		}
		
		request.setAttribute("testResult", testResult);
		request.getRequestDispatcher("/takeResult.jsp").forward(request, response);
		
	}
}
