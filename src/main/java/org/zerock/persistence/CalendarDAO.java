package org.zerock.persistence;

import java.util.List;

import org.zerock.domain.CalendarVO;

public interface CalendarDAO {
	public List<CalendarVO> listCalendar(String writer) throws Exception;
	
	public int modify(CalendarVO vo) throws Exception;
	
	public void submit(CalendarVO vo) throws Exception;
	
	public void deleteCalendar(int bno) throws Exception;
}
