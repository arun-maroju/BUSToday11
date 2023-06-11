package com.avengers.bus.dtoModels;

public class SeatsBookedForOneService {

	private int service_id;
	private int seat_id;
	private boolean status;
	private String gender;

	public int getService_id() {
		return service_id;
	}

	public void setService_id(int service_id) {
		this.service_id = service_id;
	}

	public int getSeat_id() {
		return seat_id;
	}

	public void setSeat_id(int seat_id) {
		this.seat_id = seat_id;
	}



	public boolean getStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "SeatsBookedForOneService [service_id=" + service_id + ", seat_id=" + seat_id + ", status=" + status
				+ ", gender=" + gender + "]";
	}


}