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
	<form action="/lesson/insert" method="post" enctype="multipart/form-data">
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
				<th>이미지</th>
				<td><input type="file" style="width:500px;" name="file" multiple="multiple"></td>
			</tr>
			<tr>
				<th>레슨 장소</th>
				<td><input type="text" style="width:500px;" name="lesLocation"></td>
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
				<th>개인/단체</th>
				<td>
					<input type="radio" name="lesType" value='personal'>개인
					&nbsp;
					<input type="radio" name="lesType" value='group'>단체
				</td>
			</tr>
			<tr>
				<th>주중/주말</th>
				<td>
					<input type="radio" name="lesWeekend" value='weekday'>주중
					&nbsp;
					<input type="radio" name="lesWeekend" value='weekend'>주말
				</td>
			</tr>
			<tr>
				<th>레슨 스케줄</th>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="레슨 추가">
				</td>
			</tr>
		</table>
	</form>
	<input type="submit" id="cancelbutton" value="취소" onclick="location.href='/lesson/list'">
</div>
</body>
</html>