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
		
		//상세조건 펼침버튼
		$('#optionBtn').click(function(){
			$('.searchOption').toggle('active');
		});
		
		//찜
		$("#likeBtn").click(like);
		$("#dellikeBtn").click(dellike);
		
	});
	
	function like(){
		let facSeq = $(this).attr('idx');
		
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
		let facSeq = $(this).attr('idx');
		console.log(facSeq);
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
			<span>
				<select id="region1" name="searchRegion1">
					<option value="">시/도</option>
					<option value="서울">서울</option>
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
					<li>가격
					<li><input type="checkbox" name="optCost" value="T"><label>유료</label>
					<li><input type="checkbox" name="optCost" value="F"><label>무료</label>
				</ul>
			</div>
			<span><input type="submit" value="검색"></span>
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
										
										<p>
											<span class="match-location">${dto.facLocation }</span>
										</p>
										<div class="favorite">
											<c:choose>
												<c:when test="${dto.likesStatus eq 1 }">
													<img id="dellikeBtn" idx="${dto.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
												</c:when>
												<c:otherwise>
													<img id="likeBtn" idx="${dto.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
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