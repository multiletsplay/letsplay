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
				<th>시설/레슨명</th>
				<td>
					<c:choose>
                       <c:when test="${dto.facName eq null}">
                           ${dto.lesName}
                       </c:when>
                       <c:otherwise>
                           ${dto.facName}
                       </c:otherwise>
                   </c:choose>
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<c:choose>
                       <c:when test="${dto.facLocation eq null}">
                           ${dto.lesLocation}
                       </c:when>
                       <c:otherwise>
                           ${dto.facLocation}
                       </c:otherwise>
                   </c:choose>
				</td>
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