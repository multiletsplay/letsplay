<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonList</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//전체체크 선택
		$('#selectAll').click(function(){
			var checked = $(this).is(':checked');
			
			$('.delList').prop("checked", checked);
		});
		
	});
</script>
</head>
<body>
<h1>레슨 리스트</h1>
<div id="lessonlist">
	<form action="/lesson/delete" method="post">
	<div>
		<input type="submit" id="deleteBtn" value="선택 삭제">
	</div>
	<table border="1">
		<col width="50">
		<col width="100">
		<col width="200">
		<col width="100">
		
		<tr>
			<th><input id="selectAll" type="checkbox"></th>
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
						<td><input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/></td>
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
	</form>
	<input type="button" id="insertButton" value="레슨 추가" onclick="location.href='/lesson/insertform'">
</div>
</body>
</html>