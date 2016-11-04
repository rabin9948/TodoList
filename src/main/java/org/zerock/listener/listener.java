package org.zerock.listener;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.zerock.domain.UserVO;
import org.zerock.web.HomeController;

public class listener implements HttpSessionAttributeListener {

	public static Map<String, HttpSession> sessionMap = new HashMap<String, HttpSession>();
	
	@Override//session에 정보를 담을 때 이벤트가 발생한다.
	public void attributeAdded(HttpSessionBindingEvent event) {
		HttpSession session = event.getSession();
		UserVO uservoCheck = (UserVO)session.getAttribute("userInfo");
		Iterator<String> keys = sessionMap.keySet().iterator();
		while(keys.hasNext()){
			String key = keys.next();
			HttpSession currentSession = sessionMap.get(key);
			
			UserVO uservoCurrent = (UserVO)currentSession.getAttribute("userInfo");
			
			if(uservoCheck.getUid().equals(uservoCurrent.getUid())){
				sessionMap.remove(key);
				currentSession.invalidate();
				break;
			}
		}
		
		sessionMap.put(session.getId(), session);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}
	
	
	

}
