package org.zerock.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.zerock.domain.CalendarVO;
import org.zerock.persistence.CalendarDAO;

@Service
public class CalendarServiceImpl implements CalendarService {
	
	@Inject
	CalendarDAO dao;
	
	@Override
	public List<CalendarVO> listCalendar(String writer) throws Exception {
		
		return dao.listCalendar(writer);
	}
	
	@Override
	public int modify(CalendarVO vo) throws Exception{
		
		return dao.modify(vo);
	}
	
	@Override
	public void submit(CalendarVO vo) throws Exception{
		dao.submit(vo);
	}
	
	@Override
	public void deleteCalendar(int bno) throws Exception{
		dao.deleteCalendar(bno);
	}

}
