<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script defer type="text/javascript" src="../../js/validator.js"></script>

<div class='SigningMain inner'>
<div class='Signing'>
<div class='formBoxTop'>
<div class='formBox'>
	<div class='formBtn'>
		<!-- <input type="button" value="일반회원" onclick="location.href='/member/signupformgen'" /> 
		<input type="button" value="비즈니스회원" onclick="location.href='/member/signupformbiz'" /> -->
		<h2 class="section__title mb-40">Sign Up</h2>
		<div class="container">
			<ul class="tabs">
					<li class="tab-link current" data-tab="tab-1" onclick="location.href='/member/signupform'" >일반회원</li>
					<li class="tab-link" data-tab="tab-2"onclick="location.href='/member/signupformbiz'" >비즈니스회원</li>
			</ul>

			<div id="tab-1" class="tab-content current">
				<form action="/member/signup" method="post" name="myform">
					<div>
						<span style="color:red">*필수입력사항</span>
								<hr/>
								<div class='formBoxTop'>
								<div class='formBox'>
								<div class='ValTarget'>
									<div>
										<span>아이디</span>
										<span class='redColour'>*</span>
									</div>
										<input required type="text" placeholder='아이디를 입력해주세요' id="id" name="id"/>
										<button type='button' id="idChk">중복확인</button>
										<span class="hide warning">아이디는 네글자 이상이여야 합니다.</span>
										<span class="hide success">사용할 수 있는 ID 입니다.</span>
								</div>
								
								<div class='ValTarget pwCheck'>
									<div>
									<span >비밀번호</span>
									<span class='redColour' >*</span>
									</div>
									<input required
									type="password"
									placeholder="영문,숫자,특수문자 포함 8자 이상 15자 이하"
									name="password" id="password"
									/>
									<span class="password warning"></span>
								</div>
							 
								<div class='ValTarget pwDCheck'>
								<div>
									<span>비밀번호확인</span>
									<span class='redColour'>*</span>
									</div>
									<input 
									required
									type="password"
									placeholder='비밀번호를 한번 더 입력해주세요'
									id="pwChk"/>
									<span class="password-retype warning"></span>
								</div>
								
								<div class='ValTarget nameCheck'>
								<div>
									<span>이름</span>
									<span class='redColour'>*</span>
									</div>
									<input
									required
									type="text"
									placeholder='이름을 입력해주세요'
									name="name"/>
									<span class="warning">${valid_name }</span>
								</div>
								
								<div class='ValTarget nicCheck'>
									<div>
									<span>닉네임</span>
									<span class='redColour'>*</span>
									</div>
									<input
									required
									type="text"
									placeholder='닉네임을 입력해주세요'
									id="nickname"
								name="nickname"/>
						 <button type='button' id="nicknameChk">중복확인</button>
						 <span class="warning">${valid_nickname }</span>
								</div>
								<div class='ValTarget emailCheck'>
									<div>
									<span>이메일</span>
									<span class='redColour'>*</span>
									</div>
									<input
									required
									type="text"
									placeholder='ex) multi_7@campus.com'
									name="email"/>
									<span class="warning">${valid_email }</span>
								</div>
								
								<div class='ValTarget numCheck'>
									<div>
									<span>휴대폰</span>
									<span class='redColour'>*</span>
									</div>
									<input
									required
									type="text"
									placeholder='숫자만 입력해주세요'
									name="phone"
									id="phone"/>
								
									<button type='button' id="phoneBtn">인증받기</button>
									<span class="warning phone-number">${valid_phone }</span>
								</div>
							 
								<div class='ValTarget numDCheck'>
									<div>
										<span>&nbsp;</span>
										<span class='redColour'></span>
									</div>
				
									<input type="text" id="phoneChk" placeholder='인증번호를 입력해주세요'/>
									<button type="button" id="phoneChkBtn">인증확인</button>
				
								</div>
								<div class='formBtn formBtnGender'>
									<ul>
										<li class='formBtnGender'>
											<input id="gender01" type="radio" name="gender" value="M"/>
											<label for="gender01">남자</label>
										</li>
				
										<li class='formBtnGender'>
											<input id="gender02" type="radio" name="gender" value="F"/>
											<label for="gender02">여자</label>
										</li>
									</ul>
				
								</div>
				
								<!-- 
									<div class='formDate ValTarget'>
										<div>생년월일</div>
									<div class='formDate'>
										<input type="date" name="birth" style="padding-left:80px"/>
										<span class="warning">${valid_birth }</span>
									</div>
				
									</div>
								 -->
								</div>
								</div>
							
						</div>
				<hr style="margin-top:25px; margin-bottom:10px"/>
	<div class='agreementTitle'>
		<span class='agreementAsk'>이용약관동의</span>
		<span class='redColour'>*</span>
		<label><span><input id='chkAll' type='checkbox' onclick="checkAll();"></input></span>
		<span style="font-size:larger; font-weight:bold">전체 동의합니다.</span></label>
	</div>
	<div class='agreement'>
	<div>
		<label><span><input class='chk' type='checkbox'></input></span>
		<span class='agrChk'>이용약관 동의(필수)</span></label>
	</div>
	<div>
	<label><span><input class='chk' type='checkbox'></input></span>
		<span class='agrChk'>개인정보 수집•이용 동의(필수)</span></label>
	</div>
	<div>
	<label><span><input class='chk' type='checkbox'></input></span>
		<span class='agrChk'>할인 쿠폰 등 혜택/정보 수신 동의(선택)</span></label>
	</div>
	<div>
	<label><span><input class='chk' type='checkbox'></input></span>
		<span class='agrChk'>만 14세 이상입니다.(필수)</span></label>
	</div>
	<div class='signUpBtn'>
		<!-- <button type="submit" id="signup" style="width:350px; cursor: pointer">가입하기</button> -->
					<input type="submit" value="가입하기" onClick="return check()">
		
	</div>
	</div>
				</form>


			</div>

	</div>

	
	
	<div class='signUpLink'>
			<span>
			 이미 가입하셨나요? &nbsp;
			</span>
			<a href="/member/loginform">로그인하기</a>
		</div>
</div>
	  <!-- <ul>
	    <li class='formBtnGeneral' onclick="location.href='/member/signupformgen'">
	      <label for="general">일반회원</label>
	    </li>
	
	    <li class='formBtnBiz' onclick="location.href='/member/signupformbiz'">
	      <label for="gender02">비즈니스회원</label>
	    </li>
	  </ul> -->

<!-- 		<script>
			$(document).ready(function(){
					$('ul.tabs li').click(function(){
							var tab_id = $(this).attr('data-tab');

							$('ul.tabs li').removeClass('current');
							$('.tab-content').removeClass('current');

							$(this).addClass('current');
							$("#"+tab_id).addClass('current');
					});

			});
			
		</script> -->
	</div>
</div>
</div>
</div>



<%@ include file="footer.jsp" %>