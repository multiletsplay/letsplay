<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonDetail</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>레슨 번호</th>
			<td>${dto.lesSeq}</td>
		</tr>
		<tr>
			<th>레슨 이름</th>
			<td>${dto.lesName}</td>
		</tr>
		<tr>
			<th>종목 이름</th>
			<td>${dto.spoName}</td>
		</tr>
		<tr>
			<th>레슨 강사님</th>
			<td>${dto.lesTeacher}</td>
		</tr>
		<tr>
			<th>레슨 장소</th>
			<td>${dto.lesLocation}</td>
		</tr>
		<tr>
			<th>레슨 연락처</th>
			<td>${dto.lesContact}</td>
		</tr>
		<tr>
			<th>레슨 이미지</th>
			<td>${dto.lesImg}</td>
		</tr>
		<tr>
			<th>레슨 비용</th>
			<td>${dto.lesCost}</td>
		</tr>
		<tr>
			<th>레슨 일자</th>
			<td>${dto.lesDate}</td>
		</tr>
		<tr>
			<th>레슨 종류</th>
			<td>${dto.lesType}</td>
		</tr>
		<tr>
			<th>레슨 평일/주말</th>
			<td>${dto.lesWeekend}</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="목록" onclick="location.href='/lesson/list'">
				<input type="button" value="예약하기" onclick="location.href=''">
			</td>
		</tr>
	</table>
</body>
</html>