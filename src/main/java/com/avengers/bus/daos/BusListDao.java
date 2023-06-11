package com.avengers.bus.daos;

import java.util.List;

import com.avengers.bus.dtoModels.BusSearchListDto;
import com.avengers.bus.inputModels.SearchBusInput;

public interface BusListDao {

	public List<BusSearchListDto> getBusList(SearchBusInput sbi);

	public List<BusSearchListDto> getBusListAll(SearchBusInput sbi);
}