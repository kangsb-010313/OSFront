package com.javaex.vo;

public class GuestbookVO {

	//필드
	private int no;
	private String id;
	private String name;
	private String password;
	private String content;
	private String regDate;

	//생성자
	public GuestbookVO() {
		super();
	}
	
	public GuestbookVO(int no, String id, String name, String password, String content, String regDate) {
		super();
		this.no = no;
		this.id = id;
		this.name = name;
		this.password = password;
		this.content = content;
		this.regDate = regDate;
	}
	
	//메소드gs
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	//메소드-일반
	@Override
	public String toString() {
		return "GuestbookVO [no=" + no + ", name=" + name + ", password=" + password + ", content=" + content
				+ ", regDate=" + regDate + "]";
	}
	
}