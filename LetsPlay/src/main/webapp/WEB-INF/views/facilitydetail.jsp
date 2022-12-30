<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=앱키"></script>
<!-- jQuery UI CSS파일 -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
<!-- jQuery 기본 js파일 -->
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<!-- jQuery UI라이브러리 js파일 -->
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<script>
	$(function(){
		$("#datepicker").datepicker({
			dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
			dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'],
			monthNamesShort: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
			monthNmaes: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
		
			onSelect: function(){
				var date = $.datepicker.formatDate("yymmdd", $("#datepicker").datepicker("getDate"));
				date = $("#datepicker").val();
				alert(date);
			}
		});
	});
</script>
</head>
<body>
<p>${dto.spoName }</p>
<p>${dto.facName }</p>
<p><img width="300" src="${dto.facImg }"></p>
<p>${dto.facLocation }</p>
<a href="https://map.kakao.com/link/to/${dto.facName },37.495650,126.918885">길찾기</a>
<!-- <div id="map" style="width:500px;height:400px;"></div>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};  
	
	//지도 생성 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 주소-좌표 변환 객체 생성
	var geocoder = new kakao.maps.services.Geocoder();

	var callback = function(result, status) {
	    if (status === kakao.maps.services.Status.OK) {
	        console.log(result);
	    }
	};

	geocoder.addressSearch('${dto.facLocation}', callback);
	    
	});    
</script> -->
<p>날짜</p>
<input type="text" id="datepicker">
<p>시간</p>
<button>예약하기</button>
<p>가격</p>
<hr>
<h3>후기</h3>
<table border="1">
	<tr>
			<th>닉네임</th>
			<th>후기내용</th>
			<th>별점</th>
		</tr>
	    <c:choose>
	        <c:when test="${empty reviewlist }">
	            <div>------ 후기가 없습니다. ------</div>
	        </c:when>
	        <c:otherwise>
	            <c:forEach items="${reviewlist }" var="review">
	            	<tr>
	            		<td>${review.nickname}</td>
	            		<td>${review.revContent }</td>
	            		<td>${review.revRate }</td>
	            	</tr>
	            </c:forEach>
	        </c:otherwise>
	    </c:choose>
</table>
</body>
</html>