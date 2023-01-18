<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonDetail</title>
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
	
	function pathFinding(){
		var geocoder = new kakao.maps.services.Geocoder();
		// 주소로 좌표를 검색
		geocoder.addressSearch('${dto.lesLocation}', function(result, status) {
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
			//결과값으로 받은 위도 경도 변수에 저장
	        var coordsy = new kakao.maps.LatLng(result[0].y);	//위도
	        var latitude = coordsy['Ma'];
	        var coordsx = new kakao.maps.LatLng(result[0].x);	//경도
	        var longitude = coordsx['Ma'];
	     
	        var lesName = '${dto.lesName }';
	        
	        /* safari에선 미리 팝업을 띄우고 주소변경하는 방법 안됨. chrome기준 적용*/
	        var pop = window.open("about:blank", "_blank");
	        $.ajax({
	        	success:function(data){
	        		pop.location.href="https://map.kakao.com/link/to/"+lesName+","+latitude+","+longitude;
	        	}
	        });
	     }
		});
	}
	
	function like(){
		let lesSeq = ${dto.lesSeq};
		
		$.ajax({
			url : "/lesson/likes",
			type : "POST",
			data : { 'lesSeq' : lesSeq },
			success : function(){
				alert("찜 성공");
				window.location.reload();
			}
		});
	}
	
	function dellike(){
		let lesSeq = ${dto.lesSeq};
		$.ajax({
			url : "/lesson/dellikes",
			type : "GET",
			data : { 'lesSeq' : lesSeq },
			success : function(){
				alert("취소 성공");
				window.location.reload();
			}
		});
	}
</script>
</head>
<body>
<form action="/lesson/reserve" method="POST">
<input type="hidden" name="lesSeq" value="${dto.lesSeq }">
	<table border="1">
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
			<td>${dto.spoName}</td>
		</tr>
		<tr>
			<th>레슨 이름</th>
			<td><input type="hidden" name="lesName" value="${dto.lesName }">${dto.lesName}</td>
		</tr>
		<tr>
			<th>강사</th>
			<td><input type="hidden" name="lesTeacher" value="${dto.lesTeacher }">${dto.lesTeacher}</td>
		</tr>
		<tr>
			<th></th>
			<td><input type="hidden" name="lesImgpath" value="${dto.lesImgpath }"><img width="300" src="${dto.lesImgpath }"></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="hidden" name="lesLocation" value="${dto.lesLocation }">${dto.lesLocation}</td>
			<td><input type="button" value="길찾기" id="pathfinding"></td>
		</tr>
		<tr>
			<th>연락처</th>
			<td><input type="hidden" name="lesContact" value="${dto.lesContact }">${dto.lesContact}</td>
		</tr>
		<tr>
			<th>날짜</th>
			<td><input type="date" name="resDate"></td>
			<th>시간</th>
			<td>
				<select name="resStarttime">
					<option value="">시간을 선택해주세요</option>
					<c:forEach items="${schlist }" var="sch">
						<option value="${sch.schStarttime }">${sch.schStarttime } ~ ${sch.schEndtime }</option>
					</c:forEach>
				</select>
			</td>
		</tr>
		<tr>
			<th>레슨 비용</th>
			<td><input type="hidden" name="resPrice" value="${dto.lesCost }">${dto.lesCost}</td>
		</tr>
		<tr>
			<th>레슨 종류</th>
			<c:choose>
				<c:when test="${dto.lesType eq 'personal' }">
					<td>개인</td>
				</c:when>
				<c:otherwise>
					<td>그룹</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<th>레슨 평일/주말</th>
			<c:choose>
				<c:when test="${dto.lesWeekend eq 'weekday' }">
					<td>평일</td>
				</c:when>
				<c:otherwise>
					<td>주말</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td colspan="2">
				<input type="button" value="목록" onclick="location.href='/lesson/list'">
				<input type="button" id="updateBtn" value="레슨 수정" onclick="location.href='/lesson/updateform?lesSeq=${dto.lesSeq}'">
				<input type="submit" value="예약하기">
			</td>
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
            <div>------ 후기가 없습니다. ------</div>
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