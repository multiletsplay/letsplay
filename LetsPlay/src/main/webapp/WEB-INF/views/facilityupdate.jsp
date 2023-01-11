<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(document).ready(function(){
	//이전 라디오선택값 가져오기
	var spoid = '${dto.spoId}'
	$("input:radio[name='spoId'][value="+spoid+"]").prop('checked', true);
	
	var parking = '${dto.facParking}'
	var lent = '${dto.facLent}'
	var shower = '${dto.facShower}'
	var locker = '${dto.facLocker}'
	var light = '${dto.facLight}'
	var costcheck = '${dto.facCostcheck}'
	$("input:radio[name='facParking'][value="+parking+"]").prop('checked', true);
	$("input:radio[name='facLent'][value="+lent+"]").prop('checked', true);
	$("input:radio[name='facShower'][value="+shower+"]").prop('checked', true);
	$("input:radio[name='facLocker'][value="+locker+"]").prop('checked', true);
	$("input:radio[name='facLight'][value="+light+"]").prop('checked', true);
	$("input:radio[name='facCostcheck'][value="+costcheck+"]").prop('checked', true);
	
});
</script>
</head>
<body>
<h1>시설 추가</h1>
<div>
	<form action="/facility/update" method="post">
	<input type="hidden" name="facSeq" value="${dto.facSeq }">
		<table class="facility-insert" border="1">
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
				<th>시설명</th>
				<td><input type="text" style="width:500px;" name="facName" value="${dto.facName }"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" style="width:500px;" name="file" multiple="multiple"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" style="width:500px;" name="facLocation" value="${dto.facLocation }"></td>
			</tr>
			<tr>
				<th>시설전화번호</th>
				<td><input type="text" style="width:500px;" name="facContact" value="${dto.facContact }"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" style="width:500px;" name="facCost" value="${dto.facCost }"></td>
			</tr>
			<tr>
				<td colspan="2"><strong>상세정보</strong></td>
			</tr>
			<tr>
				<th>주차장</th>
				<td>
					<input type="radio" name="facParking" value='true'>Y
					&nbsp;
					<input type="radio" name="facParking" value='false'>N
				</td>
			</tr>
			<tr>
				<th>장비대여</th>
				<td>
					<input type="radio" name="facLent" value='true'>Y
					&nbsp;
					<input type="radio" name="facLent" value='false'>N
				</td>
			</tr>
			<tr>
				<th>샤워시설</th>
				<td>
					<input type="radio" name="facShower" value='true'>Y
					&nbsp;
					<input type="radio" name="facShower" value='false'>N
				</td>
			</tr>
			<tr>
				<th>락커</th>
				<td>
					<input type="radio" name="facLocker" value='true'>Y
					&nbsp;
					<input type="radio" name="facLocker" value='false'>N
				</td>
			</tr>
			<tr>
				<th>조명</th>
				<td>
					<input type="radio" name="facLight" value='true'>Y
					&nbsp;
					<input type="radio" name="facLight" value='false'>N
				</td>
			</tr>
			<tr>
				<th>가격유무료</th>
				<td>
					<input type="radio" name="facCostcheck" value='true'>Y
					&nbsp;
					<input type="radio" name="facCostcheck" value='false'>N
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="시설 수정">
					<input type="button" value="수정 취소" onclick="location.href='/facility/detail?facSeq=${dto.facSeq }'">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>