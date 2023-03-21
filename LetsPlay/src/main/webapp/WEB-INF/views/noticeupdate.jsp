<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
function fn1(){
	if (confirm("게시글을 수정하시겠습니까?")) {
		location.href='/notice/list'
	}
};
</script>
	<form action="/notice/update" method="post">
		<input type="hidden" name="noticeSeq" value="${dto.noticeSeq }">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>제  목</th>
				<td><input type="text" name="noticeTitle" value="${dto.noticeTitle }"></td>
			</tr>
			<tr>
				<th>내  용</th>
				<td><textarea rows="10" cols="70" name="noticeContent">${dto.noticeContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="javascript:fn1();">
				</td>
			</tr>
		</table>
	</form>










</body>
</html>