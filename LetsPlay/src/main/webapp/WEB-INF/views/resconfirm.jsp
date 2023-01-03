<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>예약 상세정보</h1>
<table class="reservation-table" border="1">
	<tr>
		<th>이름(닉네임)</th>
		<th>예약날짜</th>
		<th>휴대폰</th>
		<th>이메일</th>
	</tr>
	<tr>
		<td>${dto.id }</td>
		<td>${dto.ResDate }</td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>시설정보</th>
	</tr>
	<tr>
		<td>이미지</td>
		<td>시설명</td>
		<td></td>
		<td></td>
		<td></td>
	</tr>
	<tr>
		<th>결제 예정 금액</th>
		<td>${dto.ResPrice }</td>
	</tr>
</table>
</body>
</html>