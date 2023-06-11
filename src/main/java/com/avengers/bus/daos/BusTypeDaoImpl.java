package com.avengers.bus.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.avengers.bus.entityModels.BusTypes;

@Component
public class BusTypeDaoImpl implements BusTypeDao {
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<BusTypes> getAllBusTypes() {
		return em.createQuery("SELECT bt FROM BusTypes bt").getResultList();
	}

}