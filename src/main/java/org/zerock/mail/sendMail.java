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
			messageHelper.setText(name+"�� �ȳ��ϼ���!\n"+"�����ֽ� ������ �а� �ٷ� ���� �帮�ڽ��ϴ�. �׷� ���� �Ϸ�Ǽ���~");
			messageHelper.setFrom("rabin994839@gmail.com");
			messageHelper.setSubject("�ȳ��ϼ���. �� ����Ʈ�� �湮���ֽð� ������ ���ּż� �����մϴ�.");
			
			
			mailSender.send(message);
		}catch(Exception e){e.printStackTrace();}
	}
}
