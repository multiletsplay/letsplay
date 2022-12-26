<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>1대1문의</h1>
	<table border="1">
		<col width="50">
		<col width="100">
		<col width="200">
		<col width="100">
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글 작성" onclick="location.href='/inquiry/insertform'">
			</td>
		</tr>
		<tr>
			<th>INQ_SEQ</th>
			<th>REPLY_CHECK</th>
			<th>TITLE</th>
			<th>ID</th>
			<th>DATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty inquirylist }">
				<tr>
					<td colspan="5">---- 작성된 글이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${inquirylist}" var="dto">
					<tr>
						<td>${dto.inqSeq }</td>
						<td>${dto.replyCheck }</td>
						<td><a href="/inquiry/detail?inqSeq=${dto.inqSeq }">${dto.inqTitle }</a></td>
						<td>${dto.id }</td>
						<td>${dto.inqDate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</table>
</body>
</html>