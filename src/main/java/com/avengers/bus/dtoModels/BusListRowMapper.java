package com.avengers.bus.dtoModels;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BusListRowMapper implements RowMapper<BusSearchListDto> {

	@Override
	public BusSearchListDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		BusSearchListDto bus = new BusSearchListDto();

		bus.setService_id(rs.getInt("service_id"));
		bus.setTrip_id(rs.getInt("trip_id"));
		bus.setSource(rs.getString("source"));
		bus.setDestination(rs.getString("destination"));
		bus.setTrip_date(rs.getDate("trip_date"));
		bus.setDepature(rs.getTime("depature"));
		bus.setArrival(rs.getTime("arrival"));
		bus.setBsty_title(rs.getString("bsty_title"));
		bus.setAvailable_seats(rs.getInt("seats_available"));
		return bus;
	}

}