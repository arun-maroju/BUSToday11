package com.avengers.bus.daos;

import java.sql.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import com.avengers.bus.dtoModels.BusListRowMapper;
import com.avengers.bus.dtoModels.BusSearchListDto;
import com.avengers.bus.inputModels.SearchBusInput;

public class BusListDaoImpl implements BusListDao {

	private JdbcTemplate jdbcTemplate;
	private final String BUS_LIST_QUERY = "select  t1.service_id, t1.trip_id, t2.source, t2.destination , t2.depature , t2.arrival,t1.trip_date,\r\n"
			+ "t1.seats_available,t4.bsty_title, t4.bsty_desc\r\n" + "from btrs_services t1,\r\n"
			+ "(select ts1.trip_id as trip_id ,ts1.stop_id as source , ts2.stop_id as destination , ts1.stop_time as Depature ,\r\n"
			+ " ts2.stop_time as arrival\r\n" + "from btrs_trip_stops ts1, btrs_trip_stops ts2 \r\n"
			+ "where ts1.trip_id=ts2.trip_id and ts1.stop_id=? and ts2.stop_id=? and ts1.stop_index<ts2.stop_index ) t2,\r\n"
			+ "btrs_trips t3, btrs_bustypes t4\r\n"
			+ "where (t1.trip_id=t2.trip_id and t1.trip_id=t3.trip_id and t1.trip_date = ? \r\n"
			+ "and t3.bus_type =t4.bsty_id and t1.seats_available>0 and t1.trip_date <> now()::date and t4.bsty_id=?)\r\n"
			+ "or\r\n" + "(\r\n" + "t1.trip_id=t2.trip_id and t1.trip_id=t3.trip_id and t1.trip_date = ? \r\n"
			+ "and t3.bus_type =t4.bsty_id and t1.seats_available>0 and t1.trip_date = now()::date  and t2.depature>now()  :: time and t4.bsty_id=?\r\n"
			+ ");\r\n";

	private final String BUS_LIST_ALL_QUERY = "select  t1.service_id, t1.trip_id, t2.source, t2.destination , t2.depature , t2.arrival,t1.trip_date,\r\n"
			+ "t1.seats_available,t4.bsty_title, t4.bsty_desc\r\n" + "from btrs_services t1,\r\n"
			+ "(select ts1.trip_id as trip_id ,ts1.stop_id as source , ts2.stop_id as destination , ts1.stop_time as Depature ,\r\n"
			+ " ts2.stop_time as arrival\r\n" + "from btrs_trip_stops ts1, btrs_trip_stops ts2 \r\n"
			+ "where ts1.trip_id=ts2.trip_id and ts1.stop_id=? and ts2.stop_id=? and ts1.stop_index<ts2.stop_index ) t2,\r\n"
			+ "btrs_trips t3, btrs_bustypes t4\r\n"
			+ "where (t1.trip_id=t2.trip_id and t1.trip_id=t3.trip_id and t1.trip_date = ? \r\n"
			+ "and t3.bus_type =t4.bsty_id and t1.seats_available>0 and t1.trip_date <> now()::date )\r\n" + "or\r\n"
			+ "(\r\n" + "t1.trip_id=t2.trip_id and t1.trip_id=t3.trip_id and t1.trip_date = ? \r\n"
			+ "and t3.bus_type =t4.bsty_id and t1.seats_available>0 and t1.trip_date = now()::date  and t2.depature>now()  :: time\r\n"
			+ ");\r\n";

	public BusListDaoImpl(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public List<BusSearchListDto> getBusList(SearchBusInput sbi) {

		String date = sbi.getDate();
		Date sqlDate = Date.valueOf(date);

		System.out.println(sbi);
		return jdbcTemplate.query(BUS_LIST_QUERY, new Object[] { sbi.getFssId(), sbi.getTssId(), sqlDate,
				sbi.getTravelClass(), sqlDate, sbi.getTravelClass() }, new BusListRowMapper());
	}

	@Override
	public List<BusSearchListDto> getBusListAll(SearchBusInput sbi) {
		String date = sbi.getDate();
		Date sqlDate = Date.valueOf(date);
		return jdbcTemplate.query(BUS_LIST_ALL_QUERY, new Object[] { sbi.getFssId(), sbi.getTssId(), sqlDate, sqlDate },
				new BusListRowMapper());
	}
}