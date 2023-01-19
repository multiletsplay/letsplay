<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<a href="/match/list" style="text-decoration:none"><font size="20">매칭게시판</font></a>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		
		
		//상세조건 펼침버튼
		$('#optionBtn').click(function(){
			$('.searchOption').toggle('active');
		});
		
		});
		
		//찜
		$("#likeBtn").click(like);
		$("#dellikeBtn").click(dellike);
	
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
			data : { 'match' : matchSeq },
			success : function(){
				alert("취소 성공");
				window.location.reload();
			}
		});
}
	</script>
<div>
<form action="/match/category"  method="get">
  <button type="button" name="spoId" onclick="location.href='/match/list'"><img src="../../img/football.jpg" width="35px">전체</button>
  <button type="submit" name="spoId" value="1"><img src="../../img/football.jpg" width="35px">풋살</button>
  <button type="submit" name="spoId" value="2"><img src="../../img/football.jpg" width="35px">테니스</button>
  <button type="submit" name="spoId" value="3"><img src="../../img/football.jpg" width="35px">배드민턴</button>
  <button type="submit" name="spoId" value="4"><img src="../../img/football.jpg" width="35px">탁구</button>
  <button type="submit" name="spoId" value="5"><img src="../../img/football.jpg" width="35px">수영</button>
  <button type="submit" name="spoId" value="6"><img src="../../img/football.jpg" width="35px">골프</button>
</form>
</div>
<!-- 상세조건검색 -->
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
			<input type="checkbox" id="optionBtn">
			<label for="optionBtn">▼ 열기</label>
			<ul class="searchOption">
				<li><input type="checkbox" name="searchFacStatus" value="Y" checked><label>시설확정여부</label>
				<li><input type="range" name="searchLevel" value="3" min="1" max="5"><label>레벨</label>
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
				<th>마감일자</th>
				<th>남은날짜</th>
				<th>장소</th>
				<th>시작시간 ~ 종료시간</th>
				<th>참여인원/총인원</th>
				<th>레벨</th>
				<th>댓글 수</th>
				<td><input type="hidden" value="${dto.matchSeq } " name="matchSeq" ></td>
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
							<td>${dto.id }</td>
							<td>${dto.spoName}</td>
							<td><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></td>
							<td>
							<fmt:parseDate  value="${dto.matchEnddate}" 
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
							<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /></td>
							<td>
								<c:forEach var="i" items="${ddays }">
									<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
										마감 ${i.value }일 전
									</c:if>
								</c:forEach>
							</td>
							<td>${dto.matchLocation }</td>
							<td>${dto.startTime } ~ ${dto.endTime }</td>
							<td>${dto.matchCnt }/${dto.matchTotal }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
<%-- 							<td><input type="hidden" value="${dto.matchRegdate }" name="matchRegdate"></td> --%>
<%-- 							<td><fmt:formatDate type="hidden" value="${dto.matchRegdate}" pattern="yyyy-MM-dd" /></td> --%>
							<td>
<%-- 							<fmt:formatDate type="hidden" value="${dto.matchRegdate}" pattern="yyyy-MM-dd" /></td> --%>
							<td>
						</tr>
						
					</c:forEach>
					<c:forEach items="${end }" var="end">
						<tr align="center" bgcolor="gray">
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
							<td>${end.id }</td>
							<td>${end.spoName}</td>
							<td>${end.matchTitle }</td>
							<td>
							<fmt:parseDate value="${end.matchEnddate}" 
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
							<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /></td>
							<td>
								<c:forEach var="i" items="${dEnddays }">
									<c:if test="${end.matchSeq eq i.key.matchSeq }" >
										마감
         							 </c:if>
								</c:forEach>
							</td>
							<td>${end.matchLocation }</td>
							<td>${end.startTime } ~ ${end.endTime }</td>
							<td>${end.matchCnt }/${end.matchTotal }</td>
							<td>${end.matchLevel }</td>
							<td>${end.cntComment }</td>
							
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

</body>
</html>