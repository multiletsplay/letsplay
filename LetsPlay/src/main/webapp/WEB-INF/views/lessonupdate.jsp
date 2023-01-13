<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lesson Update</title>
</head>
<body>
<h1>레슨 수정</h1>
<div>
	<form action="/lesson/update" method="post">
	<input type="hidden" name="lesSeq" value="${dto.lesSeq }">
		<table class="lesson-update" border="1" >
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
				<td><input type="text" style="width:500px;" name="lesName" value="${dto.lesName }"></td>
			</tr>
			<tr>
				<th>레슨 강사</th>
				<td><input type="text" style="width:500px;" name="lesTeacher" value="${dto.lesTeacher }"></td>
			</tr>
			<tr>
				<th>레슨 전화번호</th>
				<td><input type="text" style="width:500px;" name="lesContact" value="${dto.lesContact }"></td>
			</tr>
			<tr>
				<th>레슨 비용</th>
				<td><input type="text" style="width:500px;" name="lesCost" value="${dto.lesCost }"></td>
			</tr>
			<tr>
				<th>레슨 장소</th>
				<td><input type="text" style="width:500px;" name="lesLocation" value="${dto.lesLocation }"></td>
			</tr>
			<tr>
				<th>레슨 종류</th>
				<td><input type="text" style="width:500px;" name="lesType" value="${dto.lesType }"></td>
			</tr>
			<tr>
				<th>레슨 주중 OR 주말</th>
				<td><input type="text" style="width:500px;" name="lesWeekend" value="${dto.lesWeekend }"></td>
			</tr>
			<tr>
				<th>레슨 이미지</th>
				<td><input type="text" style="width:500px;" name="lesImg" value="${dto.lesImg }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="레슨 수정">
					<input type="button" value="수정 취소" onclick="location.href='/lesson/detail?lesSeq=${dto.lesSeq }'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>