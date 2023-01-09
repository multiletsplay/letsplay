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

<div>
<form action="/match/search"  method="get">
  <button type="button" name="spoId" onclick="location.href='/match/list'"><img src="../../img/football.jpg" width="35px">전체</button>
  <button type="submit" name="spoId" value="1"><img src="../../img/football.jpg" width="35px">풋살</button>
  <button type="submit" name="spoId" value="2"><img src="../../img/football.jpg" width="35px">테니스</button>
  <button type="submit" name="spoId" value="3"><img src="../../img/football.jpg" width="35px">배드민턴</button>
  <button type="submit" name="spoId" value="4"><img src="../../img/football.jpg" width="35px">탁구</button>
  <button type="submit" name="spoId" value="5"><img src="../../img/football.jpg" width="35px">수영</button>
  <button type="submit" name="spoId" value="6"><img src="../../img/football.jpg" width="35px">골프</button>
</form>
</div>

	<div>
		<table border="1">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="300">
			<col width="100">
			<col width="120">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="100">
			<tr>
				<td><c:out value="${cnt}"/>명이 현재 매칭 중!</td>
			</tr>
			<tr align="center">
				<th>NO</th>
				<th>작성자</th>
				<th>종목</th>
				<th>제목</th>
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
						<td colspan="10" align="center">등록된 매칭이 없습니다.</td>
					</tr>
				</c:when>
				
			
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr align="center">
							<td>${dto.matchSeq }</td>
							<td>${dto.id }</td>
							<td>${dto.spoId}</td>
							<td><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></td>
							<td><fmt:formatDate value="${dto.matchRegdate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
							<td><fmt:formatDate value="${dto.matchEnddate}" pattern="yyyy-MM-dd(E) " ></fmt:formatDate></td>
							<td>${dto.matchLocation }</td>
							<td>${dto.matchCnt }/${dto.matchTotal }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="10" align="right">
					<input type="button" value="매칭등록" onclick="location.href='/match/insertform'">
				</td>
			</tr>
		</table>
	</div>

</body>
</html>