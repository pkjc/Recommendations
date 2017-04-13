package com.recom.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.recom.model.Doctor;
import com.recom.model.Patient;
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
	
	public Doctor validateDoctor(Doctor doctor){

		String sql = "select * from doctor where email = ? and password = ?";

		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, doctor.getEmail());
			preparedStatement.setString(2, doctor.getPassword());

			ResultSet resultSet = preparedStatement.executeQuery();

			while(resultSet.next()) {
				doctor.setID(resultSet.getInt("id"));
				doctor.setfName(resultSet.getString("fname"));
				doctor.setlName(resultSet.getString("lname"));
				doctor.setEmail(resultSet.getString("email"));               
			}
			resultSet.close();
			preparedStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return doctor;
	}
	
	public Doctor getDoctorByEmail(Doctor doctor){

		String sql = "select * from doctor where email = ?";
		Doctor doctorFromDB = new Doctor();
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, doctor.getEmail());

			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				doctorFromDB.setID(resultSet.getInt("id"));
				doctorFromDB.setfName(resultSet.getString("fname"));
				doctorFromDB.setlName(resultSet.getString("lname"));
				doctorFromDB.setEmail(resultSet.getString("email"));               
			}
			resultSet.close();
			preparedStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return doctorFromDB;
	}

	public void updateDcotor(){}
	
	public List<Doctor> getAllDoctors(){
		String sql = "select * from doctor";
		List<Doctor> doctorsFromDB = new ArrayList<>();
		Doctor doctorFromDB = new Doctor();
		
		try {
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			ResultSet resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				doctorFromDB.setID(resultSet.getInt("id"));
				doctorFromDB.setfName(resultSet.getString("fname"));
				doctorFromDB.setlName(resultSet.getString("lname"));
				doctorFromDB.setEmail(resultSet.getString("email"));    
				
				doctorsFromDB.add(doctorFromDB);               
			}
			resultSet.close();
			preparedStatement.close();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return doctorsFromDB;
	}
	public void getDoctorByID(){}
	public void deleteDoctor(){}
}
