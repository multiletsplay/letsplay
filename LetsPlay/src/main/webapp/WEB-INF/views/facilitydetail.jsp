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
		if (mem=='admin'){
			$("#updateBtn").css("visibility","visible");
		}
		
		$("#pathfinding").click(pathFinding);
		$("#likeBtn").click(like);
		$("#dellikeBtn").click(dellike); 

		$("#resDate").change(function(){
			var selectBox = $("#resTime");
	       	selectBox.children().remove();
	        
	       	const rdate = $("#resDate").val();
	       	var date = rdate.toString();
           	selectBox.append("<option value=''>=== 선택 ===</option>");
           	<c:forEach var="time" items="${time }">
           	<fmt:formatDate value="${time.dt}" pattern="yyyy-MM-dd" var="t"/>
			if (date == '${t}')
				selectBox.append("<option value='${time.time }' <c:if test='${time.resStatus eq 1}'>disabled='disabled'</c:if>>${time.time }</option>");
			</c:forEach> 
	    });
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
		<div class="container inner pt40">
			<p class="Mbtn"><input type="button" id="updateBtn" value="수정하기" onclick="location.href='/facility/updateform?facSeq=${dto.facSeq}'"></p>
			<form action="/facility/reserve" method="POST">
			<div class="m40 row">
				<input type="hidden" name="facSeq" value="${dto.facSeq }" >
				<div class="col-lg-8">
					<div>
						<div class="match_detail_lay">
							<main>
								<div class="main-content">
									<span class="sport-type">
										<button>${dto.spoName }</button>
									</span>
									<h2>${dto.facName }</h2>
									<div class="carousel slide" style="margin-bottom: 20px;">
										<div class="carousel-inner">
											<div class="carousel-item active carousel-item-start">
												<img class="d-block w-100" src="${dto.facImgpath }" alt="${dto.facImgpath }">
											</div>
										</div>
										
										<ul class="df">
											<li class="match-category">참가비</li>
											<li class="match-category">상세정보</li>
											<li class="match-category">주의사항</li>
											<li class="match-category">추천시설</li>
										</ul>
										<h4 style="margin-bottom: 7px; font-weight: bold;">시설비</h4>
										
										<div><strong style="font-size: x-large; color: rgb(232, 13, 13);">${dto.facCost }</strong>원/시간</div>
								
										<div class="info">
											<h4>상세정보</h4>
											<div>
												<p>시설 전화 번호 : ${dto.facContact }</p>
												<c:choose>
													<c:when test="${dto.facParking eq true }">
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/7212/7212181.png">
													</c:when>
													<c:otherwise>
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/7212/7212164.png">
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${dto.facLent eq true }">
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/1574/1574169.png">
													</c:when>
													<c:otherwise>
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/1574/1574603.png">
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${dto.facShower eq true }">
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/2008/2008485.png">
													</c:when>
													<c:otherwise>
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/2008/2008489.png">
													</c:otherwise>
												</c:choose>
												<c:choose>
													<c:when test="${dto.facLocker eq true }">
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/1529/1529858.png">
													</c:when>
													<c:otherwise>
														<img width="50" src="https://cdn-icons-png.flaticon.com/512/1529/1529756.png">
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
											</div>
										</div>
										<!--<hr>
										 <div class="info">
											<h4>주의사항</h4>
											<div>상세정보 어쩌구 저쩌고상세정보 어쩌구 저쩌고상세정보 어쩌구 저쩌고</div>
										</div> -->
										<h4 style="margin: 40px auto;">후기</h4>
										<div class="comment">
											<c:choose>
												<c:when test="${empty reviewlist }">
														<td colspan="3">------ 후기가 없습니다. ------</td>
												</c:when>
												<c:otherwise>
														<c:forEach items="${reviewlist }" var="review">
															<div>
																<h5>${review.nickname}</h5>
																<span>${review.revContent }</span>
															</div>	
	
																<c:choose>
																	<c:when test="${review.revRate ==1}" ><span>⭐</span></c:when>
																	<c:when test="${review.revRate ==2}" ><span>⭐⭐</span></c:when>
																	<c:when test="${review.revRate ==3}" ><span>⭐⭐⭐</span></c:when>
																	<c:when test="${review.revRate ==4}" ><span>⭐⭐⭐⭐</span></c:when>
																	<c:otherwise ><span>⭐⭐⭐⭐⭐</span></c:otherwise>
																</c:choose>
														</c:forEach>
												</c:otherwise>
										</c:choose>
											
							
										</div>
									</div>
								</div>
								</main>
								
							</div>
						</div>
					</div>
					
					<div class="col-lg-4">
						<div class="main-banner">
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
		
							<div>
								<div class="check-display">FACILITY</div>
								<h3 style="margin-bottom: 10px;">${dto.facName }</h3>
								<div style="margin-bottom: 3px;" name="facLocation">${dto.facLocation }</div>
								<div style="margin-bottom: 15px;" class="location__btn"><input type="button" value="길찾기" id="pathfinding"></div>
								<div style="font-size: small;"><input type="date" id="resDate" data-placeholder="날짜 선택" name="resDate"></div>
								<!-- <h3 style="margin-bottom: 15px;">2022.12.30(수)</h3> -->
								<div class="time" style="font-size: small; margin-bottom: 7px;">
									<select id="resTime" name="resStarttime">
										<option value="">예약 시간을 선택해주세요</option>
									</select>
								</div>
								<!-- <button style="border-radius: 10%; border-style: none; background-color: gold; margin-bottom: 17px; padding: 5px 8px;">11:30</button> -->
								<div>
									<button class="join-btn" type="submit">참여하기</button>
								</div>
							</div>
						</div>
					</div>




<!-- form action="/facility/reserve" method="POST">
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
			<td><input type="date" id="resDate" name="resDate"></td>
			<th>시간</th>
			<td>
				-->
				<!-- <input type="time" id="resStarttime" name="resStarttime"> -->
					<!--<select id="resTime" name="resStarttime">
					<option value="">=== 시간 ===</option>
				</select>
			</td>
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
<hr> -->
	<!-- 
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
-->
</div>
</form>
</div>
<%@ include file="footer.jsp" %>