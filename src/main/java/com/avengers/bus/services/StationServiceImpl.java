package com.avengers.bus.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.avengers.bus.daos.StationDao;
import com.avengers.bus.entityModels.Stations;

@Component
public class StationServiceImpl implements StationService

{
	private StationDao stationDao;

	@Autowired
	public StationServiceImpl(StationDao stationDao) {
		this.stationDao = stationDao;
	}

	@Transactional(readOnly = true)
	public List<Stations> listAll() {
		return stationDao.getAllStations();
	}

}