package org.zerock.persistence;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.zerock.domain.CalendarVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "org.zerock.mapper.CalendarMapper";
	
	public List<CalendarVO> listCalendar(String writer) throws Exception{
	
		return session.selectList(namespace+".listCalendar",writer);
	}
	
	
	public int modify(CalendarVO vo) throws Exception{
		
		return session.update(namespace+".modify", vo);
	}
	
	
	public void submit(CalendarVO vo) throws Exception{
		session.insert(namespace+".submit", vo);
	}
	
	public void deleteCalendar(int bno) throws Exception{
		session.delete(namespace+".deleteCalendar", bno);
	}
}
