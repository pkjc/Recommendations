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
		int count = 0;
		int i = 0;
		for (String string : answersList) {
			System.out.println("answersList.get() " + i++ + " ==> " + string + "\n");
		}
		switch(answersList.get(0)) {

		case "M" :
			
			if(answersList.get(1).equals("40-60")){
				count++;
			}
			
			if(answersList.get(2).equals("Y")){
				count++;
			}
			
			if(answersList.get(4).equals("Y")){
				count++;
			}else if(answersList.get(4).equals("N")){
				if(answersList.get(6).equals("Y")){
					count++;
				}
			}
			
			if(answersList.get(8).equals("Y")){
				count++;
			}
			
			System.out.println(" count " + count);
			
			if(count >=4){
				return "You should get screened for lung cancer.";
			}else{
				return "You do not need to get screened for lung cancer.";
			}
			
		case "F" :

			if(answersList.get(1).equals("40-60")){
				count++;
			}
			
			if(answersList.get(2).equals("Y")){
				count++;
			}
			
			if(answersList.get(9).equals("Y")){
				count++;
			}
			
			if(answersList.get(10).equals("Y")){
				count++;
			}
			
			System.out.println("count " + count);
			
			if(count >= 4){
				return "You should get screened for breast cancer.";
			}else{
				return "You do not need to get screened for breast cancer.";
			}

		default :
			System.out.println("Invalid");
		}
		
		return null;
	}
}
