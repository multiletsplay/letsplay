<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>    

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=99a2faf19be558d2479cdc1cce8e0ae0&libraries=services"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(document).ready(function(){
		var mem = '${member.type }';
		var memid = '${member.id}';
		if (mem=='admin' || memid=='${dto.id}'){
			$("#updateBtn").css("visibility","visible");
			$("#deleteBtn").css("visibility","visible");
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
<div class="container inner pt40">

<form action="/lesson/reserve" method="POST">
<div class="m40 row">
<input type="hidden" name="lesSeq" value="${dto.lesSeq }">
<div class="col-lg-8">
	<form action="/lesson/delete" method="post">
		<p class="Mbtn">
			<input type="button" id="updateBtn" value="레슨 수정" onclick="location.href='/lesson/updateform?lesSeq=${dto.lesSeq}'">
			<input type="hidden" name="delList" value="${dto.lesSeq }"/>
			<input type="submit" id="deleteBtn" value="삭제하기" />
		</p>
	</form>
	<div>
		<div class="match_detail_lay">
			<main>
				<div class="main-content">
					<span class="sport-type">
						<button>${dto.spoName }</button>
					</span>
					<h2><input type="hidden" name="lesName" value="${dto.lesName }">${dto.lesName }</h2>
					<h5 style="margin-bottom: 30px;"><input type="hidden" name="lesTeacher" value="${dto.lesTeacher }">강사명 : ${dto.lesTeacher}</h5>
					<div class="carousel slide" style="margin-bottom: 20px;">
						<div class="carousel-inner">
							<div class="carousel-item active carousel-item-start">
								<input type="hidden" name="lesImgpath" value="${dto.lesImgpath }">
								<img class="d-block w-100" src="${dto.lesImgpath }" alt="${dto.lesImgpath }">
							</div>
						</div>
						
						<!-- <ul class="df">
							<li class="match-category">참가비</li>
							<li class="match-category">상세정보</li>
							<li class="match-category">주의사항</li>
							<li class="match-category">추천시설</li>
						</ul> -->
						<h4 style="margin-bottom: 7px; font-weight: bold;">레슨비</h4>
						
						<div><strong style="font-size: x-large; color: rgb(232, 13, 13);"><input type="hidden" name="resPrice" value="${dto.lesCost }">${dto.lesCost}</strong> 원/시간</div>
				
						<div class="info">
							<h4>상세정보</h4>
							<div>
								<div class="tel">
									<p><input type="hidden" name="lesContact" value="${dto.lesContact }">${dto.lesContact}</p>
								</div>


								<h4>레슨 종류</h4>
									<c:choose>
										<c:when test="${dto.lesType eq 'personal' }">
											<div class="icon_list">
												<span class="material-symbols-outlined fill">person</span>
												<span>개인</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="icon_list">
												<span class="material-symbols-outlined fill">groups</span>
												<span>그룹</span>
											</div>
										</c:otherwise>
									</c:choose>


									<c:choose>
										<c:when test="${dto.lesWeekend eq 'weekday' }">
											<div class="icon_list">
												<span class="material-symbols-outlined fill">date_range</span>
												<span>평일</span>
											</div>
										</c:when>
										<c:otherwise>
											<div class="icon_list">
												<span class="material-symbols-outlined fill">event</span>
												<span>주말</span>
											</div>
										</c:otherwise>
									</c:choose>


								

							</div>
						</div>
						<!--<hr>
						 <div class="info">
							<h4>주의사항</h4>
							<div>상세정보 어쩌구 저쩌고상세정보 어쩌구 저쩌고상세정보 어쩌구 저쩌고</div>
						</div> -->
						
						<div class="comment">
							<h4 style="margin: 40px auto;">후기</h4>
							<c:choose>
								<c:when test="${empty reviewlist }">
										<div>이 레슨에 대한 후기가 아직 없어요, 후기를 남겨주세요!</div>
								</c:when>
								<c:otherwise>
										<c:forEach items="${reviewlist }" var="review">
											<div class="review-list">
												<h5>${review.nickname}</h5>
												<span>${review.revContent }</span>
											
												<c:choose>
													<c:when test="${review.revRate ==1}" ><span class="star">⭐</span></c:when>
													<c:when test="${review.revRate ==2}" ><span class="star">⭐⭐</span></c:when>
													<c:when test="${review.revRate ==3}" ><span class="star">⭐⭐⭐</span></c:when>
													<c:when test="${review.revRate ==4}" ><span class="star">⭐⭐⭐⭐</span></c:when>
													<c:otherwise ><span class="star">⭐⭐⭐⭐⭐</span></c:otherwise>
												</c:choose>
												</div>	

										</c:forEach>
								</c:otherwise>
						</c:choose>
							
			
						</div>
						<p style="margin-top: 20px;" onclick="location.href='/lesson/list'">목록</p>
						<!-- <input type="button" value="목록" class="list_btn" onclick="location.href='/lesson/list'"> -->
					</div>
				</div>
				</main>
				
			</div>
		</div>
	</div>
	
	<div class="col-lg-4">
		<div class="main-banner">
	

			<div>
				<div class="favorite">
					<c:choose>
						<c:when test="${like == 0}">
							<img id="likeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
						</c:when>
						<c:otherwise>
							<img id="dellikeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
						</c:otherwise>
					</c:choose>
				</div>
				<div class="check-display">LESSON</div>
				<h3 style="margin-bottom: 10px;">${dto.lesName }</h3>
				<div style="margin-bottom: 3px;" name="facLocation"><input type="hidden" name="lesLocation" value="${dto.lesLocation }">${dto.lesLocation}</div>
				<div style="margin-bottom: 15px;" class="location__btn"><input type="button" value="길찾기" id="pathfinding"></div>
				<div style="font-size: small;"><input type="date" id="resDate" data-placeholder="날짜 선택" name="resDate"></div>
				<!-- <h3 style="margin-bottom: 15px;">2022.12.30(수)</h3> -->
				<div class="time" style="font-size: small; margin-bottom: 7px;">
					<select name="resStarttime" id="resTime">
						<option value="">시간을 선택해주세요</option>
						<c:forEach items="${schlist }" var="sch">
							<option value="${sch.schStarttime }" <c:if test='${sch.cntRes eq sch.schPeople}'>disabled='disabled'</c:if>>${sch.schStarttime } ~ ${sch.schEndtime }</option>
						</c:forEach>
					</select>
				</div>
				<!-- <button style="border-radius: 10%; border-style: none; background-color: gold; margin-bottom: 17px; padding: 5px 8px;">11:30</button> -->
				<div>
					<input type="submit" value="예약하기" class="re__Btn" />
				</div>
			</div>
		</div>
	</div>

	<!--
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
				<select name="resStarttime" id="resTime">
					<option value="">시간을 선택해주세요</option>
					<c:forEach items="${schlist }" var="sch">
						<option value="${sch.schStarttime }" <c:if test='${sch.cntRes eq sch.schPeople}'>disabled='disabled'</c:if>>${sch.schStarttime } ~ ${sch.schEndtime }</option>
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
	-->
	</form>
	<!--
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
-->
</div>
</div>
<%@ include file="footer.jsp" %>