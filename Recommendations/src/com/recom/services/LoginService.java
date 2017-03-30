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
	public boolean LoginDoctor(Doctor doctor) {
		
		DoctorDAO doctorDAO = new DoctorDAO();
		doctorDAO.addDoctor(doctor);
		
		return true;
	}

}
