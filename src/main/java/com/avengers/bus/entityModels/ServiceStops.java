package com.avengers.bus.entityModels;

import java.sql.Time;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "btrs_service_stops")
public class ServiceStops {

	@Id
	@Column(name = "service_id")
	private int service_id;
	@Column(name = "stop_id")
	private String stop_id;
	@Column(name = "stop_index")
	private int stop_index;
	@Column(name = "stop_time")
	private Time stop_time;

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public String getStop_id() {
		return stop_id;
	}

	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}

	public int getStop_index() {
		return stop_index;
	}

	public void setStop_index(int stop_index) {
		this.stop_index = stop_index;
	}

	public Time getStop_time() {
		return stop_time;
	}

	public void setStop_time(Time stop_time) {
		this.stop_time = stop_time;
	}

	@Override
	public String toString() {
		return "ServiceStops [service_id=" + service_id + ", stop_id=" + stop_id + ", stop_index=" + stop_index
				+ ", stop_time=" + stop_time + "]";
	}

}