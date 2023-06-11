package com.avengers.bus.controllers;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.avengers.bus.inputModels.Passengers;
@Controller
public class PassengerPreviewController 
{
		
	@RequestMapping(value="passengerPreview",method=RequestMethod.POST)
	public String getPassengerDetails(@RequestParam("passenger_id[]") String[] passengerIds,
			@RequestParam("seat_number[]") int[] passengerSeatNos,
		      @RequestParam("passenger_name[]") String[] passengerNames,
		      @RequestParam("passenger_age[]") int[] passengerAges,
		      @RequestParam("passenger_gender[]") String[] passengerGenders)
	{
		
		
		System.out.println(passengerIds.length);
		System.out.println(passengerSeatNos.length);
		System.out.println(passengerNames.length);
		System.out.println(passengerAges.length);
		System.out.println(passengerGenders.length);
		


		 
		 for (int i = 0; i < passengerIds.length; i++) {
	            System.out.println("Passenger ID: " + passengerIds[i]);
	            System.out.println("Seat ID: " + passengerSeatNos[i]);
	            System.out.println("Passenger Name: " + passengerNames[i]);
	            System.out.println("Passenger Age: " + passengerAges[i]);
	            System.out.println("Passenger Gender: " + passengerGenders[i]);
	            System.out.println("-------------------------");
	        }
		 
		 
		 List<Passengers> passengersList=new ArrayList<Passengers>();
		 
		 for (int i = 0; i < passengerIds.length; i++) {
	            Passengers p=new Passengers();
	            p.setPassenger_id(passengerIds[i]);
	            p.setSeat_id(passengerSeatNos[i]);
	            p.setPassenger_name(passengerNames[i]);
	            p.setPassenger_age(passengerAges[i]);
	            p.setPassenger_gender(passengerGenders[i]);
	            passengersList.add(p);
	            System.out.println("-------------------------");
	        }
		 
		for(Passengers p:passengersList)
		{
			System.out.println(p);
		}
		
		
		
		
		System.out.println("IN passenger preview controller..");
		return "preview";
	}
}
