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
		
	});
		//찜
	function like(){
		let matchSeq = $(event.target).attr('idx');
		
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
		let matchSeq = $(event.target).attr('idx');
		
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
<div class="container">

		<div>
			<div class="sport-div">
			<form action="/match/category"  method="get">
				<button type="button"  class="sport" name="spoId" onclick="location.href='/match/list'">전체</button>
				<button type="submit"  class="sport" name="spoId" value="1">풋살</button>
				<button type="submit"  class="sport" name="spoId" value="2">테니스</button>
				<button type="submit"  class="sport" name="spoId" value="3">배드민턴</button>
				<button type="submit"  class="sport" name="spoId" value="4">탁구</button>
				<button type="submit"  class="sport" name="spoId" value="5">수영</button>
				<button type="submit"  class="sport" name="spoId" value="6">골프</button>
				<!-- <button type="button" name="spoId" onclick="location.href='/match/list'"><img src="../../img/football.jpg" width="35px">전체</button>
				<button type="submit" name="spoId" value="1"><img src="../../img/football.jpg" width="35px">풋살</button>
				<button type="submit" name="spoId" value="2"><img src="../../img/football.jpg" width="35px">테니스</button>
				<button type="submit" name="spoId" value="3"><img src="../../img/football.jpg" width="35px">배드민턴</button>
				<button type="submit" name="spoId" value="4"><img src="../../img/football.jpg" width="35px">탁구</button>
				<button type="submit" name="spoId" value="5"><img src="../../img/football.jpg" width="35px">수영</button>
				<button type="submit" name="spoId" value="6"><img src="../../img/football.jpg" width="35px">골프</button> -->
			</form>
			</div>
		</div>

	<div class="inner">
	<div class="row list">

<!-- 상세조건검색 -->
<div class="wrap__filter"> 
<div id="facility-search">

	<!-- 지역	 / 날짜 / 필터 : 유무료, 주차, 장비대여, 샤워시설, 락커, 조명 -->

	<form action="/match/search" method="get">
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
				<input type="date" id="date" name="searchDate" value="">
			</div>
		</div>

		<div class="search__location">
			<h4>참가인원</h4>
			<div class="counting">
				<input type='button' onclick="fnCalCount('m', this);" value='-'/>
			 <span class="countspan">
				<span class="bseq_ea" style="display: none;">22</span>
					<!-- <label for="count_people" id='result'>2</label><span> 명</span> -->
					<input type="text" name="searchTotal" value="2" min="2" max="22" id="count_people" style="width: 100%;"> 
				</span>	
				<input type='button' onclick="fnCalCount('p',this);"value='+'/>
			</div>
		</div>

	<div class="search__options">
		<h4>상세조건 </h4>
		<input type="checkbox" id="optionBtn">
		<label for="optionBtn" >▼ 열기</label>
			<ul class="searchOption">
				<li><input type="time" name="searchStartTime" min="05:00" value="" step="900"> <label>시작시간</label>
				<li><input type="checkbox" name="searchFacStatus" value="Y" checked> <label>시설확정여부</label>
				<li><input type="range" name="searchLevel" value="3" min="1" max="5" oninput="document.getElementById('levelmatch').innerHTML=this.value;"> 
					<span style="margin-left: 15px;">레벨: </span><span id="levelmatch">3</span>
				
			</ul>
		</div>
		<input type="submit" value="검색" id="search" style="display: none;">
		<label for="search">
			<div class="filter-btn">
				<span class="material-symbols-outlined">search</span>
				<span>검색</span>		
			</div>
		</label>	
	</form>
</div>
</div>

<!-- 리스트 영역 -->
<div>

		<div class="facility-list">
		<c:choose>
			<c:when test="${empty list }">
				<div>아직, 등록된 매칭이 없습니다. 매칭등록만들기를 통해 매칭을 즐겨보세요!</div>
			</c:when>
			<c:otherwise>
				<c:forEach items="${list }" var="dto">	
						<div class="mb-20 lesson-list-l">
							<div>
								<div class="match-list">
									<p>
										<span class="deadline">
											<c:forEach var="i" items="${ddays }">
												<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
													마감 ${i.value }일 전
												</c:if>
											</c:forEach>
										</span>
										<span class="sports-category">${dto.spoName}</span>
										<span class="num-people">${dto.cntJoin }/${dto.matchTotal }명</span>
									</p>
									
									<a href="/match/detail?matchSeq=${dto.matchSeq }">
										<p class="match-title">${dto.matchTitle }</p>
									</a>
									<p class="match-location">${dto.matchLocation }</p>
									
									<div class="match-date">
										<span class="date">											
											<fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" />
											<%-- 							<fmt:parseDate  value="${dto.matchEnddate}"  --%>
											<%-- 								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/> --%>
											<%-- 							<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /> --%>
										</span>
										<span class="time">${dto.startTime } ~ ${dto.endTime }</span>
									</div>
									
									<div class="favorite">
										<c:choose>
												<c:when test="${dto.likesStatus eq 1 }">
													<img onclick="dellike()" idx="${dto.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
												</c:when>
												<c:otherwise>
													<img onclick="like()" idx="${dto.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
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
		
		<!-- <input type="button" value="매칭등록" onclick="location.href='/match/insertform'"> -->

</div>

<script>
	function fnCalCount(type, ths){
			var $input = $(ths).parents("div.counting").find("input[name='searchTotal']");
			var tCount = Number($input.val());
			var tEqCount = Number($(ths).parents("div").find("span.bseq_ea").html());
			
			if(type=='p'){
					if(tCount < tEqCount){
						$input.val(Number(tCount)+1)
					}else{
						alert("더 이상 추가하실 수 없습니다.");
					};
			}else{
					if(tCount > 2) {
						$input.val(Number(tCount)-1);
					}else if(tCount == 2){
						alert("최소 인원 본인포함 2명 입니다.");   
					}
	}
	}
		</script>




		</div>
	</div>
</div>
	<%@ include file="footer.jsp" %>