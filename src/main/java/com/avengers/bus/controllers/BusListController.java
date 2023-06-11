package com.avengers.bus.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.avengers.bus.daos.BusListDao;
import com.avengers.bus.dtoModels.BusSearchListDto;
import com.avengers.bus.inputModels.SearchBusInput;

@Controller
public class BusListController {

	private BusListDao busListDao;

	@Autowired
	public BusListController(BusListDao busListDao) {
		this.busListDao = busListDao;
	}

	@RequestMapping(value = "/getBusList", method = RequestMethod.POST)
	public ModelAndView getBusses(SearchBusInput sbi) {
		System.out.println("Hello Im workingl." + sbi);
		// System.out.println(fssId);
		// System.out.println(s + " " + travelClass + " " + date);
		List<BusSearchListDto> buses;
		if (sbi.getTravelClass() > 0) {
			buses = busListDao.getBusList(sbi);
		}

		else {
			buses = busListDao.getBusListAll(sbi);
		}

		for (BusSearchListDto bus : buses) {
			System.out.println(bus);
		}

		ModelAndView mav = new ModelAndView("busList");
		mav.addObject("buses", buses);
		// BusSearchListDto bsl = buses.get(1);
		// System.out.println(bsl);

		return mav;
	}

}