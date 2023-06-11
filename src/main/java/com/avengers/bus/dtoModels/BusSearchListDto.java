package com.avengers.bus.dtoModels;

import java.sql.Date;
import java.sql.Time;

public class BusSearchListDto {

	private int service_id;
	private int trip_id;
	private String source;
	private String destination;
	private Date trip_date;
	private Time depature;
	private Time arrival;
	private String bsty_title;
	private int available_seats;

	public BusSearchListDto() {

	}

	protected BusSearchListDto(int service_id, int trip_id, String source, String destination, Date trip_date,
			Time depature, Time arrival, String bsty_title, int available_seats) {
		super();
		this.service_id = service_id;
		this.trip_id = trip_id;
		this.source = source;
		this.destination = destination;
		this.trip_date = trip_date;
		this.depature = depature;
		this.arrival = arrival;
		this.bsty_title = bsty_title;
		this.available_seats = available_seats;
	}

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public int getTrip_id() {
		return trip_id;
	}

	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public Date getTrip_date() {
		return trip_date;
	}

	public void setTrip_date(Date trip_date) {
		this.trip_date = trip_date;
	}

	public Time getDepature() {
		return depature;
	}

	public void setDepature(Time depature) {
		this.depature = depature;
	}

	public Time getArrival() {
		return arrival;
	}

	public void setArrival(Time arrival) {
		this.arrival = arrival;
	}

	public String getBsty_title() {
		return bsty_title;
	}

	public void setBsty_title(String bsty_title) {
		this.bsty_title = bsty_title;
	}

	public int getAvailable_seats() {
		return available_seats;
	}

	public void setAvailable_seats(int available_seats) {
		this.available_seats = available_seats;
	}

	@Override
	public String toString() {
		return "BusSearchListDto [service_id=" + service_id + ", trip_id=" + trip_id + ", source=" + source
				+ ", destination=" + destination + ", trip_date=" + trip_date + ", depature=" + depature + ", arrival="
				+ arrival + ", bsty_title=" + bsty_title + ", available_seats=" + available_seats + "]";
	}

	

}