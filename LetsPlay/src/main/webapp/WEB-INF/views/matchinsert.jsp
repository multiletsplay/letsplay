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
				<td><input type="text" name="id"></td>
			</tr>
			<tr>
				<th>스포츠 종류</th>
				<td><input type="radio" name="spoId" value='1'>풋살
					<input type="radio" name="spoId" value='2'>테니스
					<input type="radio" name="spoId" value='3'>배구
					<input type="radio" name="spoId" value='4'>탁구
					<input type="radio" name="spoId" value='5'>수영
					<input type="radio" name="spoId" value='6'>골프</td>
			</tr>
			<tr>
				<th>마감일자</th>
				<td><input type="date" name="matchEnddate"></td>
			</tr>
			<tr>
				<th>장  소</th>
				<td><input type="text" name="matchLocation"></td>
			</tr>
			<tr>
				<th>내  용</th>
				<td><textarea rows="10" cols="100" name="matchContent"></textarea></td>
			</tr>
			<tr>
				<th>총인원</th>
				<td><input type="text" name="matchTotal"></td>
			</tr>
			<tr>
				<th>레벨</th>
				<td><input type="range" name="matchLevel" min="0" max="5"></td>
			</tr>
			<tr>
		        <th>시설유무</th>
		        <td><input type="checkbox" name="matchFacility" value="1">시설확정</td>
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