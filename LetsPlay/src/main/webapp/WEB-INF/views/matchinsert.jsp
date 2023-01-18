<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

</script>

<div>
	<form action="/match/insert" method="post">
	<input type="hidden" name="matchCnt" value="1">
		<table border="1">
			<tr>
				<th>제  목</th>
				<td><input type="text" name="matchTitle"></td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" value="${member.id}" readonly></td>
			</tr>
			<tr>
				<th>스포츠 종류</th>
				<td><input type="radio" name="spoId" value='1' checked="checked">풋살
					<input type="radio" name="spoId" value='2'>테니스
					<input type="radio" name="spoId" value='3'>배드민턴
					<input type="radio" name="spoId" value='4'>탁구
					<input type="radio" name="spoId" value='5'>수영
					<input type="radio" name="spoId" value='6'>골프</td>
			</tr>
			<tr>
				<th>마감일자</th>
				<td><input type="datetime-local" name="matchEnddate" ></td>
			</tr>
<!-- 			<tr> -->
<!-- 				<th>마감일자</th> -->
<!-- 				<td><input type="date" name="matchEnddate" value="2023-01-01" required pattern="\d{4}-\d{2}-\d{2}-'T'\d{2}:\d{2}"></td> -->
<!-- 			</tr> -->
			<tr>
				<th>장  소</th>
				<td>
				<select id="region" name="matchLocation" >
					<option value="">시/도</option>
					<option value="서울">서울</option>
				</select>
				<select id="region" name="matchLocation">
					<option value="">군/구</option>
					<option value="강서구">강서구</option>
					<option value="관악구">관악구</option>
					<option value="구로구">구로구</option>
					<option value="동작구">동작구</option>
					<option value="서초구">서초구</option>
					<option value="송파구">송파구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>시작시간</th>
				<td><input type="time" name="startTime"step="30:00" value="11:00"></td>
			</tr>
			<tr>
				<th>종료시간</th>
				<td><input type="time" name="endTime" min="06:00" max="23:59" step="30:00" value="14:00"></td>
			</tr>
			<tr>
				<th>내  용</th>
				<td><textarea rows="10" cols="100" name="matchContent"></textarea></td>
			</tr>
			<tr>
				<th>총인원<br>(본인을 포함한 수)</th>
				<td><input type="number" name="matchTotal" min="2" max="22" value="2"></td>
			</tr>
			<tr>
				<th>레벨</th>
				<td><input type="range" name="matchLevel" min="1" max="5" value="3"></td>
			</tr>
			<tr>
		        <th>시설유무</th>
		        <td><input type="checkbox" name="matchFacility" value="Y" checked></td>
		    </tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='/match/list'">
				</td>
			</tr>
		</table>	
	</form>
</div>
</body>
</html>