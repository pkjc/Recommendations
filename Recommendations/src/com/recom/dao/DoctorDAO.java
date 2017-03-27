package com.recom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.recom.model.Doctor;
import com.recom.utils.DatabaseUtil;

public class DoctorDAO {
	private Connection connection;

	public DoctorDAO() {
		connection = DatabaseUtil.getConnection();
	}

	public void addDoctor(Doctor doctor) {
		String sql = "insert into doctor(email_address) values (?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			//preparedStatement.setString(1, patient.getEmail_address());
			int added = preparedStatement.executeUpdate();
			System.out.println("Doctor Added!" + added);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateDcotor(){}
	public void getAllDoctors(){}
	public void getDoctorByID(){}
	public void deleteDoctor(){}
}
