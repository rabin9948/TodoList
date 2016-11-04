package org.zerock.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MailVO;
import org.zerock.mail.sendMail;

@Controller
@RequestMapping("/Mail/*")
public class MailController {
	
	
	@RequestMapping(value="/mail", method= RequestMethod.POST )
	public String sendMailGet(MailVO vo){
		
		String name = vo.getName();
		String email = vo.getEmail();
		String comments = vo.getComments();
		
		sendMail.sendMail(name, email, comments);
		sendMail.sendMail(name, email);
		
		return "redirect:/main";
	}
	
}
