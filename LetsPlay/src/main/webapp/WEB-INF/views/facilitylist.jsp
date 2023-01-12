<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul{ list-style:none; }
	#optionBtn { display: none; }
	.searchOption { display:none; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		//전체체크 선택
		$('#selectAll').click(function(){
			var checked = $(this).is(':checked');
			
			$('.delList').prop("checked", checked);
		});
		
		//상세조건 펼침버튼
		$('#optionBtn').click(function(){
			$('.searchOption').toggle('active');
		});
		
	});
</script>
</head>
<body>
<h1>시설리스트</h1>
<!-- 종목 선택 -->
<h3>종목 선택</h3>
<div class="select-sports">
	<form action="/facility/select" method="get">
		<button type="button" name="spoId" onclick="location.href='/facility/list'"><img src="https://cdn-icons-png.flaticon.com/512/443/443635.png" width="30"></button>
		<button type="submit" name="spoId" value="1"><img src="https://cdn-icons-png.flaticon.com/512/6938/6938829.png" width="30"></button>
		<button type="submit" name="spoId" value="2"><img src="https://cdn-icons-png.flaticon.com/512/3978/3978317.png" width="30"></button>
		<button type="submit" name="spoId" value="3"><img src="https://cdn-icons-png.flaticon.com/512/1633/1633893.png" width="30"></button>
		<button type="submit" name="spoId" value="4"><img src="https://cdn-icons-png.flaticon.com/512/2500/2500356.png" width="30"></button>
		<button type="submit" name="spoId" value="5"><img src="https://cdn-icons-png.flaticon.com/512/50/50004.png" width="30"></button>
		<button type="submit" name="spoId" value="6"><img src="https://cdn-icons-png.flaticon.com/512/1695/1695095.png" width="30"></button>
	</form>
</div>
<br><br>
<!-- 상세조건검색 -->
<div id="facility-search">
	<h3>지역 시설찾기</h3>
	<!-- 지역	 / 날짜 / 필터 : 유무료, 주차, 장비대여, 샤워시설, 락커, 조명 -->
	<span><strong>지역</strong>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<strong>날짜</strong></span>
	<form action="/facility/search" method="get">
		<span>
			<select id="region1" name="searchRegion1">
				<option value="">시/도</option>
				<option value="1">서울</option>
			</select>
		</span>
		<span>
			<select id="region2" name="searchRegion2">
				<option value="">군/구</option>
				<option value="강서구">강서구</option>
				<option value="구로구">구로구</option>
				<option value="동작구">동작구</option>
				<option value="서초구">서초구</option>
				<option value="송파구">송파구</option>
				<option value="종로구">종로구</option>
				<option value="중구">중구</option>
			</select>
		</span>
		<span>
			<input type="date" id="date" name="searchDate" >
		</span>
		<div>
			<strong>상세조건</strong>
			<input type="checkbox" id="optionBtn">
			<label for="optionBtn">▼ 열기</label>
			<ul class="searchOption">
				<li><input type="checkbox" name="optParking" value="true"><label>주차</label>
				<li><input type="checkbox" name="optLent" value="true"><label>장비대여</label>
				<li><input type="checkbox" name="optShower" value="true"><label>샤워시설</label>
				<li><input type="checkbox" name="optLocker" value="true"><label>락커</label>
				<li><input type="checkbox" name="optLight" value="true"><label>조명</label>
				<li><input type="checkbox" name="optCost" value="true"><label>가격무료</label>
			</ul>
		</div>
		<span><input type="submit" value="검색"></span>
	</form>
</div>
<!-- 시설리스트 -->
<div id="facility-list">
	<br><br>
	<form action="/facility/delete" method="post">
	<div>
		<input type="button" id="insertBtn" value="시설 추가" onclick="location.href='/facility/insertform'">
		&nbsp;
		<input type="submit" id="deleteBtn" value="선택 삭제">
	</div>
	<br>
	<table border="1">
		<tr>
			<th><input id="selectAll" type="checkbox"></th>
			<th>스포츠종류</th>
			<th>사진</th>
			<th>시설이름</th>
			<th>주소</th>
			<th>찜?</th>
		</tr>
	    <c:choose>
	        <c:when test="${empty faclist }">
	            <div>------ 시설이 없습니다. ------</div>
	        </c:when>
	        <c:otherwise>
	            <c:forEach items="${faclist }" var="dto">
	            	<tr>
	            		<td><input type="checkbox" class="delList" name="delList" value="${dto.facSeq }"/></td>
	            		<td>${dto.spoName}</td>
	            		<td><img width="210" src="${dto.facImgpath }"></td>
	            		<td><a href="/facility/detail?facSeq=${dto.facSeq }">${dto.facName }</a></td>
	            		<td>${dto.facLocation }</td>
	            		<td></td>
	            	</tr>
	            </c:forEach>
	        </c:otherwise>
	    </c:choose>
    </table>
    </form>
</div>
</body>
</html>