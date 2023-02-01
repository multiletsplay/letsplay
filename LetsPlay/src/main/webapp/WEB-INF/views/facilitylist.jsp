<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var mem = '${member.type }';
		
		if (mem=='admin'){
			$("#insertBtn").css("visibility","visible");
			$("#deleteBtn").css("visibility","visible");
			$("#selectAll").show();
			$(".delList").show();
		}
		
		//전체체크 선택
		$('#selectAll').click(function(){
			var checked = $(this).is(':checked');
			
			$('.delList').prop("checked", checked);
		});
		
	});
	
	function like(){
		let facSeq = $(event.target).attr('idx');
		
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
		let facSeq = $(event.target).attr('idx');

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
	
</script>

<!-- 종목 선택 -->

<div class="container inner">
	<div class="row list">
<div>
	<div class="sport-div">
		<form action="/facility/select" method="get">
			<button type="button"  class="sport" name="spoId" onclick="location.href='/facility/list'">전체</button>
			<button type="submit"  class="sport" name="spoId" value="1">풋살</button>
			<button type="submit"  class="sport" name="spoId" value="2">테니스</button>
			<button type="submit"  class="sport" name="spoId" value="3">배드민턴</button>
			<button type="submit"  class="sport" name="spoId" value="4">탁구</button>
			<button type="submit"  class="sport" name="spoId" value="5">수영</button>
			<button type="submit"  class="sport" name="spoId" value="6">골프</button>
		</form>
	</div>

	<!-- 
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
	 -->
</div>
<!-- 상세조건검색 -->




<!-- 상세조건검색 예전-->
<div class="wrap__filter"> 
	<div id="facility-search">
		<form action="/facility/search" method="get">
			<div class="search__location">
				<h4>지역</h4>
				<div>
					<select id="region1" name="searchRegion1">
						<option value="">시/도</option>
						<option value="서울">서울</option>
					</select>
				</div>
				<div>
					<select id="region2" name="searchRegion2">
						<option value="">군/구</option>
						<option value="강남구">강남구</option>
						<option value="강동구">강동구</option>
						<option value="강북구">강북구</option>
						<option value="강서구">강서구</option>
						<option value="관악구">관악구</option>
						<option value="광진구">광진구</option>
						<option value="구로구">구로구</option>
						<option value="금천구">금천구</option>
						<option value="노원구">노원구</option>
						<option value="도봉구">도봉구</option>
						<option value="동대문구">동대문구</option>
						<option value="동작구">동작구</option>
						<option value="마포구">마포구</option>
						<option value="서대문구">서대문구</option>
						<option value="서초구">서초구</option>
						<option value="성동구">성동구</option>
						<option value="성북구">성북구</option>
						<option value="송파구">송파구</option>
						<option value="양천구">양천구</option>
						<option value="영등포구">영등포구</option>
						<option value="용산구">용산구</option>
						<option value="은평구">은평구</option>
						<option value="종로구">종로구</option>
						<option value="중구">중구</option>
						<option value="중랑구">중랑구</option>
					</select>
				</div>
			</div>

			<div class="search__location">
				<h4>날짜</h4>
				<div>
					<input type="date" name="serchDate">
				</div>
			</div>
		
			<div class="search__options">
				<h4>상세조건</h4>
				<ul class="list-facility">
					
					<li>
						<input id="facility-PARK" type="checkbox" name="optParking" value="true">
						<label for="facility-PARK">주차</label>
					</li>
					<li><input id="facility-RENT" type="checkbox" name="optLent" value="true">
							<label for="facility-RENT">장비대여</label>
						</li>
					<li><input id="facility-SWR" type="checkbox" name="optShower" value="true">
							<label for="facility-SWR" >샤워시설</label>
						</li>
					<li><input id="facility-STASH" type="checkbox" name="optLocker" value="true">
							<label for="facility-STASH">락커</label>
						</li>
					<li><input id="facility-LIGHT" type="checkbox" name="optLight" value="true">
							<label for="facility-LIGHT">조명</label>
						</li>					
				</ul>
			</div>

			<div class="search__options">
				<h4>가격</h4>
				<ul class="list-facility">
					<li><input id="fee-PAY" type="checkbox" name="optCost" value="T">
						<label for="fee-PAY">유료</label></li>
					<li><input id="fee-FREE" type="checkbox" name="optCost" value="F">
						<label for="fee-FREE">무료</label></li>
				</ul>
			</div>
			<input type="submit" id="search" value="검색" style="display: none;"/>
			<label for="search">
			<div class="filter-btn">
				<span class="material-symbols-outlined">search</span>
				<span>검색</span>		
			</div>
		</label>	
		</form>
	</div> 
</div>


<!-- 시설리스트 -->


<div id="facility-list">
	<form action="/facility/delete" method="post">
	<div>
		<p><input type="button" id="insertBtn" value="시설 추가" onclick="location.href='/facility/insertform'"></p>
		<p><input type="submit" id="deleteBtn" value="선택 삭제"></p>
	</div>
	    <c:choose>
	        <c:when test="${empty faclist }">
	            <div>------ 시설이 없습니다. ------</div>
	        </c:when>
	        <c:otherwise>
	            <c:forEach items="${faclist }" var="dto">
								<div class="facility-list-fl">
									<input type="checkbox" class="delList" name="delList" value="${dto.facSeq }"/>
									<div class="facility">
										<a href="/facility/detail?facSeq=${dto.facSeq }">
											<p class="img">
												<span class="sports-category">${dto.spoName}</span>
												<img src="${dto.facImgpath }">
												<span class="fac-review">점</span>
											</p>
										</a>
									<div>
										<a href="/facility/detail?facSeq=${dto.facSeq }">
											<p class="fac-title">${dto.facName }</p>
										</a>
										
										<p class="review-count">이용자 리뷰  ${dto.cntReview }개</p>
										
										<p style=" height: 19px; width: 240px;">
											<span class="match-location">${dto.facLocation }</span>
										</p>
										<div class="favorite">
											<c:choose>
												<c:when test="${dto.likesStatus eq 1 }">
													<img onclick="dellike()" idx="${dto.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
												</c:when>
												<c:otherwise>
													<img onclick="like()" idx="${dto.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
	            </c:forEach>
	        </c:otherwise>
	    </c:choose>
    </form>
</div>

</div>
</div>
<%@ include file="footer.jsp" %>