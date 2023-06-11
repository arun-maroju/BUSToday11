package com.avengers.bus.entityModels;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "btrs_buses")
public class Bus {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int bus_id;
	String regno;
	int type_id;
	int bus_no_seats;
	String bus_status;

	public Bus(int bus_id, String regno, int type_id, int bus_no_seats, String bus_status) {
		super();
		this.bus_id = bus_id;
		this.regno = regno;
		this.type_id = type_id;
		this.bus_no_seats = bus_no_seats;
		this.bus_status = bus_status;
	}

	public int getBus_id() {
		return bus_id;
	}

	public void setBus_id(int bus_id) {
		this.bus_id = bus_id;
	}

	public String getRegno() {
		return regno;
	}

	public void setRegno(String regno) {
		this.regno = regno;
	}

	public int getType_id() {
		return type_id;
	}

	public void setType_id(int type_id) {
		this.type_id = type_id;
	}

	public int getBus_no_seats() {
		return bus_no_seats;
	}

	public void setBus_no_seats(int bus_no_seats) {
		this.bus_no_seats = bus_no_seats;
	}

	public String getBus_status() {
		return bus_status;
	}

	public void setBus_status(String bus_status) {
		this.bus_status = bus_status;
	}

	@Override
	public String toString() {
		return "Bus [bus_id=" + bus_id + ", regno=" + regno + ", type_id=" + type_id + ", bus_no_seats=" + bus_no_seats
				+ ", bus_status=" + bus_status + "]";
	}

}