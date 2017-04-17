package com.recom.services;

import java.util.List;

import com.recom.dao.QuestionDAO;
import com.recom.model.Question;

public class TakeTestService {

	public List<Question> createTest() {
		QuestionDAO qDAO = new QuestionDAO();
		List<Question> qList = qDAO.getAllQuestions();
		return qList;
	}

	public String evalTest(List<String> answersList) {
		String testResult = "";
		String answer1 = answersList.get(0);
	
		switch(answer1) {
		
		case "M" :
			
			System.out.println("M");
			
			break;
			
		case "F" :
			
			System.out.println("F");
			
			break;
			
		default :
			System.out.println("Invalid");
		}

		return testResult;
	}

}
