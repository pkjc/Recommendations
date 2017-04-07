package com.recom.services;

import com.recom.dao.DoctorDAO;
import com.recom.dao.PatientDAO;
import com.recom.model.Doctor;
import com.recom.model.Patient;

public class RegisterService {
	
	public boolean registerPatient(Patient patient) {
		
		PatientDAO patientDAO = new PatientDAO();
		Patient patientfromDB;
		
		//check if user already exists
		
		patientfromDB = patientDAO.getPatientByEmail(patient);
		
		System.out.println("patient.getEmail " + patientfromDB.getEmail());
		
		if(patientfromDB.getEmail()==null){
			patientDAO.addPatient(patient);
		}else{
			return false;
		}
		
		return true;
	}
	public boolean registerDoctor(Doctor doctor) {
		
		DoctorDAO doctorDAO = new DoctorDAO();
		doctorDAO.addDoctor(doctor);
		
		return true;
	}

}
