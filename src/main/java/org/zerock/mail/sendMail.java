package org.zerock.mail;

import java.util.Properties;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

public class sendMail {
	
	public static void sendMail(String name,String email,String comments){
		try{
			
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			mailSender.setHost("smtp.gmail.com");
			
			mailSender.setPort(587);
			mailSender.setProtocol("smtp");
			mailSender.setUsername("rabin994839@gmail.com");
			mailSender.setPassword("whdxkr66");
			
			Properties properties = new Properties();
			properties.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(properties);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo("rabin9948@naver.com");
			messageHelper.setText(comments);
			messageHelper.setFrom("rabin994839@gmail.com");
			messageHelper.setSubject("TO DO LIST site contact: " + name + "/ email : " + email);
			
			
			mailSender.send(message);
		}catch(Exception e){e.printStackTrace();}
	}
	
	public static void sendMail(String name,String email){
		try{
			
			JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
			mailSender.setHost("smtp.gmail.com");
			
			mailSender.setPort(587);
			mailSender.setProtocol("smtp");
			mailSender.setUsername("rabin994839@gmail.com");
			mailSender.setPassword("whdxkr66");
			
			Properties properties = new Properties();
			properties.setProperty("mail.smtp.starttls.enable", "true");
			mailSender.setJavaMailProperties(properties);
			
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setTo(email);
			messageHelper.setText(name+"님 안녕하세요!\n"+"보내주신 내용을 읽고 바로 답장 드리겠습니다. 그럼 좋은 하루되세요~");
			messageHelper.setFrom("rabin994839@gmail.com");
			messageHelper.setSubject("안녕하세요. 제 사이트를 방문해주시고 컨텍을 해주셔서 감사합니다.");
			
			
			mailSender.send(message);
		}catch(Exception e){e.printStackTrace();}
	}
}
