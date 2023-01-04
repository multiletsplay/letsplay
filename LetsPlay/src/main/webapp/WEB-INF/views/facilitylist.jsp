<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
p { width: 230px; font-size: 14px;}
#multi-delete { margin-left: 700px; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$('#deleteBtn').on('click', function(){
			var $checked = $('#dataList input[type=checkbox]:checked');
			
			if($checked.length<1){
				alert('삭제할 시설을 선택해주세요.');
				return false;
			}
			
			$.each($checked, function(k, v) {
				console.log( $(this).val() );
			});
		});
	});
</script>
</head>
<body>
<h1>시설리스트</h1>
<!-- 상세조건검색 -->
<div id="facility-search">
	<h3>지역 시설찾기</h3>
	<!-- 지역	 / 날짜 / 필터 : 유무료, 주차, 장비대여, 샤워시설, 락커, 조명 -->
	<span><strong>지역</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>날짜</strong></span>
	<form action="/faciility/search" method="get">
		<span>
			<select id="region1" name="searchRegion1">
				<option value="강남구">강남구</option>
				<option value="강동구">강동구</option>
				<option value="강북구">강북구</option>
				<option value="강서구">강서구</option>
			</select>
		</span>
		<span>
			<select id="region2" name="searchRegion2">
				<option value="개포동">개포동</option>
				<option value="논현동">논현동</option>
				<option value="도곡동">도곡동</option>
				<option value="대치동">대치동</option>
			</select>
		</span>
		<span>
			<input type="date" id="date" name="searchDate" >
		</span>
		<span><input type="button" value="검색"></span>
	</form>
	
</div>

<!-- 시설리스트 -->
<div id="facility-list">
	<form action="/facility/delete" method="post">
	<div id="multi-delete">
		<input type="submit" value="선택 삭제">
	</div>
	<br><br>
	<table border="1">
		<tr>
			<th><input type="checkbox"></th>
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
	            		<td><input type='checkbox' name='delList' value='${dto.facSeq }'/></td>
	            		<td>${dto.spoName}</td>
	            		<td><img width="210" src="${dto.facImg }"></td>
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