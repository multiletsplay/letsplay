<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
<h1>마이페이지</h1>
<h2>회원 정보</h2>
<form action="/member/mypage" method="GET">
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
		<td>${member.name}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${member.nickname}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${member.email}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${member.phone}</td>
	</tr>
	
</table>
</form>
</body>
</html>