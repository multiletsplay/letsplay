<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		
		//상세조건 펼침버튼
		$('#optionBtn').click(function(){
			$('.searchOption').toggle('active');
		});
		
		
		//찜
		$("#likeBtn").click(like);
		$("#dellikeBtn").click(dellike);
		});
	
	function like(){
		let matchSeq = $(this).attr('idx');
		
		$.ajax({
			url : "/match/likes",
			type : "POST",
			data : { 'matchSeq' : matchSeq },
			success : function(){
				alert("찜 성공");
				window.location.reload();
			}
		});
	}
	
	function dellike(){
		let matchSeq = $(this).attr('idx');
		$.ajax({
			url : "/match/dellikes",
			type : "GET",
			data : { 'matchSeq' : matchSeq },
			success : function(){
				alert("취소 성공");
				window.location.reload();
			}
		});
}
	</script>

<div class="container inner">
<div class="row">

<div>
	<div class="sport-div">
		<form action="/match/category"  method="get">
			<button type="button" class="sport" name="spoId" onclick="location.href='/match/list'">전체</button>
			<button type="submit"  class="sport" name="spoId" value="1">풋살</button>
			<button type="submit"  class="sport" name="spoId" value="2">테니스</button>
			<button type="submit"  class="sport" name="spoId" value="3">배드민턴</button>
			<button type="submit"  class="sport" name="spoId" value="4">탁구</button>
			<button type="submit"  class="sport" name="spoId" value="5">수영</button>
			<button type="submit"  class="sport" name="spoId" value="6">골프</button>
		</form>
	</div>
<!-- 
<form action="/match/category"  method="get">
  <button type="button" name="spoId" onclick="location.href='/match/list'"><img src="../../img/football.jpg" width="35px">전체</button>
  <button type="submit" name="spoId" value="1"><img src="../../img/football.jpg" width="35px">풋살</button>
  <button type="submit" name="spoId" value="2"><img src="../../img/football.jpg" width="35px">테니스</button>
  <button type="submit" name="spoId" value="3"><img src="../../img/football.jpg" width="35px">배드민턴</button>
  <button type="submit" name="spoId" value="4"><img src="../../img/football.jpg" width="35px">탁구</button>
  <button type="submit" name="spoId" value="5"><img src="../../img/football.jpg" width="35px">수영</button>
  <button type="submit" name="spoId" value="6"><img src="../../img/football.jpg" width="35px">골프</button>
</form> -->
</div>



<!-- 상세조건검색 -->


