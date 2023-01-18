<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdate</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nicknameChk").click(nicknameChk);
	});
	
	function nicknameChk(){
		let nickname = $("#nickname").val().trim();
		
		$.ajax({
			url:"/member/nicknamecheck",
			type:"get",
			data:{ "nickname" : nickname },	
			success:function(data){
				if(data == 1){
					alert("이미 사용중인 닉네임입니다.");
					$("#signup").attr("type", "button");
				}else{
					alert("사용 가능한 닉네임입니다.");
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
<h1>마이페이지</h1>
<h2>회원 정보 수정</h2>
<form action="/member/update" method="POST">
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${member.birth}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${member.password}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name" value="${member.name}"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" id="nickname" name="nickname" value="${member.nickname}"></td>
		<td><button type="button" id="nicknameChk">닉네임 중복확인</button>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" value="${member.email}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" value="${member.phone}"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정 완료" >
			<input type="button" value="수정 취소" onclick="location.href='/member/mypage'">
		</td>
	</tr>
</table>

</form>
</body>
</html>