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
<c:forEach items="${list }" var="dto">
<div>${dto.cntSeq }명이 현재 매칭 중!!</div>
</c:forEach>
<div class="form-group">
    <label>포지션</label><br>
    <input class="sports-checkbox" type="checkbox" value="풋살">풋살
    <input class="sports-checkbox" type="checkbox" value="테니스">테니스
    <input class="sports-checkbox" type="checkbox" value="골프">피아노2
    <input class="sports-checkbox" type="checkbox" value="탁구">일렉
</div>
	<div>
		<table border="1">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			<col width="75">
			
			<tr align="center">
				<th>NO</th>
				<th>작성자</th>
				<th>종목</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일자</th>
				<th>마감일자</th>
				<th>장소</th>
				<th>참여인원/총인원</th>
				<th>레벨</th>
				<th>댓글 수</th>
				<td><input type="hidden" value="${dto.matchSeq } " name="matchSeq" ></td>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="11" align="center">등록된 매칭이 없습니다.</td>
					</tr>
				</c:when>
				
			
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr align="center">
							<td>${dto.matchSeq }</td>
							<td>${dto.id }</td>
							<td>${dto.spoId}</td>
							<td><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></td>
							<td>${dto.matchContent }</td>
							<td><fmt:formatDate value="${dto.matchRegdate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
							<td><fmt:formatDate value="${dto.matchEnddate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
							<td>${dto.matchLocation }</td>
							<td>${dto.matchCnt }/${dto.matchTotal }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="11" align="right">
					<input type="button" value="매칭등록" onclick="location.href='/match/insertform'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>