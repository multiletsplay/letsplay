<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>

</script>
</head>
<body>
<h1>레슨 예약 상세정보</h1>
<table class="reservation-table" border="1">
	<tr>
		<th>이름(닉네임)</th>
		<th>예약날짜</th>
		<th>시작시간</th>
		<th>휴대폰</th>
		<th>이메일</th>
	</tr>
	<tr>
		<td>${dto.name }(${dto.nickname })</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.resDate }"/></td>
		<td>${dto.resStarttime }</td>
		<td>${dto.phone }</td>
		<td>${dto.email }</td>
	</tr>
	<tr>
		<th colspan="5" align="left">레슨정보</th>
	</tr>
	<tr>
		<td>${dto.lesName }</td>
		<td>${dto.lesTeacher }</td>
		<td>${dto.lesContact }</td>
	</tr>
	<tr>
		<th>결제 예정 금액</th>
		<td>${dto.lesCost }</td>
	</tr>
	<tr>
		<td colspan="5" align="center">
			<input type="button" value="결제하기" onclick="requestPay()">
		</td>
	</tr>
</table>
</body>
</html>