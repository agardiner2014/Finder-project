package edu.fau.aclerizier.model;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class GeoLocation {

	private String lat;
	private String lng;

	public String getLat() {
		return lat;
	}

	public void setLat(String lat) {
		this.lat = lat;
	}

	public String getLng() {
		return lng;
	}

	public void setLng(String lng) {
		this.lng = lng;
	}

	public String toString() {
		return "[" + ToStringBuilder.reflectionToString(this).split("\\[")[1];
	}
}
