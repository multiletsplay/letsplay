<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script type="text/javascript">
	$(document).ready(function(){
		$("#loginChk").hide();
	});
	
	function login(){
		let id = $("#id").val().trim();
		let pw = $("#password").val().trim();
		
		let loginVal = {
			"id":id,	
			"password":pw
		};
		
		if(id==null || id=="" || pw==null || pw==""){
			alert("id 및 pw를 확인해 주세요");
		}else{
			$.ajax({
				url:"/member/login",
				type:"post",
				data:JSON.stringify(loginVal),	
				contentType:"application/json",	
				dataType:"json", 
				success:function(msg){
					console.log(msg);
					if(msg.check==true){
						alert("성공적으로 로그인되었습니다.");
						location.href="/";
					}else{
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW가 잘못 되었습니다.")
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
		}
		
	}
</script>

<!-- <h1>로그인</h1>
<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요">
<button type="button" id="login" onclick="login();">로그인</button>
<button type="button" onclick="location.href='/member/signupform'">회원가입</button>
<div>
	<a href="/member/findidform">아이디 찾기</a> &nbsp;&nbsp; <a href="/member/findpwform">비밀번호 찾기</a>
</div>
-->


<div class="container">
	<div class="row">
		<div class="mainContent">
			<h2 class="section__title mb-40">Login</h2>

				<div class="inputBox">				
					<input type="text" placeholder="아이디" id="id" name="id" label="id">
				</div>
				<div class="inputBox">
					<input type="password" placeholder="비밀번호" id="password" name="password" label="Password">
				</div>
				<div id="loginChk"></div> 
				<div class="mainBtn">
					<button class="loginBtn" id="login" onclick="login();">로그인</button></div>

				
				<div class="findAccount">
					
					<ul>
						<li><a href="/member/findidform">아이디 찾기</a></li>
						<li><a href="/member/findpwform">비밀번호 찾기</a></li>
					</ul>

				</div>
					<div class="social_media">
						<h5>SNS로 간편하게 로그인하기</h5>
						<div id="naverIdLogin">
							<a id="naverIdLogin_loginButton" href="#">
								<img src="https://static.nid.naver.com/oauth/big_g.PNG?version=js-2.0.1" height="60"></a>
							</div>
						<div id="kakao-login-btn">
							<img id="kakao-login-btn" src="https://kauth.kakao.com/public/widget/login/kr/kr_02_medium.png" onmouseover="this.src='https://kauth.kakao.com/public/widget/login/kr/kr_02_medium_press.png'" onmouseout="this.src='https://kauth.kakao.com/public/widget/login/kr/kr_02_medium.png'" style="cursor: pointer">
						</div>
					</div>
							
					<div class="ask_signup">
						<span>아직도 랫플 회원이 아니세요?</span>
						<a href="/member/signupform"><span class="signup">회원가입</span></a>
						</div>
					</div>
				</div>
			</div>
<%@ include file="footer.jsp" %>