package edu.fau.aclerizier.service;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fau.aclerizier.model.GeoLocation;
import edu.fau.aclerizier.util.ServiceConstants;

@Service
public class SearchService {

	@Autowired
	private GoogleAPIService _GoogleAPIService;

	public String searchHospitals(String place_type, GeoLocation locationCoordinates, String radius) {
		String searchResults = null;

		String url = ServiceConstants.GOOGLE_PLACE_WEB_SERVICE + ServiceConstants.ADD_PARAMETER
				+ ServiceConstants.GOOGLE_API_KEY + ServiceConstants.ADD_ANOTHER_PARAMETER
				+ parsePlaceType(place_type) + ServiceConstants.ADD_ANOTHER_PARAMETER
				+ parseGeoLocation(locationCoordinates) + ServiceConstants.ADD_ANOTHER_PARAMETER
				+ parseRadius(radius);

		JSONObject apiResult = new JSONObject(_GoogleAPIService.getAPIResults(url));

		searchResults = apiResult.toString();

		return searchResults;
	}

	private String parsePlaceType(String place_type) {
		StringBuilder placeType = new StringBuilder();

		placeType.append("type=");
		placeType.append(place_type);

		return placeType.toString();
	}

	private String parseGeoLocation(GeoLocation locationCoordinates) {
		StringBuilder geoLocation = new StringBuilder();

		geoLocation.append("location=");
		geoLocation.append(locationCoordinates.getLat());
		geoLocation.append(",");
		geoLocation.append(locationCoordinates.getLng());

		return geoLocation.toString();
	}

	private String parseRadius(String radius) {
		StringBuilder addRadius = new StringBuilder();

		int radiusInMeter = Integer.parseInt(radius);
		addRadius.append("radius=");
		addRadius.append(radiusInMeter * 1600);

		return addRadius.toString();
	}
}
