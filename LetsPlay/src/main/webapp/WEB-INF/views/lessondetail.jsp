<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonDetail</title>
</head>
<body>
<form action="/lesson/reserve" method="POST">
	<table border="1">
		<tr>
			<th>레슨 번호</th>
			<td><input type="hidden" name="lesSeq" value="${dto.lesSeq }">${dto.lesSeq}</td>
		</tr>
		<tr>
			<th>레슨 이름</th>
			<td><input type="hidden" name="lesName" value="${dto.lesName }">${dto.lesName}</td>
		</tr>
		<tr>
			<th>종목 이름</th>
			<td>${dto.spoName}</td>
		</tr>
		<tr>
			<th>레슨 강사님</th>
			<td><input type="hidden" name="lesTeacher" value="${dto.lesTeacher }">${dto.lesTeacher}</td>
		</tr>
		<tr>
			<th>레슨 장소</th>
			<td><input type="hidden" name="lesLocation" value="${dto.lesLocation }">${dto.lesLocation}</td>
		</tr>
		<tr>
			<th>레슨 연락처</th>
			<td><input type="hidden" name="lesContact" value="${dto.lesContact }">${dto.lesContact}</td>
		</tr>
		<tr>
			<th>레슨 이미지</th>
			<td><input type="hidden" name="lesImg" value="${dto.lesImg }">${dto.lesImg}</td>
		</tr>
		<tr>
			<th>레슨 비용</th>
			<td><input type="hidden" name="lesCost" value="${dto.lesCost }">${dto.lesCost}</td>
		</tr>
		
		<tr>
			<th>날짜</th>
			<td><input type="date" name="resDate"></td>
			<th>시간</th>
			<td><input type="time" name="resStarttime"></td>
			<td><input type="time" name="resEndtime"></td>
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
				<input type="button" value="레슨 수정" onclick="location.href='/lesson/updateform?lesSeq=${dto.lesSeq}'">
				<input type="submit" value="예약하기">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>