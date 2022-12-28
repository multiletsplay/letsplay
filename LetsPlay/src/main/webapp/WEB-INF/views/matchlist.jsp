<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>매칭게시판</h1>
<div></div>
	<div>
		<table border="1">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			<col width="50">
			
			<tr align="center">
				<th>NO</th>
				<th>작성자</th>
				<th>종목</th>
				<th>제목</th>
				<th>내용</th>
				<th>마감일자</th>
				<th>장소</th>
				<th>총인원</th>
				<th>참여인원</th>
				<th>레벨</th>
				<th>댓글 수</th>
				<th>글 개수</th>
				<td><input type="hidden" value="${dto.matchSeq } " name="matchSeq" ></td>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="12" align="center">등록된 매칭이 없습니다.</td>
					</tr>
				</c:when>
				
			
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr align="center">
							<td>${dto.matchSeq }</td>
							<td>${dto.id }</td>
							<td>${dto.spoId}</td>
							<td>${dto.matchTitle }</td>
							<td>${dto.matchContent }</td>
							<td>${dto.matchEnddate }</td>
							<td>${dto.matchLocation }</td>
							<td>${dto.matchTotal }</td>
							<td>${dto.matchCnt }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
							<td>${dto.cntSeq }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="12" align="right">
					<input type="button" value="매칭등록" onclick="location.href='/match/insertform'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>