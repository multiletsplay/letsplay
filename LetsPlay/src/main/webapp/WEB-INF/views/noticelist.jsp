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
<h1>공지사항</h1>
	<table border="1">
		<col width="50">
		<col width="100">
		<col width="200">
		<col width="100">
		<tr>
			<th>NOTICE_SEQ</th>
			<th>ID</th>
			<th>TITLE</th>
			<th>CONTENT</th>
			<th>DATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty noticelist }">
				<tr>
					<td colspan="5" align="center">---- 공지사항이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${noticelist}" var="notice">
					<tr>
						<td>${notice.noticeSeq }</td>
						<td>${notice.id }</td>
						<td><a href="/notice/detail?noticeSeq=${notice.noticeSeq }">${notice.noticeTitle }</a></td>
						<td>${notice.noticeContent }</td>
						<td>${notice.noticeDate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글 작성" onclick="location.href='/notice/insertform'">
			</td>
		</tr>
	</table>
</body>
</html>