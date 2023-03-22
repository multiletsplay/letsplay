package com.letplay.letplaytest.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class MemberDto {
	@NotBlank(message = "아이디는 필수 입력값입니다.")
	@Size(min = 6, max = 20, message = "id는 최소 6자 , 최대 20자로 생성하세요.")
	private String id;
	private String birth;
	@NotBlank(message = "비밀번호는 필수 입력값입니다.")
	@Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{8,15}",
    message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 8자 ~ 15자의 비밀번호여야 합니다.")
	private String password;
	@NotBlank(message = "이름은 필수 입력값입니다.")
	private String name;
	private String gender;
	@NotBlank(message = "닉네임은 필수 입력값입니다.")
	private String nickname;
	@NotBlank(message = "이메일은 필수 입력값입니다.")
	@Email(message = "이메일 형식에 맞지 않습니다.")
	private String email;
	@NotBlank(message = "전화번호는 필수 입력값입니다.")
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
