package org.zerock.listener;

import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class listenerInvalidate implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		// session 객체가 사라질 때 listener 클래스의 map에서 해당 session 객체를 제거해준다.
		Map<String, HttpSession> sessionMap = listener.sessionMap;
		
		HttpSession session = se.getSession();
		
		sessionMap.remove(session.getId());
		
	}

}
