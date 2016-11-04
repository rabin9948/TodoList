package org.zerock.web;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.CalendarVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class MyBatisTest {
	
	@Inject
	private SqlSessionFactory sqlFactory;
	
	SqlSession session;
	
	private static String namespace = "org.zerock.mapper.CalendarMapper";
	
	@Test
	public void testFactory(){
		System.out.println(sqlFactory);
	}
	
	@Test
	public void testSession() throws Exception{
		try{
			session = sqlFactory.openSession();
			System.out.println(session);
		}catch(Exception e){e.printStackTrace();}
	}
	
	
	@Test
	public void testList() throws Exception{
		session = sqlFactory.openSession();
		List<CalendarVO> list = session.selectList(namespace+".listCalendar");
	}
}
