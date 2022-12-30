<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=앱키"></script>
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
<p>시간</p>
<button>예약하기</button>
<p>가격</p>

</body>
</html>