<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
</body>
</html>