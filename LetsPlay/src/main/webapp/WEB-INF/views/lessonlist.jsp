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
<!-- 종목 선택 -->
<h3>종목 선택</h3>
<div class="select-sports">
	<form action="/lesson/select" method="get">
		<button type="button" name="spoId" onclick="location.href='/lesson/list'"><img src="https://cdn-icons-png.flaticon.com/512/443/443635.png" width="30"></button>
		<button type="submit" name="spoId" value="1"><img src="https://cdn-icons-png.flaticon.com/512/6938/6938829.png" width="30"></button>
		<button type="submit" name="spoId" value="2"><img src="https://cdn-icons-png.flaticon.com/512/3978/3978317.png" width="30"></button>
		<button type="submit" name="spoId" value="3"><img src="https://cdn-icons-png.flaticon.com/512/1633/1633893.png" width="30"></button>
		<button type="submit" name="spoId" value="4"><img src="https://cdn-icons-png.flaticon.com/512/2500/2500356.png" width="30"></button>
		<button type="submit" name="spoId" value="5"><img src="https://cdn-icons-png.flaticon.com/512/50/50004.png" width="30"></button>
		<button type="submit" name="spoId" value="6"><img src="https://cdn-icons-png.flaticon.com/512/1695/1695095.png" width="30"></button>
	</form>
</div>
<br><br>
<div id="lessonlist">
	<form action="/lesson/delete" method="post">
	<div>
		<input type="submit" id="deleteBtn" value="선택 삭제">
	</div>
	<table border="1">
		<tr>
			<th><input id="selectAll" type="checkbox"></th>
			<th>스포츠 종류</th>
			<th>사진</th>
			<th>레슨 이름</th>
			<th>주소</th>
			<th>찜</th>
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
						<td>${dto.spoName }</td>
						<td><img width="210" src="${dto.lesImgpath }"></td>
						<td><a href="/lesson/detail?lesSeq=${dto.lesSeq}">${dto.lesName }</a></td>
						<td>${dto.lesLocation }</td>
						<td></td>
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