<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn1(){
	if (confirm("게시글을 삭제하시겠습니까?")) {
		location.href='/notice/delete?noticeSeq=${dto.noticeSeq}'
	}
};
function fn2(){
	if (confirm("게시글을 추천하시겠습니까?")) {
		location.href='/notice/updatelike?noticeSeq=${dto.noticeSeq}'
	}
};
	</script>
	<table border="1" class="table">
		<tr class="table-active">
			<th>작성자</th>
			<td width="500px">${dto.id }</td>
		</tr>
		<tr>
			<th>제  목</th>
			<td>${dto.noticeTitle }</td>
		</tr>
		<tr>
			<th>내  용</th>
			<td width="500px"><textarea rows="10" cols="70" readonly="readonly">${dto.noticeContent }</textarea></td>
		</tr>
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="수정" onclick="location.href='/notice/updateform?noticeSeq=${dto.noticeSeq}'">
				<input type="button" value="삭제"  onclick="javascript:fn1();">
				<input type="button" value="목록" onclick="location.href='/notice/list'">
			</td>
		</tr>
		</table>
</body>
</html>