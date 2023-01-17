<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberUpdate</title>
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
		<td><input type="text" name="nickname" value="${member.nickname}"></td>
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