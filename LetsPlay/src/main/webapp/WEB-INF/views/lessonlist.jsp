<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonList</title>
</head>
<body>
<h1>레슨 리스트</h1>
<div id="lessonlist">
	<table border="1">
		<col width="50">
		<col width="100">
		<col width="200">
		<col width="100">
		
		<tr>
			<th>레슨 번호</th>
			<th>레슨 종목</th>
			<th>종목 이름</th>
			<th>레슨 위치</th>
			<th>레슨 이미지</th>
			<th>레슨 날짜</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty lessonlist }">
				<tr>
					<td colspan="4">---- 등록된 레슨이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${lessonlist }" var="dto">
					<tr>
						<td>${dto.lesSeq }</td>
						<td><a href="/lesson/detail?lesSeq=${dto.lesSeq}">${dto.lesName }</a></td>
						<td>${dto.spoName }</td>
						<td>${dto.lesLocation }</td>
						<td>${dto.lesImg }</td>
						<td>${dto.lesDate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</body>
</html>