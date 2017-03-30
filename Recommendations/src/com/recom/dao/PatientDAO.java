package com.recom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.recom.model.Patient;
import com.recom.utils.DatabaseUtil;

public class PatientDAO {

	private Connection connection;

	public PatientDAO() {
		connection = DatabaseUtil.getConnection();
	}

	public void addPatient(Patient patient) {
		String sql = "insert into patient(fname, lname, email, password) values (?, ?, ?, ?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, patient.getfName());
			preparedStatement.setString(2, patient.getlName());
			preparedStatement.setString(3, patient.getEmail());
			preparedStatement.setString(4, patient.getPassword());

			int added = preparedStatement.executeUpdate();

			System.out.println("User Added!" + added);
			preparedStatement.close();

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public Patient validatePatient(Patient patient){
		
		String sql = "select * from patient where email = ? and password = ?";
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, patient.getEmail());
			preparedStatement.setString(2, patient.getPassword());
			
			ResultSet resultSet = preparedStatement.executeQuery();
			
			System.out.println("ResultSet : " + resultSet);
			
			while(resultSet.next()) {
                patient.setID(resultSet.getInt("id"));
                patient.setfName(resultSet.getString("fname"));
                patient.setlName(resultSet.getString("lname"));
                patient.setEmail(resultSet.getString("email"));               
            }
            resultSet.close();
            preparedStatement.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return patient;
	}
	public void updatePatient(){}
	public void getAllPatients(){}
	public void getPatientByID(){}
	public void deletePatient(){}
}
