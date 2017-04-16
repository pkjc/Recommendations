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

	public String evalTest() {
		
		return null;
	}

}
