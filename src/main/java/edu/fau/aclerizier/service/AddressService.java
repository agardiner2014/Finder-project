package edu.fau.aclerizier.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fau.aclerizier.model.LocationCoordinates;
import edu.fau.aclerizier.util.ServiceConstants;

@Service
public class AddressService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AddressService.class);

	@Autowired
	private GoogleAPIService _GoogleAPIService;

	public LocationCoordinates getLocationCoordinatesFromAddr(String addr) {
		LocationCoordinates locationCoordinates = null;
		locationCoordinates = new LocationCoordinates();

		String url = ServiceConstants.GOOGLE_MAP_WEB_SERVICE + ServiceConstants.ADD_PARAMETER
				+ ServiceConstants.GOOGLE_API_KEY + ServiceConstants.ADD_ANOTHER_PARAMETER
				+ parseAddr(addr);

		String apiResult = _GoogleAPIService.getAPIResults(url);

		LOGGER.debug("Google API Result: {}", apiResult);

		String[] cutHead = apiResult.split("\"location\"");
		String[] cutTail = cutHead[1].split("\"location_type\"");

		System.out.println("&&&&&&&&&&&&&&&&&&&&&&&&" + cutTail[0]);

		String coordinates = cutTail[0].replaceAll(" ", "");
		System.out.println("^^^^^^^^^^^^^^^^^" + coordinates);

		locationCoordinates.setLat(coordinates.split("\"lat\":")[1].split(",\"lng\"")[0]);

		locationCoordinates.setLng(coordinates.split(",\"lng\":")[1].split("}")[0]);

		System.out.println("%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%" + locationCoordinates.toString());
		return locationCoordinates;
	}

	private String parseAddr(String addr) {
		addr = addr.replaceAll(" ", "+");
		addr = "address=" + addr;
		return addr;
	}
}
