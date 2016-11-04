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
		// session ��ü�� ����� �� listener Ŭ������ map���� �ش� session ��ü�� �������ش�.
		Map<String, HttpSession> sessionMap = listener.sessionMap;
		
		HttpSession session = se.getSession();
		
		sessionMap.remove(session.getId());
		
	}

}
