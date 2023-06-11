package com.avengers.bus.entityModels;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "btrs_schedule")
public class Schedule {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int schedule_id;
	int service_id;
	Date trip_date;
	int seats_booked;
	int collection;

	public Schedule(int schedule_id, int service_id, Date trip_date, int seats_booked, int collection) {
		super();
		this.schedule_id = schedule_id;
		this.service_id = service_id;
		this.trip_date = trip_date;
		this.seats_booked = seats_booked;
		this.collection = collection;
	}

	public int getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(int schedule_id) {
		this.schedule_id = schedule_id;
	}

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public Date getTrip_date() {
		return trip_date;
	}

	public void setTrip_date(Date trip_date) {
		this.trip_date = trip_date;
	}

	public int getSeats_booked() {
		return seats_booked;
	}

	public void setSeats_booked(int seats_booked) {
		this.seats_booked = seats_booked;
	}

	public int getCollection() {
		return collection;
	}

	public void setCollection(int collection) {
		this.collection = collection;
	}

	@Override
	public String toString() {
		return "Schedule [schedule_id=" + schedule_id + ", service_id=" + service_id + ", trip_date=" + trip_date
				+ ", seats_booked=" + seats_booked + ", collection=" + collection + "]";
	}

}