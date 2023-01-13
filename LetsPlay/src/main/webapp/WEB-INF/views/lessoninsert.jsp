<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson Insert</title>
</head>
<body>
<h1>레슨 추가</h1>
<div>
	<form action="/lesson/insert" method="post">
		<table class="lesson-insert" border="1">
			<tr>
				<th>종목</th>
				<td>
					<input type="radio" name="spoId" value='1'>풋살
					&nbsp;
					<input type="radio" name="spoId" value='2'>테니스
					&nbsp;
					<input type="radio" name="spoId" value='3'>배드민턴
					&nbsp;
					<input type="radio" name="spoId" value='4'>탁구
					&nbsp;
					<input type="radio" name="spoId" value='5'>수영
					&nbsp;
					<input type="radio" name="spoId" value='6'>골프
				</td>
			</tr>
			<tr>
				<th>레슨명</th>
				<td><input type="text" style="width:500px;" name="lesName"></td>
			</tr>
			<tr>
				<th>레슨 강사</th>
				<td><input type="text" style="width:500px;" name="lesTeacher"></td>
			</tr>
			<tr>
				<th>레슨 전화번호</th>
				<td><input type="text" style="width:500px;" name="lesContact"></td>
			</tr>
			<tr>
				<th>레슨 비용</th>
				<td><input type="text" style="width:500px;" name="lesCost"></td>
			</tr>
			<tr>
				<th>레슨 장소</th>
				<td><input type="text" style="width:500px;" name="lesLocation"></td>
			</tr>
			<tr>
				<th>레슨 종류</th>
				<td><input type="text" style="width:500px;" name="lesType"></td>
			</tr>
			<tr>
				<th>레슨 주중,주말</th>
				<td><input type="text" style="width:500px;" name="lesWeekend"></td>
			</tr>
			<tr>
				<th>레슨 이미지</th>
				<td><input type="text" style="width:500px;" name="lesImg"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="시설 추가">
					
				</td>
			</tr>
		</table>
	</form>
	<input type="submit" id="cancelbutton" value="취소" onclick="location.href='/lesson/list'">
</div>
</body>
</html>