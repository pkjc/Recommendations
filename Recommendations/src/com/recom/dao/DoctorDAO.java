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
		String sql = "insert into doctor(fname, lname, email, password) values (?, ?, ?, ?)";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, doctor.getfName());
			preparedStatement.setString(2, doctor.getlName());
			preparedStatement.setString(3, doctor.getEmail());
			preparedStatement.setString(4, doctor.getPassword());

			int added = preparedStatement.executeUpdate();

			System.out.println("User Added!" + added);

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void updateDcotor(){}
	public void getAllDoctors(){}
	public void getDoctorByID(){}
	public void deleteDoctor(){}
}
