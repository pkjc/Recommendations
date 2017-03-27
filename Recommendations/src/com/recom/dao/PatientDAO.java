package com.recom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.recom.model.Patient;
import com.recom.utils.DatabaseUtil;

public class PatientDAO {
	
	private Connection connection;

	public PatientDAO() {
		connection = DatabaseUtil.getConnection();
	}

	public void addPateint(Patient patient) {
		String sql = "insert into patient(email_address) values (?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			//preparedStatement.setString(1, patient.getEmail_address());
			int added = preparedStatement.executeUpdate();
			System.out.println("User Added!" + added);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updatePatient(){}
	public void getAllPatients(){}
	public void getPatientByID(){}
	public void deletePatient(){}
}
