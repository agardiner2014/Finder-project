package edu.fau.aclerizier.controller;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import java.util.Locale;
import java.util.Properties;

import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.fau.aclerizier.model.Hospital;
import edu.fau.aclerizier.model.LocationCoordinates;
import edu.fau.aclerizier.service.AddressService;
import edu.fau.aclerizier.service.SearchService;

@Controller
public class HospitalFinderController {

	private static final Logger LOGGER = LoggerFactory.getLogger(HospitalFinderController.class);

	@Autowired
	private AddressService _AddressService;
	@Autowired
	private SearchService _SearchService;

	private Properties metadataProperties;

	@Autowired
	public void setServletContext(ServletContext servletContext) throws IOException {
		InputStream inputStream = servletContext.getResourceAsStream("/META-INF/MANIFEST.MF");
		metadataProperties = new Properties();
		metadataProperties.load(inputStream);
	}

	@RequestMapping(value = "/version", method = RequestMethod.GET)
	@ResponseBody
	public Properties getCodeVersion() throws IOException {
		LOGGER.debug("Manifest is [{}]", metadataProperties.toString());
		return metadataProperties;
	}

	@RequestMapping(value = { "", "/", "home", "index" }, method = RequestMethod.GET)
	public String home(Locale locale, Model model) {

		LOGGER.info("Welcome to Amos Hispital Finder!");

		return "hospital_finder";
	}

	@RequestMapping(value = "/hospital_by_addr", method = RequestMethod.GET)
	@ResponseBody
	public List<Hospital> getHospitalsByAddress(@RequestParam(value = "addr") String addr) {

		LOGGER.info("Getting hospitals around {}.", addr);

		List<Hospital> hospitalList = null;
		LocationCoordinates locationCoordinates = null;

		locationCoordinates = _AddressService.getLocationCoordinatesFromAddr(addr);
		LOGGER.debug("The Coordinates of {} is {}.", addr, locationCoordinates.toString());

		hospitalList = _SearchService.searchHospitals(locationCoordinates);

		return hospitalList;
	}
}
