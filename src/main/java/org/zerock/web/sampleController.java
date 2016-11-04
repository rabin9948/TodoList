package org.zerock.web;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.CalendarVO;
import org.zerock.domain.UserVO;
import org.zerock.service.CalendarService;

@Controller
@RequestMapping("/calendar/*")
public class sampleController {
	
	@Inject
	CalendarService service;
	
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void homeefefefGET() throws Exception {
		
	}
	
	@RequestMapping(value="/listCal",method=RequestMethod.POST)
	public @ResponseBody List<CalendarVO> homeefefefPost(Model model,HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		
		
		UserVO uvo = (UserVO) session.getAttribute("userInfo");
		
		
		List<CalendarVO> list = service.listCalendar(uvo.getUid());
		

		return list;
	}
	
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public ResponseEntity<String> modifyPost(@RequestBody CalendarVO vo) throws Exception {
		ResponseEntity<String> entity = null;
		int checkIDcount;
		System.out.println(vo.getBno());
		try {
			checkIDcount = service.modify(vo);
			if (checkIDcount == 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return entity;
	}
	
	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public ResponseEntity<String> submitPost(@RequestBody CalendarVO vo,HttpServletRequest request) throws Exception {
		ResponseEntity<String> entity = null;
		int checkIDcount;
		HttpSession session = request.getSession();
		UserVO uvo = (UserVO) session.getAttribute("userInfo");
		
		System.out.println(vo.getEnd());
		
		try {
			checkIDcount = 0;
			if (checkIDcount == 0) {
				entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
			} else {
				entity = new ResponseEntity<String>("FAIL", HttpStatus.OK);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		vo.setWriter(uvo.getUid());
		
		service.submit(vo);
		return entity;
	}
	
	
	@RequestMapping(value="/delete", method = RequestMethod.POST)
	public void deleteCalendar(@RequestBody CalendarVO vo) throws Exception{
		
		
		System.out.println(vo.getBno());
		service.deleteCalendar(vo.getBno());
		
	}

}
