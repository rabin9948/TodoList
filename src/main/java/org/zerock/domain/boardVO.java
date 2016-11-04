package org.zerock.domain;

import java.text.SimpleDateFormat;
import java.util.Date;

public class boardVO {
	private int bno;
	private String title;
	private String content;
	private String writer;
	private Date regdate;
	private int uno;
	private String type;
	
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		
		SimpleDateFormat sample = new SimpleDateFormat("yyyy-MM-dd");
		
		return sample.format(regdate);
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
}
