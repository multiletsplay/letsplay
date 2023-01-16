<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#commentBtn { visibility: hidden; }
	#comUpdateBtn { visibility: hidden; }
	#comDelBtn { visibility: hidden; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var mem = '${member.type }';
		if (mem=='admin'){
			$("#commentBtn").css("visibility","visible");
			$("#comUpdateBtn").css("visibility","visible");
			$("#comDelBtn").css("visibility","visible");
		}
	});
	
	function replyUpdateShow(){
		$(".reply-table").attr("style", "display:none")
		$(".reply-update").attr("style", "display:table")
	}
</script>
</head>
<body>
<h1>1대1문의 디테일</h1>
<table class="board-table">
    <tr>
        <th>제목</th>
        <td>${dto.inqTitle }</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${dto.id }</td>
    </tr>
    <tr>
    	<th>날짜</th>
        <td>${dto.inqDate }</td>
    </tr>
    <tr>
        <th>내용</th>
        <td><textarea rows="10" cols="80" readonly="readonly">${dto.inqContent }</textarea></td>
    </tr>
    <tr>
		<td colspan="2" align="right">
			<input type="button" value="수정" onclick="location.href='/inquiry/updateform?inqSeq=${dto.inqSeq}'">
			<input type="button" value="삭제" onclick="location.href='/inquiry/delete?inqSeq=${dto.inqSeq}'">
			<input type="button" value="목록" onclick="location.href='/inquiry/list'">
		</td>
	</tr>
</table>
<hr>
<table class="reply-table">
	<c:choose>
		<c:when test="${empty reply }">
			<form action="/inquiry/reply/insert" method="post">
			<input type="hidden" name="id" value="admin" >	<!-- 로그인 기능 완료시 로그인데이터로 id값 받아오기 -->
    		<input type="hidden" name="inqSeq" value="${dto.inqSeq}" >
				<table class="reply-insert">
					<tr>
						<th>작성자</th>
						<td>관리자</td>	<!-- 추후 관리자id일경우 '관리자'로 표시로 수정 -->
					</tr>
					<tr>
						<th>날짜</th>
						<td></td>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="80" name="repContent"></textarea></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" id="commentBtn" value="댓글 등록">
						</td>
					</tr>
				</table>
			</form>
		</c:when>
		<c:otherwise>
			<table class="reply-table">
				<tr>
					<th>작성자</th>
					<td>관리자</td>
				</tr>
				<tr>
					<th>날짜</th>
					<td>${reply.repDate }</td>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="80" readonly="readonly">${reply.repContent }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="button" value="수정" id="comUpdateBtn" onclick="replyUpdateShow();">
						<input type="button" value="삭제" id="comDelBtn" onclick="location.href='/inquiry/reply/delete?repSeq=${reply.repSeq}&inqSeq=${reply.inqSeq }'">
					</td>
				</tr>
			</table>
			
			
			<form action="/inquiry/reply/update" method="post">
			<input type="hidden" name="inqSeq" value="${reply.inqSeq}" >
			<input type="hidden" name="repSeq" value="${reply.repSeq}" >
			<table class="reply-update" style="display:none">
				<tr>
					<th>답변 수정</th>
				</tr>
				<tr>
					<th>작성자</th>
					<td>관리자</td>	<!-- 추후 관리자id일경우 '관리자'로 표시로 수정 -->
				</tr>
				<tr>
					<th>날짜</th>
					<td>${reply.repDate }</td>
				<tr>
					<th>내용</th>
					<td><textarea rows="10" cols="80" name="repContent">${reply.repContent }</textarea></td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="location.href='/inquiry/detail?inqSeq=${dto.inqSeq}'">
					</td>
				</tr>
			</table>
			</form>
		</c:otherwise>
	</c:choose>
</table>
</body>
</html>