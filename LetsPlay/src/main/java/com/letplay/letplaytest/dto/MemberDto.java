package com.letplay.letplaytest.dto;

public class MemberDto {
	private String id;
	private String birth;
	private String password;
	private String name;
	private String gender;
	private String nickname;
	private String email;
	private String phone;
	private String type;
	
	public MemberDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MemberDto(String id, String birth, String password, String name, String gender, String nickname,
			String email, String phone, String type) {
		super();
		this.id = id;
		this.birth = birth;
		this.password = password;
		this.name = name;
		this.gender = gender;
		this.nickname = nickname;
		this.email = email;
		this.phone = phone;
		this.type = type;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
