<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<form action="/notice/update" method="post">
		<input type="hidden" name="noticeSeq" value="${dto.noticeSeq }">
		<table border="1">
			<tr>
				<th>작성자</th>
				<td>${dto.id }</td>
			</tr>
			<tr>
				<th>제  목</th>
				<td><input type="text" name="title" value="${dto.noticeTitle }"></td>
			</tr>
			<tr>
				<th>내  용</th>
				<td><textarea rows="10" cols="70" name="content">${dto.noticeContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="목록" onclick="location.href='/notice/list'">
				</td>
			</tr>
		</table>
	</form>









</div>
</body>
</html>