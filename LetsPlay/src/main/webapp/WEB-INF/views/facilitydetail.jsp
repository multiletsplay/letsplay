<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#updateBtn { visibility: hidden; }
</style>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=앱키&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(document).ready(function(){
		var mem = '${member.type }';
		if (mem=='admin'){
			$("#updateBtn").css("visibility","visible");
		}
		
		$("#pathfinding").click(pathFinding);
		$("#likeBtn").click(like);
		$("#dellikeBtn").click(dellike);
	});
	
	function like(){
		let facSeq = ${dto.facSeq};
		
		$.ajax({
			url : "/facility/likes",
			type : "POST",
			data : { 'facSeq' : facSeq },
			success : function(){
				alert("찜 성공");
				window.location.reload();
			}
		});
	}
	
	function dellike(){
		let facSeq = ${dto.facSeq};
		$.ajax({
			url : "/facility/dellikes",
			type : "GET",
			data : { 'facSeq' : facSeq },
			success : function(){
				alert("취소 성공");
				window.location.reload();
			}
		});
	}
	
	function pathFinding(){
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색
		geocoder.addressSearch('${dto.facLocation}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
			//결과값으로 받은 위도 경도 변수에 저장
	        var coordsy = new kakao.maps.LatLng(result[0].y);	//위도
	        var latitude = coordsy['Ma'];
	        var coordsx = new kakao.maps.LatLng(result[0].x);	//경도
	        var longitude = coordsx['Ma'];
	     
	        var facName = '${dto.facName }';
	        
	        /* safari에선 미리 팝업을 띄우고 주소변경하는 방법 안됨. chrome기준 적용*/
	        var pop = window.open("about:blank", "_blank");
	        $.ajax({
	        	success:function(data){
	        		pop.location.href="https://map.kakao.com/link/to/"+facName+","+latitude+","+longitude;
	        	}
	        });
	        
	        /* 방법1.
		       $.ajax({
	            url :"/facility/pathfind",
	            type :"POST",
	            data : { facName : facName, coordsy : latitude, coordsx : longitude },
	            success : function(data) {
	            },
	            errer: function(){
	            	alert("길찾기 실패");
	            }
		    }); */
		    /* 방법2
	           $.ajax("https://map.kakao.com/link/to/"+facName+","+latitude+","+longitude)
	        .done(function(data){
	          alert("success");
	        })
	        .fail(function(){
	          alert("fail");
	        }) */
	     }
		});
	}
</script>
</head>
<body>
<input type="button" id="updateBtn" value="수정하기" onclick="location.href='/facility/updateform?facSeq=${dto.facSeq}'">
<br><br>
<form action="/facility/reserve" method="POST">
<input type="hidden" name="facSeq" value="${dto.facSeq }" >
	<table class="facility-infrom" border="1" >
		<tr>
			<td>
				<c:choose>
	   				<c:when test="${like == 0}">
	   					<img id="likeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
	   				</c:when>
	   				<c:otherwise>
	   					<img id="dellikeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
	   				</c:otherwise>
	   			</c:choose>
			</td>
		</tr>
		<tr>
			<th>종목</th>
			<td>${dto.spoName }</td>
		</tr>
		<tr>
			<th>시설명</th>
			<td><input type="hidden" name="facName" value="${dto.facName }">${dto.facName }</td>
		</tr>
		<tr>
			<th></th>
			<td><input type="hidden" name="facImgpath" value="${dto.facImgpath }"><img width="300" src="${dto.facImgpath }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="hidden" name="facLocation" value="${dto.facLocation }">${dto.facName }</td>
			<td><input type="button" value="길찾기" id="pathfinding"></td>
		</tr>
		<tr>
			<th>시설전화번호</th>
			<td><input type="hidden" name="facContact" value="${dto.facContact }">${dto.facContact }</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><input type="date" name="resDate"></td>
			<th>시간</th>
			<td><input type="time" name="resStarttime"></td>
			<td><input type="time" name="resEndtime"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="hidden" name="resPrice" value="${dto.facCost }">${dto.facCost }</td>
		</tr>
		<tr>
			<td colspan="5" align="right">
				<input type="submit" value="예약하기">
			</td>
		</tr>
	</table>
<hr>
	<!-- 상세정보 -->
	<h3>상세정보</h3>
	<table class="facility-detail" border="1">
		<tr>
			<c:choose>
				<c:when test="${dto.facParking eq true }">
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/7212/7212181.png"></td>
				</c:when>
				<c:otherwise>
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/7212/7212164.png"></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dto.facLent eq true }">
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/1574/1574169.png"></td>
				</c:when>
				<c:otherwise>
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/1574/1574603.png"></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dto.facShower eq true }">
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/2008/2008485.png"></td>
				</c:when>
				<c:otherwise>
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/2008/2008489.png"></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dto.facLocker eq true }">
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/1529/1529858.png"></td>
				</c:when>
				<c:otherwise>
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/1529/1529756.png"></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dto.facLight eq true }">
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/430/430887.png"></td>
				</c:when>
				<c:otherwise>
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/430/430998.png"></td>
				</c:otherwise>
			</c:choose>
			<c:choose>
				<c:when test="${dto.facCostcheck eq true }">
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/2933/2933116.png"></td>
				</c:when>
				<c:otherwise>
					<td><img width="50" src="https://cdn-icons-png.flaticon.com/512/2933/2933038.png"></td>
				</c:otherwise>
			</c:choose>
		</tr>
	</table>
</form>
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
            <td colspan="3">------ 후기가 없습니다. ------</td>
        </c:when>
        <c:otherwise>
            <c:forEach items="${reviewlist }" var="review">
            	<tr>
            		<td>${review.nickname}</td>
            		<td>${review.revContent }</td>
            		<c:choose>
		            	<c:when test="${review.revRate ==1}" ><td>⭐</td></c:when>
		            	<c:when test="${review.revRate ==2}" ><td>⭐⭐</td></c:when>
		            	<c:when test="${review.revRate ==3}" ><<td>⭐⭐⭐</td></c:when>
		            	<c:when test="${review.revRate ==4}" ><td>⭐⭐⭐⭐</td></c:when>
		            	<c:otherwise ><td>⭐⭐⭐⭐⭐</td></c:otherwise>
	            	</c:choose>
            	</tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</table>
</body>
</html>