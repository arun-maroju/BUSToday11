package com.avengers.bus.daos;

import java.util.List;

import com.avengers.bus.entityModels.Stations;

public interface StationDao {
	public List<Stations> getAllStations();
}