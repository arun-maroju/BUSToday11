package com.avengers.bus.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.avengers.bus.entityModels.BusTypes;
import com.avengers.bus.entityModels.Stations;
import com.avengers.bus.services.BusTypeService;
import com.avengers.bus.services.StationService;

@Controller
public class HomeController {

	private StationService stationService;
	private BusTypeService busTypeService;

	@Autowired
	public HomeController(StationService stationService, BusTypeService busTypeService) {
		this.stationService = stationService;
		this.busTypeService = busTypeService;
	}

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String firstPage(Model model) {
		//
		// ModelAndView mav = new ModelAndView();
		// mav.setViewName("home");
		System.out.println("IM in firstPage method..");

		List<Stations> stationsList = stationService.listAll();
		List<BusTypes> busTypesList = busTypeService.listAll();
		// set it to the model
		model.addAttribute("stationList", stationsList);
		model.addAttribute("busTypeList", busTypesList);
		return "home";

	}

	@RequestMapping(value = "/stationList", method = RequestMethod.GET)
	public String getAllStations(Model model) {
		System.out.println("Stations List JSP Requested");

		// get all employees from DAO
		List<Stations> stationsList = stationService.listAll();

		// set it to the model
		model.addAttribute("stationList", stationsList);

		// call the view
		return "stationList";
	}

}