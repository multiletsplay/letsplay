<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Insert</title>
</head>
<body>
<div>

	<form action="/review/insert" method="POST">
		<table class="reviewinsert" border="1">
			
			<tr>
				<th>아이디</th>
				<td>${member.id }</td>
			</tr>
			
			
			<tr>
				<th>레슨번호</th>
				<td>${dto.lesSeq }</td>
			</tr>
			<tr>
				<th>시설번호</th>
				<td>${dto.facSeq }</td>
			</tr>
			<tr>
				<th>별점</th>
				<td><input type="text" style="width:100px;" name="revRate"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><input type="text" style="width:300px; height:200px;" name="revContent"></td>
			</tr>
			<tr>
				<th>작성일자</th>
				<td>${dto.revWritedate }</td>
			</tr>
			<tr>
				<th>수정일자</th>
				<td>${dto.revModidate }</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성 완료">
				</td>
			</tr>
		</table>
	</form>
	<input type="submit" id="cancelBtn" value="취소" onclick="location.href='/mypage'">
</div>
</body>
</html>