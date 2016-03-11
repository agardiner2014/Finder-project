package edu.fau.aclerizier.service;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fau.aclerizier.model.GeoLocation;
import edu.fau.aclerizier.util.ServiceConstants;

@Service
public class AddressService {

	private static final Logger LOGGER = LoggerFactory.getLogger(AddressService.class);

	@Autowired
	private GoogleAPIService _GoogleAPIService;

	public GeoLocation getGeoLocationByAddr(String addr) {
		GeoLocation geoLocation = new GeoLocation();

		String url = ServiceConstants.GOOGLE_MAP_WEB_SERVICE + ServiceConstants.ADD_PARAMETER
				+ ServiceConstants.GOOGLE_API_KEY + ServiceConstants.ADD_ANOTHER_PARAMETER
				+ parseAddr(addr);

		JSONObject apiResult = new JSONObject(_GoogleAPIService.getAPIResults(url));
		JSONObject results = apiResult.getJSONArray("results").getJSONObject(0);
		JSONObject geometry = results.getJSONObject("geometry");
		JSONObject location = geometry.getJSONObject("location");
		String lng = Double.toString(location.getDouble("lng"));
		String lat = Double.toString(location.getDouble("lat"));

		geoLocation.setLat(lat);
		geoLocation.setLng(lng);

		LOGGER.debug("The geo location for [" + addr + "] is { Latitude = " + lat + ", Longitude = "
				+ lng + "}.");

		return geoLocation;
	}

	private String parseAddr(String addr) {
		addr = addr.replaceAll(" ", "+");
		addr = "address=" + addr;
		return addr;
	}
}
