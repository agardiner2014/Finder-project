package edu.fau.aclerizier.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fau.aclerizier.model.Hospital;
import edu.fau.aclerizier.model.LocationCoordinates;

@Service
public class SearchService {

	@Autowired
	private GoogleAPIService _GoogleAPIService;

	public List<Hospital> searchHospitals(LocationCoordinates locationCoordinates) {

		return null;
	}
}
