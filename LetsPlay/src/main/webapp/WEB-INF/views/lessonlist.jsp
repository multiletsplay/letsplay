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
		
		if (mem=='biz'){
			$("#insertBtn").css("visibility","visible");
		}
		
		$('#selectAll').click(function(){
			var checked = $(this).is(':checked');
			
			$('.delList').prop("checked", checked);
		});
		
	});
	
	function like(){
		let lesSeq = $(event.target).attr('idx');
		
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
		let lesSeq = $(event.target).attr('idx');
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
<div class="container inner">
	<div class="row list">

<!-- 종목 선택 -->

<div class="sport-div">
	<form action="/lesson/select" method="get">
		<button type="button"  class="sport" name="spoId" onclick="location.href='/lesson/list'">전체</button>
		<button type="submit"  class="sport" name="spoId" value="1">풋살</button>
		<button type="submit"  class="sport" name="spoId" value="2">테니스</button>
		<button type="submit"  class="sport" name="spoId" value="3">배드민턴</button>
		<button type="submit"  class="sport" name="spoId" value="4">탁구</button>
		<button type="submit"  class="sport" name="spoId" value="5">수영</button>
		<button type="submit"  class="sport" name="spoId" value="6">골프</button>
	</form>
</div>


<!-- 상세조건검색 예전-->
<div class="wrap__filter"> 
	<div id="facility-search">
		<form action="/lesson/search" method="get">
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
		
			<div class="search__options">
				<h4>레슨종류</h4>
				<ul class="list-facility">
					
					<li>
						<input id="lesson-PERSONAL" type="checkbox" name="optType" value="personal">
						<label for="lesson-PERSONAL">개인</label>
					</li>
					<li><input id="lesson-GROUP" type="checkbox" name="optType" value="group">
							<label for="lesson-GROUP">그룹</label>
					</li>		
				</ul>
			</div>

			<div class="search__options">
				<h4>평일/주말</h4>
				<ul class="list-facility">
					<li><input id="date-WEEKDAY" type="checkbox" name="optWeekend" value="weekday">
						<label for="date-WEEKDAY">평일</label></li>
					<li><input id="date-WEEKEND" type="checkbox" name="optWeekend" value="weekend">
						<label for="date-WEEKEND">주말</label></li>
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


<div id="lessonlist">
	<form action="/lesson/delete" method="post">
	<div>
		<input id="selectAll" type="checkbox">
		<input type="submit" id="deleteBtn" value="선택 삭제">
	</div>

	<div class="facility-list">
			<c:choose>
					<c:when test="${empty lessonlist }">

							<p style="text-align: center;">아직 등록된 레슨이 없습니다.  조금만 기다려주세요!</p>

					</c:when>
					<c:otherwise>
						<c:forEach items="${lessonlist }" var="dto">
				<div class="lesson-list-l">
					<input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/>
					<div class="lesson">
						<a href="/lesson/detail?lesSeq=${dto.lesSeq}">
							<p class="img">
								<span class="sports-category">${dto.spoName}</span>
								<img src="${dto.lesImgpath }">
							</p>
						</a>
						
						<div>
							<a href="/lesson/detail?lesSeq=${dto.lesSeq}">
								<p class="fac-title">${dto.lesName }</p>
							</a>
							<p class="review-count">이용자 리뷰 ${dto.cntReview }개</p>
							<p><span class="match-location">${dto.lesLocation }</span></p>
							
							<div class="favorite">
								<c:choose>
									<c:when test="${dto.likesStatus eq 1 }">
										<img onclick="dellike()" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
									</c:when>
									<c:otherwise>
										<img onclick="like()" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				</c:forEach> 
			</c:otherwise>
		</c:choose>
	</div>

<!-- <table border="1">
		<tr>
			<th><input id="selectAll" type="checkbox"></th>
			<th>스포츠 종류</th>
			<th>사진</th>
			<th>레슨 이름</th>
			<th>주소</th>
			<th>리뷰 수</th>
			<th>찜</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty lessonlist }">
				<tr>
					<td colspan="4">---- 등록된 레슨이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${lessonlist }" var="dto">
					<tr>
						<td><input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/></td>
						<td>${dto.spoName }</td>
						<td><img width="210" src="${dto.lesImgpath }"></td>
						<td><a href="/lesson/detail?lesSeq=${dto.lesSeq}">${dto.lesName }</a></td>
						<td>${dto.lesLocation }</td>
						<td>이용자 리뷰 ${dto.cntReview }개</td>
	            		<td>
	            		<c:choose>
			   				<c:when test="${dto.likesStatus eq 1 }">
			   					<img id="dellikeBtn" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
			   				</c:when>
			   				<c:otherwise>
			   					<img id="likeBtn" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
			   				</c:otherwise>
			   			</c:choose>
	            		</td>
					</tr>
				</c:forEach> 
			</c:otherwise>
		</c:choose>
	</table>  -->
	</form>
	<input type="button" id="insertBtn" value="레슨 추가" onclick="location.href='/lesson/insertform'">
</div>

</div>
</div>
<%@ include file="footer.jsp" %>