package com.avengers.bus.daos;

import java.util.List;

import com.avengers.bus.entityModels.BusTypes;

public interface BusTypeDao {
	public List<BusTypes> getAllBusTypes();
}