<div class="row">
	<form action="/match/search" method="get">
	<div class="wrapper">
				<!-- 지금 내 주변에서 찾기 -->
			<div class="col-lg-3">
				<div class="wrapper-search_type with-layer">
					<button class="btn-clear btn-search_type select location">지역<span class="material-symbols-outlined">arrow_drop_down</span></button>
					<div class="layer-search  false">
						<div class="wrap-input">
							<div class="wrap-input">
								<button class="btn-clear btn-search"></button>
								<span class="material-symbols-outlined search-icon">search</span>
								<input type="text" placeholder="지역명 검색해보세요.">
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
										<option value="관악구">관악구</option>
										<option value="중구">중구</option>
									</select>
								</span>
								<button class="btn-clear">검색</button>
							</div>
							
							<div class="wrap-button">
								<button class="btn-clear btn-nearby">지금 내 주변에서 찾기</button>
							</div>
						</div>
					</div>
				</div>
			</div>

			

		<!-- 인원 -->
		<div class="col-lg-3">
			<div class="wrapper-search_type with-layer">
				<button class="btn-clear btn-search_type select">인원<span class="material-symbols-outlined">arrow_drop_down</span></button>
				<div class="layer-search false">
					<div class="wrap-picker">
						<h4 class="search-subtitle">인원</h4>
						<div class="box-input">
							<button class="btn-clear btn-minus"><span class="material-symbols-outlined">remove</span></button>
							<input type="number" readonly="" class="value" value="0">
							<button class="btn-clear btn-plus"><span class="material-symbols-outlined">add</span></button>
						</div>
						
						<div class="btn-list">
							<button class="btn-clear btn-yellow filter">초기화</button>
							<button class="btn-clear btn-green filter">인원수 적용하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- 날짜 -->
		<div class="col-lg-3">
			<div class="wrapper-search_type with-layer">
				<button class="btn-clear btn-search_type select select_calendar">날짜<span class="material-symbols-outlined">arrow_drop_down</span></button>
				<div class="layer-search false">
					<div class="wrap-calendar">
						<h4 class="search-subtitle">날짜 선택</h4>
					</div>
				</div>
			</div>
		</div>

		<!-- 상세조건 -->
		<div class="wrap-search">
			<div class="filter">
				<div class="filter-btn" id="optionBtn" for="optionBtn">
					<span class="material-symbols-outlined">tune</span>
					<span>필터</span>
				</div>
				
				<div class="layer-search searchOption" >
					<div class="wrap-filter wrap-checkbox">
						<div class="wrap-filter last"><h4 class="search-subtitle">편의시설</h4>
							<ul class="list-facility">
								<li>
									<input id="facility-SWR" type="checkbox" name="facility" value="SWR"><label for="facility-SWR">샤워시설</label>
								</li>
								<li>
									<input id="facility-PARK" type="checkbox" name="facility" value="PARK"><label for="facility-PARK">주차</label>
								</li>
								<li>
									<input id="facility-STASH" type="checkbox" name="facility" value="STASH"><label for="facility-STASH">개인락커</label></li>
								
								<li><input id="facility-INTLT" type="checkbox" name="facility" value="INTLT"><label for="facility-INTLT">내부화장실</label></li>
								<li><input id="facility-FITRM" type="checkbox" name="facility" value="FITRM"><label for="facility-FITRM">탈의실</label></li>
							</ul>
						</div>
						
					<div class="wrap-filter last">
						<h4 class="search-subtitle">레벨</h4>
						<ul class="list-level">
							<li>
								<input id="level-starter" type="checkbox" name="level" value="starter">
								<label for="level-starter">스타터</label>
							</li>
							
							<li>
								<input id="level-beginner" type="checkbox" name="level" value="beginner">
								<label for="level-beginner">비기너</label>
							</li>
							<li>
								<input id="level-amateur" type="checkbox" name="level" value="amateur">
								<label for="level-amateur">아마추어</label>
							</li>
							<li>
								<input id="level-semipro" type="checkbox" name="level" value="semipro">
								<label for="level-semipro">세미프로</label>
							</li>
							<li>
								<input id="level-pro" type="checkbox" name="level" value="pro">
								<label for="level-pro">프로</label>
							</li>
						</ul>
					
					</div>
				</div>
				
					<div class="btn-list">
						<button class="btn-clear btn-yellow filter">초기화</button>
						<button class="btn-clear btn-green filter">필터 적용하기</button>
					</div>
				</div>
			</div>
			<div class="filter">
				<div class="filter-btn">
					<span class="material-symbols-outlined">search</span>
					<span>검색</span>
				</div>
			</div>
		</div>
	</div>
</form>
</div>

<!-- 기존 -->
<div id="match-search">
	<h3>지역 매칭찾기</h3>
	<!-- 지역	 / 날짜 / 필터 : 유무료, 주차, 장비대여, 샤워시설, 락커, 조명 -->
	<span><strong>지역</strong>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<strong>날짜</strong></span>
	<form action="/match/search" method="get">
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
				<option value="관악구">관악구</option>
				<option value="중구">중구</option>
			</select>
		</span>
		<span>
			<input type="date" id="date" name="searchDate" value="">
		</span>
		<div>
			<strong>상세조건</strong>
			<input type="checkbox" >
			<label>▼ 열기</label>
			<ul >
				<li><input type="time" name="searchStartTime" min="05:00" value="" step="900"><label>시작시간</label>
				<li><input type="checkbox" name="searchFacStatus" value="Y" checked><label>시설확정여부</label>
				<li><input type="range" name="searchLevel" value="3" min="1" max="5"><label>레벨</label>
				<li><input type="number" name="searchTotal" value="2" min="2" max="22"><label>참가인원</label>
			</ul>
		</div>
		<span><input type="submit" value="검색"></span>
	</form>
