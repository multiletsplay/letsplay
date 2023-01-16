<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>1대1문의</h1>
<div id="inquiry-insert">
    <form action="/inquiry/insert" method="post">
        <table class="inquiry-table">
        	<tr>
                <th>ID</th>
                <td><input type="hidden" name="id" value="${member.id }">${member.id }</td>
            </tr>
            <tr>
                <th>제목</th>
                <td><input type="text" name="inqTitle"></td>
            </tr>
            <tr>
                <th>내용</th>
                <td><textarea rows="10" cols="80" name="inqContent"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
					<input type="submit" value="등록">
					<input type="button" value="취소" onclick="location.href='/inquiry/list'">
				</td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>