package com.avengers.bus.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import com.avengers.bus.daos.BusTypeDao;
import com.avengers.bus.entityModels.BusTypes;

@Component
public class BusTypeServiceImpl implements BusTypeService {

	private BusTypeDao busTypeDao;

	@Autowired
	public BusTypeServiceImpl(BusTypeDao busTypeDao) {
		this.busTypeDao = busTypeDao;
	}

	@Transactional(readOnly = true)
	public List<BusTypes> listAll() {
		return busTypeDao.getAllBusTypes();
	}

}