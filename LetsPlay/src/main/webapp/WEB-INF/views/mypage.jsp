<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nicknameChk").click(nicknameChk);
	
		//찜
		$("#dellikeBtn").click(dellike);
	});
	function nicknameChk(){
		let nickname = $("#nickname").val().trim();
		
		$.ajax({
			url:"/member/nicknamecheck",
			type:"get",
			data:{ "nickname" : nickname },	
			success:function(data){
				if(data == 1){
					alert("이미 사용중인 닉네임입니다.");
					$("#signup").attr("type", "button");
				}else{
					alert("사용 가능한 닉네임입니다.");
				}
			},
			error:function(){
				alert("통신 실패");
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



<style>
  .tab_menu{position:relative;}
  .tab_menu .list{overflow:hidden;}
  .tab_menu .list li{float:left; margin-right:14px;}
  .tab_menu .list .btn{font-size:13px;}
  .tab_menu .list .cont{display:none; position:absolute;}
  .tab_menu .list li.is_on .btn{font-weight:bold; color:green;}
  .tab_menu .list li.is_on .cont{display:block;}
</style>

</head>
<body>


<div class='mypageWrapper'>
<div class="tab_menu">
  <ul class="list">
    <li class="is_on">
      <a href="#tab1" class="btn"><h2>회원 정보</h2></a>
      <div id="tab1" class="cont">
            <h3>프로필</h3>
            <p>정보 수정이 가능합니다</p>
      	<div class='memberProfile'>
		
			<form action="/member/update" method="POST">
		<div>
		<div class='memberMod'>
			<p>아이디</p>
			<div style='background-color:lightgrey'>${member.id}</div>
		</div>
		<div class='memberMod'>
			<p>생년월일</p>
			<div style='background-color:lightgrey'>${member.birth}</div>
		</div>
		<div class='memberMod'>
			<p>비밀번호</p>
			<div style='background-color:lightgrey'>${member.password}</div>
		</div>
		<div class='memberMod'>
			<p>이름</p>
			<input id='clientName' type="text" name="name" value="${member.name}">
		</div>
		<div class='memberMod'>
			<p>성별</p>
			<div style='background-color:lightgrey'>${member.gender}</div>
		</div>
		<div class='memberMod'>
			<p>닉네임</p>
			<input type="text" id="clientNickname" name="nickname" value="${member.nickname}">
			<button type="button" id="clientNicknameChk">중복확인</button>
		</div>	
		<div class='memberMod'>
			<p>이메일</p>
			<input id="Email" type="text" name="email" value="${member.email}">
		</div>
		<div class='memberMod'>
			<p>전화번호</p>
			<input id='clientNum' type="text" name="phone" value="${member.phone}">
		</div>
		
	</div>
		<div>
			<input id='confirmMod' type="submit" value="수정 완료" >
		</div>
	<div>
		<input id='withdrawl' type="button" value="회원 탈퇴" onclick="location.href='/member/delete'">
	</div>
	</form>
	</div>
	

      	
      </div>
      
    </li>
    	<!-- 회원 정보 끝 -->
    	
   <li>
      <a href="#tab2" class="btn"><h2>매치 내역</h2></a>
      <div id="tab2" class="cont">
      	<h3>매치 내역</h3>
        <p>매치가 완료 된 목록을 한번에 확인 하실 수 있습니다.</p>
 			<div id='BookedMatch'>
				<div class='BookedMatchInform'>
					<span style='flex-basis:90px; text-align: center;'>작성자</span>
					<span style='flex-basis:80px; text-align: center;'>종목</span>
					<span style='flex-basis:200px; text-align: center;'>제목</span>
					<span style='flex-basis:140px; text-align: center;'>매칭날짜</span>
					<span style='flex-basis:140px; text-align: center;'>남은날짜</span>
					<span style='flex-basis:100px; text-align: center;'>장소</span>
					<span style='flex-basis:120px; text-align: center;'>시작시간 ~ 종료시간</span>
					<span style='flex-basis:70px; text-align: center;'>참여인원/총인원</span>
					<span>레벨</span>
					<span>댓글 수</span>
				</div>
			<c:choose>
				<c:when test="${empty list and empty joinlist }">
					<div class='BookedMatchSport'>
						<span>---- 등록된 매칭이 없습니다 ----</span>
					</div>
				</c:when>
				<c:otherwise>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var="dto">
						<div id='bookedMatchFirst'>
							<span>${dto.nickName }</span>
							<span>${dto.spoName}</span>
							<span><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></span>
							<span><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" /></span>
							<span>
							  <c:forEach var="i" items="${ddays }">
							    <c:if test="${dto.matchSeq eq i.key.matchSeq }" >
							      마감 ${i.value }일 전
							    </c:if>
							  </c:forEach>
							</span>
							<span>${dto.matchLocation }</span>
							<span>${dto.startTime } ~ ${dto.endTime }</span>
							<span>${dto.cntJoin }/${dto.matchTotal }</span>
							<span>${dto.matchLevel }</span>
							<span>${dto.cntComment }</span>
							</div>
					</c:forEach>
					</c:if>
					<c:if test ="${not empty joinlist }">
						<c:forEach items="${joinlist }" var="dto">
						<div id='bookedMatchSecond'>
							<span>${dto.nickName }</span>
							<span>${dto.spoName}</span>
							<span><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></span>
							<span><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" /></span>
							<span>
								<c:forEach var="i" items="${ddays2 }">
									<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
										마감 ${i.value }일 전
									</c:if>
								</c:forEach>
							</span>
							<span>${dto.matchLocation }</span>
							<span>${dto.startTime } ~ ${dto.endTime }</span>
							<span>${dto.cntJoin }/${dto.matchTotal }</span>
							<span>${dto.matchLevel }</span>
							<span>${dto.cntComment }</span>
						</div>
					</c:forEach>
					</c:if>
				</c:otherwise>
			</c:choose>
 		</div>
		</div>
    </li>

    
    <!-- 매치 내역 끝 -->
    
    <li>
      <a href="#tab3" class="btn"><h2>예약 내역</h2></a>
      <div id="tab3" class="cont">
     	 <h3>예약 내역</h3>
        <p>예약완료 된 목록을 한번에 확인 하실 수 있습니다.</p>
			<form action="/member/mypage/resselect" method="get">
		<button type="submit" name="type" value="F">시설</button>
		<button type="submit" name="type" value="L">레슨</button>
</form>
<div id="reserv-list">
	<br><br>
	<table border="1">
		<tr>
			<th>예약날짜</th>
			<th>시설/레슨</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
	    <c:choose>
	        <c:when test="${empty faclist and empty leslist }">
	            <td colspan="5">------ 예약이 없습니다. ------</td>
	        </c:when>
	        <c:otherwise>
	        	<c:if test="${not empty faclist }">
		            <c:forEach items="${faclist }" var="dto">
	           			<tr style='border: 1px solid red;'>
		            		<td>${dto.resDatetime }</td>
		            		<td>시설</td>
		            		<td><a href="/facility/detail?facSeq=${dto.facSeq }">${dto.facName }</a></td>
		            		<td>${dto.facLocation }</td>
		            		<c:if test="${dto.revStatus eq 1 }">
		            			<td><input type="button" value="후기 수정" onclick="location.href='/member/reviewupdateform?facSeq=${dto.facSeq }'"></td>
		            		</c:if>
		            		<c:if test="${dto.revStatus eq 0 }">
		            			<td><input type="button" value="후기 작성" onclick="location.href='/member/reviewinsertform?facSeq=${dto.facSeq }'"></td>
		            		</c:if>
		            		<td><input type="button" value="예약 취소" onclick="location.href='/member/cancelfacres?resId=${dto.resId }'"></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	            <c:if test="${not empty leslist }">
		            <c:forEach items="${leslist }" var="dto">
	           			<tr>
		            		<td>${dto.resDatetime }</td>
		            		<td>레슨</td>
		            		<td><a href="/lesson/detail?lesSeq=${dto.lesSeq }">${dto.lesName }</a></td>
		            		<td>${dto.lesLocation }</td>
		            		<c:if test="${dto.revStatus eq 1 }">
		            			<td><input type="button" value="후기 수정" onclick="location.href='/member/reviewupdateform?lesSeq=${dto.lesSeq }'"></td>
		            		</c:if>
		            		<c:if test="${dto.revStatus eq 0 }">
		            			<td><input type="button" value="후기 작성" onclick="location.href='/member/reviewinsertform?lesSeq=${dto.lesSeq }'"></td>
		            		</c:if>
		            		<td><input type="button" value="예약 취소" onclick="location.href='/member/cancellesres?resId=${dto.resId }'"></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	        </c:otherwise>
	    </c:choose>
    </table>
</div>
		</div>
    </li>
    
    <!-- 예약 내역 끝 -->
    
    <li>
      <a href="#tab4" class="btn"><h2>찜한 내역</h2></a>
      <div id="tab4" class="cont">
		<form action="/member/mypage/likeselect" method="get">
		<button type="submit" name="type" value="M">매치</button>
		<button type="submit" name="type" value="F">시설</button>
		<button type="submit" name="type" value="L">레슨</button>
</form>
<div class="likes-list">

		<c:choose>
			<c:when test="${empty likesfaclist and empty likesmatlist and empty likesleslist }">
				<td colspan="6">------ 찜 목록이 없습니다. ------</td>
			</c:when>
			<c:otherwise>
	        	<c:if test="${not empty likesfaclist }">
	        	<table>
						
		            <c:forEach items="${likesfaclist }" var="fac">
	           			<li class="n-prd-row" onclick="active_list('check_1535332');">
       						<a href="/facility/detail?facSeq=${fac.facSeq }" class="img-block">
        					    <img id="facImageSource" src="${fac.facImgpath}" alt="시설 사진">
      					    </a>
	         			    <ul class="info">
					            <li class="brand"><button id="facSpoBtn">${fac.spoName}</button></li>
					            <li class="name"><a style='font-size:24px; font-weight:bold;' href="/facility/detail?facSeq=${fac.facSeq }">${fac.facName }</a></li>
					            <li class="price">
					                <em>${fac.facLocation }</em>
					            </li>
					            <li class="like"><div class="n-like like-sm"><img id="dellikeBtn" idx="${fac.facSeq }" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png" alt="좋아요"><span>이용자 리뷰 ${fac.cntReview }개</span></div></li>
					        </ul>
					    </li>
		            </c:forEach>
		            </table>
	            </c:if>
	            <c:if test="${not empty likesmatlist }">
	            <table border="1">
						<tr>
							<th>날짜</th>
							<th>시간</th>
							<th>종목</th>
							<th>총인원</th>
							<th>제목</th>
							<th>시설명</th>
							<th>찜여부</th>
						</tr>
		            <c:forEach items="${likesmatlist }" var="mat">
	           		
	           			<tr>
<%-- 	           				<td><fmt:formatDate pattern="MM.dd" value="${mat.matchRegdate}"/></td> --%>
							<td>
							<fmt:parseDate  value="${mat.matchRegdate}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
							<fmt:formatDate value="${parsedDateTime}" pattern="MM.dd" /></td>

	           				<td>${mat.startTime } ~ ${mat.endTime }</td>
		            		<td>${mat.spoName}</td>
		            		<td>${mat.matchTotal }
		            		<td><a href="/match/detail?matchSeq=${mat.matchSeq }">${mat.matchTitle }</a></td>
		            		<td></td>
		            		<td>
				   					<img id="dellikeBtn" idx="${mat.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
		            		</td>
	            		</tr>
		            </c:forEach>
		            </table>
	            </c:if>
	            <c:if test="${not empty likesleslist }">
	            <table border="1">
						<tr>
							<th>종목</th>
							<th>이미지</th>
							<th>시설/레슨명</th>
							<th>리뷰개수</th>
							<th>주소</th>
							<th>찜여부</th>
						</tr>
		            <c:forEach items="${likesleslist }" var="les">
	           			
	           			<tr>
		            		<td>${les.spoName}</td>
		            		<td><img width="100" src="${les.lesImgpath }"></td>
		            		<td><a href="/lesson/detail?lesSeq=${les.lesSeq }">${les.lesName }</a></td>
		            		<td>${les.lesLocation }</td>
		            		<td>이용자 리뷰 ${les.cntReview }개</td>
		            		<td>
				   					<img id="dellikeBtn" idx="${les.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
		            		</td>
	            		</tr>
		            </c:forEach>
		            </table>
	            </c:if>
			</c:otherwise>
		</c:choose>
	</div>
    </li>
    
    <!-- 찜한 목록 끝 -->
    
    <li>
      <a href="#tab5" class="btn"><h2>1대1 문의</h2></a>
      <div id="tab5" class="cont">
      	<h3>1대1 문의</h3>
        <p>1대1 문의하신 내역입니다</p>
        <div id='inqWrapper'>
        <div class='inqList'>
			<ul>
				<li class='inqListNum'>번호</li>
				<li class='inqListChk'>답변상태</li>
				<li class='inqListTitle'>제목</li>
				<li class='inqListID'>ID</li>
				<li class='inqListDate'>날짜</li>
			</ul>
		</div>
		<c:choose>
			<c:when test="${empty inqlist }">
				<div style='display:flex; justify-content: center; margin: 20px 0;'>
					<div>---- 작성된 글이 없습니다 ----</div>
				</div>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${inqlist}" var="dto">
					<ul id='inqContentsList'>
						<li class='inqListNum'>${dto.inqSeq }</li>
						<c:choose>
							<c:when test="${dto.replyCheck == 0 }"><li class='inqListChk'>답변대기</li></c:when>
							<c:otherwise><li class='inqListChk'>답변완료</li></c:otherwise>
						</c:choose>
						<li class='inqListTitle'><a href="/inquiry/detail?inqSeq=${dto.inqSeq }">${dto.inqTitle }</a></li>
						<li class='inqListID'>${dto.id }</td>
						<li class='inqListDate'><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inqDate }"/></li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		</div>
	</div>
    </li>
    
    <!-- 1대1 문의 끝 -->
    
  </ul>
</div>
</div>

<script type="text/javascript">
const tabList = document.querySelectorAll('.tab_menu .list li');
for(var i = 0; i < tabList.length; i++){
  tabList[i].querySelector('.btn').addEventListener('click', function(e){
    e.preventDefault();
    for(var j = 0; j < tabList.length; j++){
      tabList[j].classList.remove('is_on');
    }
    this.parentNode.classList.add('is_on');
  });
}
</script>
<%@ include file="footer.jsp" %>