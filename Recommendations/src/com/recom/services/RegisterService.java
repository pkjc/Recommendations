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
			return true;
		}else{
			return false;
		}
	}
	
	public boolean registerDoctor(Doctor doctor) {
		DoctorDAO doctorDAO = new DoctorDAO();
		Doctor doctorfromDB;
		
		//check if user already exists
		doctorfromDB = doctorDAO.getDoctorByEmail(doctor);
		
		System.out.println("doctor.getEmail " + doctorfromDB.getEmail());
		
		if(doctorfromDB.getEmail()==null){
			doctorDAO.addDoctor(doctor);
			return true;
		}else{
			return false;
		}
	}
}
