package com.recom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recom.model.Question;
import com.recom.utils.DatabaseUtil;

public class QuestionDAO {
	
	private Connection connection;
	
	public QuestionDAO() {
		connection = DatabaseUtil.getConnection();
	}
	
	public List<Question> getAllQuestions() {
		String sql = "select * from questions";
		List<Question> questionsFromDB = new ArrayList<>();

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				Question questionFromDB = new Question();
				questionFromDB.setQuestionID(resultSet.getInt("QuestionID"));
				questionFromDB.setQuestionText(resultSet.getString("QuestionText"));

				questionsFromDB.add(questionFromDB);             
			}
			resultSet.close();
			preparedStatement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
		return questionsFromDB;
	}
}
