package com.avengers.bus.daos;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Component;

import com.avengers.bus.entityModels.Stations;

@Component
public class StationDaoImpl implements StationDao {
	@PersistenceContext
	private EntityManager em;

	public List<Stations> getAllStations() {
		return em.createQuery("SELECT e FROM Stations e").getResultList();

	}
}