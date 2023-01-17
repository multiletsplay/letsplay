<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
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
</head>
<body>
<h1>로그인</h1>
<input type="text" id="id" name="id" placeholder="아이디를 입력해주세요">
<input type="password" id="password" name="password" placeholder="비밀번호를 입력해주세요">
<button type="button" id="login" onclick="login();">로그인</button>
<button type="button" onclick="location.href='/member/signupform'">회원가입</button>
<div>
	<a href="/member/findidform">아이디 찾기</a> &nbsp;&nbsp; <a href="/member/findpwform">비밀번호 찾기</a>
</div>
<div id="loginChk"></div>
</body>
</html>