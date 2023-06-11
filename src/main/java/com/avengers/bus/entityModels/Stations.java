package com.avengers.bus.entityModels;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "btrs_stops")
public class Stations {
	@Id
	@Column(name = "stop_id")
	private String stop_id;
	@Column(name = "stop_name")
	private String stop_name;

	public String getStop_id() {
		return stop_id;
	}

	public void setStop_id(String stop_id) {
		this.stop_id = stop_id;
	}

	public String getStop_name() {
		return stop_name;
	}

	public void setStop_name(String stop_name) {
		this.stop_name = stop_name;
	}

	@Override
	public String toString() {
		return "Stations [stop_id=" + stop_id + ", stop_name=" + stop_name + "]";
	}

}
