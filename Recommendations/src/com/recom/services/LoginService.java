package com.recom.services;

import com.recom.dao.DoctorDAO;
import com.recom.dao.PatientDAO;
import com.recom.model.Doctor;
import com.recom.model.Patient;

public class LoginService {
	
	public Patient LoginPatient(Patient patient) {
		
		PatientDAO patientDAO = new PatientDAO();
		patient = patientDAO.validatePatient(patient);
		
		return patient;
	}
	public Doctor LoginDoctor(Doctor doctor) {
		
		DoctorDAO doctorDAO = new DoctorDAO();
		doctor = doctorDAO.validateDoctor(doctor);
		
		return doctor;
	}

}
