package edu.fau.aclerizier.model;

import org.apache.commons.lang3.builder.ToStringBuilder;

public class Hospital {

	public String toString() {
		return "[" + ToStringBuilder.reflectionToString(this).split("\\[")[1];
	}
}