</div>


	<div>
		<table border="1">
			<col width="100">
			<col width="100">
			<col width="100">
			<col width="300">
			<col width="120">
			<col width="150">
			<col width="175">
			<col width="100">
			<col width="100">
			<col width="100">
			<tr>
				<td><c:out value="${cnt}"/>명이 현재 매칭 중!</td>
				<td><c:out value="${endcnt}"/>건이 마감되었습니다.</td>
			</tr>
			<tr align="center">
				<th>찜</th>
				<th>작성자</th>
				<th>종목</th>
				<th>제목</th>
				<th>매칭날짜</th>
				<th>남은날짜</th>
				<th>장소</th>
				<th>시작시간 ~ 종료시간</th>
				<th>참여인원/총인원</th>
				<th>레벨</th>
				<th>댓글 수</th>
				<td></td>
			</tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="11" align="center">등록된 매칭이 없습니다.</td>
					</tr>
				</c:when>
				
			
				<c:otherwise>
					<c:forEach items="${list }" var="dto">
						<tr align="center">
							<td>
								<c:choose>
					   				<c:when test="${dto.likesStatus eq 1 }">
					   					<img id="dellikeBtn" idx="${dto.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
					   				</c:when>
					   				<c:otherwise>
					   					<img id="likeBtn" idx="${dto.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
					   				</c:otherwise>
					   			</c:choose>
							</td>
							<td>${dto.nickName }</td>
							<td>${dto.spoName}</td>
							<td><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></td>
							<td><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" />
<%-- 							<fmt:parseDate  value="${dto.matchEnddate}"  --%>
<%-- 								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/> --%>
<%-- 							<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /></td> --%>
							<td>
								<c:forEach var="i" items="${ddays }">
									<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
										마감 ${i.value }일 전
									</c:if>
								</c:forEach>
							</td>
							<td>${dto.matchLocation }</td>
							<td>${dto.startTime } ~ ${dto.endTime }</td>
							<td>${dto.cntJoin }/${dto.matchTotal }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
							<td><input type="hidden" value="${dto.matchSeq } " name="matchSeq" ></td>
<%-- 							<td><input type="hidden" value="${dto.matchRegdate }" name="matchRegdate"></td> --%>
<%-- 							<td><fmt:formatDate type="hidden" value="${dto.matchRegdate}" pattern="yyyy-MM-dd" /></td> --%>
<!-- 							<td> -->
<%-- 							<fmt:formatDate type="hidden" value="${dto.matchRegdate}" pattern="yyyy-MM-dd" /></td> --%>
<!-- 							<td> -->
						</tr>
						
					</c:forEach>
					<c:forEach items="${end }" var="end">
						<tr align="center" bgcolor="gray">
							<td>
							<c:choose>
			   				<c:when test="${end.likesStatus eq 1 }">
			   					<img id="dellikeBtn" idx="${end.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
			   				</c:when>
			   				<c:otherwise>
			   					<img id="likeBtn" idx="${end.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
			   				</c:otherwise>
			   			</c:choose>
			   			</td>
							<td>${end.nickName }</td>
							<td>${end.spoName}</td>
							<td>${end.matchTitle }</td>
							<td><fmt:formatDate value="${end.matchDay }" pattern="yyyy-MM-dd(E)" /></td>
<!-- 							<td> -->
<%-- 							<fmt:parseDate value="${end.matchEnddate}"  --%>
<%-- 								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/> --%>
<%-- 							<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /></td> --%>
<!-- 							<td> -->
							<td><c:forEach var="i" items="${dEnddays }">
									<c:if test="${end.matchSeq eq i.key.matchSeq }" >
										마감
         							 </c:if>
								</c:forEach>
							</td>
							<td>${end.matchLocation }</td>
							<td>${end.startTime } ~ ${end.endTime }</td>
							<td>${end.cntJoin }/${end.matchTotal }</td>
							<td>${end.matchLevel }</td>
							<td>${end.cntComment }</td>
							<td><input type="hidden" value="${end.matchSeq } " name="matchSeq" ></td>
							
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
			<tr>
				<td colspan="11" align="right">
					<input type="button" value="매칭등록" onclick="location.href='/match/insertform'">
				</td>
			</tr>
		</table>
	</div>

	<!-- 리스트 -->
	<div>
		<div class="mb-20 col-md-4 col-lg-3">
			<div>
				<div class="match-list">
					<p>
						<span class="deadline">마감 10일 전</span>
						<span class="sports-category">테니스</span>
						<span class="num-people">4명</span>
					</p>
					
					<a href="/matching/1">
						<p class="match-title">테니스 매칭구합니다.</p>
					</a>
					<p class="match-location">서울시 강서구 화곡동</p>
					
					<div class="match-date">
						<span class="date">2023-01-09</span>
						<span class="time">10</span>
					</div>
					
					<div class="favorite">
						<i class="ri-heart-line"></i>
					</div>
				</div>
			</div>
		</div>

	</div>




<!-- container, row -->
	</div>
</div>
<%@ include file="footer.jsp" %>