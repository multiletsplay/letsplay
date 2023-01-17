<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#idChk").click(idChk);
	});
	
	function idChk(){
		let id = $("#id").val().trim();
		
		$.ajax({
			url:"/member/idcheck",
			type:"get",
			data:{ "id" : id },	
			success:function(data){
				if(data == 1){
					alert("이미 사용중인 ID입니다.");
					$("#signup").attr("type", "button");
				}else{
					alert("사용 가능한 ID입니다.");
				}
			},
			error:function(){
				alert("통신 실패");
			}
		});
	}
</script>
</head>
<body>
<h1>회원가입</h1>
<form action="/member/signup" method="post">
	<table border="1">
		<tr>
			<th>아이디</th>
			<td><input type="text" id="id" name="id" placeholder="아이디를 입력해주세요"></td>
			<td><button type="button" id="idChk">중복확인</button>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input type="text" name="password" placeholder="영문,숫자,특수문자 포함 8자 이상 15자 이하"></td>
		</tr>
		<tr>
			<th>비밀번호확인</th>
			<td><input type="text" id="pwChk" placeholder="비밀번호를 한번 더 입력해주세요"></td>
		</tr>
		<tr>
			<th>이름</th>
			<td><input type="text" name="name" placeholder="이름을 입력해주세요"></td>
		</tr>
		<tr>
			<th>닉네임</th>
			<td><input type="text" name="nickname" placeholder="닉네임을 입력해주세요"></td>
		</tr>
		<tr>
			<th>이메일</th>
			<td><input type="text" name="email" placeholder="ex) multi_7@campus.com"></td>
		</tr>
		<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" placeholder="숫자만 입력해주세요"></td>
			<td><button type="button">인증번호 받기</button>
		</tr>
		<tr>
			<th></th>
			<td><input type="text" id="phoneChk" placeholder="아이디를 입력해주세요"></td>
			<td><button type="button">인증번호 확인</button>
		</tr>
		<tr>
			<th></th>
			<td>
				<input type="radio" name="gender" value='M'>남자
				&nbsp;
				<input type="radio" name="gender" value='F'>여자
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td><input type="text" name="birth" placeholder="YYYY/MM/DD"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" id="signup" value="회원가입">
				<input type="button" value="로그인" onclick="location.href='/member/loginform'">
			</td>
		</tr>
		
	</table>


</form>
</body>
</html>