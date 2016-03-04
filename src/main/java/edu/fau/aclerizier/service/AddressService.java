package edu.fau.aclerizier.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.fau.aclerizier.model.LocationCoordinates;
import edu.fau.aclerizier.util.ServiceConstants;

@Service
public class AddressService {

	@Autowired
	private GoogleAPIService _GoogleAPIService;

	public LocationCoordinates getLocationCoordinatesFromAddr(String addr) {
		LocationCoordinates locationCoordinates = null;
		locationCoordinates = new LocationCoordinates();

		String url = ServiceConstants.GOOGLE_MAP_WEB_SERVICE + ServiceConstants.ADD_PARAMETER
				+ ServiceConstants.GOOGLE_API_KEY + ServiceConstants.ADD_ANOTHER_PARAMETER
				+ parseAddr(addr);

		System.out.println(url);
		System.out
				.println("https://maps.googleapis.com/maps/api/geocode/json?key=AIzaSyBolZArhr97siyBnph_9QKLnlA13PMk1Co&address=70+SW+91ST+AVE+APT+207,+PLANTATION,+FL+33324");

		String apiResult = _GoogleAPIService.getAPIResults(url);
		System.out.println(apiResult);

		return locationCoordinates;
	}

	private String parseAddr(String addr) {
		addr = addr.replaceAll(" ", "+");
		addr = "address=" + addr;
		return addr;
	}
}
