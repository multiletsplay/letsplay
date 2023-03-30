<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nicknameChk").click(nicknameChk);
	});
	
	function openPopUpf() {
		let facSeq= $(event.target).attr('idx');
		window.name="mypage";
	    window.open("/member/reviewinsertform?facSeq="+facSeq, "리뷰", "width=720, height=400, top=150, left=200");
	}
	
	function openPopUpl() {
		let lesSeq= $(event.target).attr('idx');
		window.name="mypage";
	    window.open("/member/reviewinsertform?facSeq="+lesSeq, "리뷰", "width=720, height=400, top=150, left=200");
	}
	
	function openPopUpfu() {
		let facSeq= $(event.target).attr('idx');
		window.name="mypage";
	    window.open("/member/reviewupdateform?facSeq="+facSeq, "리뷰", "width=720, height=400, top=150, left=200");
	}
	
	function openPopUplu() {
		let lesSeq= $(event.target).attr('idx');
		window.name="mypage";
	    window.open("/member/reviewupdateform?facSeq="+lesSeq, "리뷰", "width=720, height=400, top=150, left=200");
	}
	
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

	function facdellike(){
		let facSeq = $(event.target).attr('idx');

		$.ajax({
			url : "/facility/dellikes",
			type : "GET",
			data : { 'facSeq' : facSeq },
			success : function(){
				window.location.reload();
			}
		});
	}
	
	function lesdellike(){
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

	function matdellike(){
		
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

<div class='mypageWrapper'>
<div class="tab_menu">
  <ul class="list">
    <li class="is_on listLI">
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
			<p>비밀번호</p>
			<input type="password" id="clientNickname" name="nickname" value="${member.password}">
			<!-- <div style='background-color:lightgrey'>${member.password}</div> -->
		</div>
		<div class='memberMod'>
			<p>이름</p>
			<input id='clientName' type="text" name="name" value="${member.name}">
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
    	<%-- 회원 정보 끝 --%>
    	
   <li class='listLI'>
      <a href="#tab2" class="btn"><h2>매치 내역</h2></a>
      <div id="tab2" class="cont">
      	<h3>매치 내역</h3>
        <p>내가 만든 매치, 참여한 매치 내역입니다.</p>
 			<div id='BookedMatch'>
			<c:choose>
				<c:when test="${empty list and empty joinlist }">
					<div class='BookedMatchSport'>
						<span>---- 등록된 매칭이 없습니다 ----</span>
					</div>
				</c:when>
				<c:otherwise>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var="dto">
						<div class="mb-20 lesson-list-l">
							<div>
								<div class="match-list">
									<p>
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
										</span>
										<span class="time">${dto.startTime } ~ ${dto.endTime }</span>
									</div>
									
									
								</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
					<c:if test ="${not empty joinlist }">
						<c:forEach items="${joinlist }" var="dto">
						<div class="mb-20 lesson-list-l">
							<div>
								<div class="match-list">
									<p>
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
										</span>
										<span class="time">${dto.startTime } ~ ${dto.endTime }</span>
									</div>
									
							
								</div>
							</div>
						</div>
					</c:forEach>
					</c:if>
				</c:otherwise>
			</c:choose>
 		</div>
		</div>
    </li>

    
    <%-- 매치 내역 끝 --%>
    
    <li class='listLI'>
      <a href="#tab3" class="btn"><h2>예약 내역</h2></a>
      <div id="tab3" class="cont">
     	 <h3>예약 내역</h3>
        <p>예약완료 된 목록을 한번에 확인 하실 수 있습니다.</p>
        
        <div class='PuckAge'>

      	 <div class="div_wrap">
      	  <c:choose>
	        <c:when test="${empty faclist}">
	         <p>------ 예약이 없습니다. ------</p>
	        </c:when>
	        <c:otherwise>
	        	<c:if test="${not empty faclist }">
		        <c:forEach items="${faclist }" var="dto">

         	 <div class='sectionDiv section01'>
	            <div class="match-list">
	                <p><span class="sports-category">시설</span></p>
	                <a href="/facility/detail?facSeq=${dto.facSeq }"><p class="match-title">${dto.facName }</p></a>
	                <p class="match-location">${dto.facLocation }</p>
	                <p class="match-location"><fmt:parseDate value="${dto.resDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both"/>
										<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd HH:mm" />
									</p>
	                <button class="review__btn" onclick="location.href='/member/cancelfacres?resId=${dto.resId }'">예약취소</button>
	                <c:if test="${dto.revStatus eq 1 }">
	                	<button idx="${dto.facSeq }" class="review__btn color_review" onclick="openPopUpfu()">후기 수정</button>
	                </c:if>
	                <c:if test="${dto.revStatus eq 0 }">
	                	<button idx="${dto.facSeq }" class="review__btn" onclick="openPopUpf()">후기 작성</button>
	              </c:if>
	            </div>
						</div>
      	  </c:forEach>
				</c:if>
			</c:otherwise>
					</c:choose>
						</div>


					<div class="div_wrap">
					<c:choose>
	        <c:when test="${empty leslist}">
	         <p>------ 예약이 없습니다. ------</p>
	        </c:when>
	        <c:otherwise>
					<c:if test="${not empty leslist }">
		            <c:forEach items="${leslist }" var="dto">
		             <div class="match-list section02" style='width:210px; position: static;'>
				          <p><span class="sports-category">레슨</span></p>
				          <a href="/lesson/detail?lesSeq=${dto.lesSeq }"><p class="match-title">${dto.lesName }</p></a>
				          <p class="match-location">${dto.lesLocation }</p>
				           <p class="match-location"><fmt:parseDate value="${dto.resDate}" pattern="yyyy-MM-dd HH:mm:ss" var="parsedDateTime" type="both"/>
								<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd HH:mm" />
								</p>
				          <button class="review__btn" onclick="location.href='/member/cancellesres?resId=${dto.resId }'">예약취소</button>
										<c:if test="${dto.revStatus eq 1 }">
											<button idx="${dto.lesSeq }" class="review__btn color_review" onclick="openPopUplu()">후기 수정</button>
										</c:if>
										<c:if test="${dto.revStatus eq 0 }">
											<button idx="${dto.lesSeq }" class="review__btn" onclick="openPopUpl()">후기 작성</button>
										</c:if>
				          </div>
		            </c:forEach>
	            </c:if>		
							</c:otherwise>
							</c:choose>
						</div>
       		</div>
       </div>
    </li>
    
    
    <%-- 찜한 목록 끝 --%>
    
    <li class='listLI'>
      <a href="#tab4" class="btn"><h2>1대1 문의</h2></a>
      <div id="tab4" class="cont">
      	<h3>1대1 문의</h3>
        <p>1대1 문의하신 내역입니다</p>
        <div id='inqWrapper'>
        <div class='inqList'>
			<ul>
				<li class='inqListNum'>번호</li>
				<li class='inqListTitle'>제목</li>
				<li class='inqListID'>ID</li>
				<li class='inqListChk'>답변상태</li>
				<li class='inqListDate'>날짜</li>
			</ul>
		</div>
		<c:choose>
			<c:when test="${empty inqlist }">
				<div style='display:flex; justify-content: center; margin: 20px 0;'>
					<span>---- 작성된 글이 없습니다 ----</span>
				</div>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${inqlist}" var="dto">
					<ul id='inqContentsList'>
						<li class='inqListNum'>${dto.inqSeq }</li>
						<li class='inqListTitle'><a href="/inquiry/detail?inqSeq=${dto.inqSeq }">${dto.inqTitle }</a></li>
						<li class='inqListID'>${dto.id }</li>
							<c:choose>
							<c:when test="${dto.replyCheck == 0 }"><li class='inqListChk'>답변대기</li></c:when>
							<c:otherwise><li class='inqListChk'>답변완료</li></c:otherwise>
						</c:choose>
						<li class='inqListDate'><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inqDate }"/></li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		</div>
	</div>
    </li>
    
    <%-- 1대1 문의 끝 --%>
    
    <!-- 예약 내역 끝  -->
    
    <li class='listLI'>
      <a href="#tab5" class="btn"><h2>찜한 내역</h2></a>
      <div id="tab5" class="cont">
      	<h3>찜한 내역</h3>
        <p>찜한 내역을 확인 하실 수 있습니다.</p>
     <div id="MakeSorting">
		<!-- <nav id="sorting-tab-button-nav">
			<button type="submit" name="type" value="M">매치</button>
			<button type="submit" name="type" value="F">시설</button>
			<button type="submit" name="type" value="L">레슨</button>
		</nav> -->
		
		
		<div class="likes-list">

		<c:choose>
			<c:when test="${empty likesfaclist and empty likesmatlist and empty likesleslist }">
				<span>------ 찜 목록이 없습니다. ------</span>
			</c:when>
			<c:otherwise>
	        	<c:if test="${not empty likesfaclist }">
		            <c:forEach items="${likesfaclist }" var="fac">					    
					    
					    <div class="facility-list-fl mr10">
									<input type="checkbox" class="delList" name="delList" value="${dto.facSeq }"/>
									<div class="facility">
										<a href="/facility/detail?facSeq=${fac.facSeq }">
											<p class="img">
												<span class="sports-category">${fac.spoName}</span>
												<img src="${fac.facImgpath }">
												<span class="fac-review">${fac.avgRate }점</span>
											</p>
										</a>
									<div>
										<a href="/facility/detail?facSeq=${fac.facSeq }">
											<p class="fac-title">${fac.facName }</p>
										</a>
										
										<p class="review-count">이용자 리뷰  ${fac.cntReview }개</p>
										
										<p style=" height: 19px; width: 240px;">
											<span class="match-location">${fac.facLocation }</span>
										</p>
										<div class="favorite">
											<c:choose>
												<c:when test="${fac.likesStatus eq 1 }">
													<img onclick="facdellike()" idx="${fac.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
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
	            </c:if>
	            <c:if test="${not empty likesleslist }">
		            <c:forEach items="${likesleslist }" var="les">					    
					    
					    <div class="facility-list-fl mr10">
									<input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/>
									<div class="lesson">
										<a href="/lesson/detail?lesSeq=${les.lesSeq }">
											<p class="img">
												<span class="sports-category">${les.spoName}</span>
												<img src="${les.lesImgpath }">
												<span class="les-review">${les.avgRate }점</span>
											</p>
										</a>
									<div>
										<a href="/lesson/detail?lesSeq=${les.lesSeq }">
											<p class="les-title">${les.lesName }</p>
										</a>
										
										<p class="review-count">이용자 리뷰  ${les.cntReview }개</p>
										
										<p style=" height: 19px; width: 240px;">
											<span class="lesson-location">${les.lesLocation }</span>
										</p>
										<div class="favorite">
											<c:choose>
												<c:when test="${les.likesStatus eq 1 }">
													<img onclick="lesdellike()" idx="${les.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
												</c:when>
												<c:otherwise>
													<img onclick="like()" idx="${dto.lescSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>

		            </c:forEach>
	            </c:if>
	            <c:if test="${not empty likesmatlist }">
		            <c:forEach items="${likesmatlist }" var="mat">

	            		<div class="mb-20 lesson-list-l">
							<div>
								<div class="match-list">
									<p>
										<span class="sports-category">${mat.spoName}</span>
										<span class="num-people">${mat.cntJoin }/${mat.matchTotal }명</span>
									</p>
									
									<a href="/match/detail?matchSeq=${mat.matchSeq }">
										<p class="match-title">${mat.matchTitle }</p>
									</a>
									<p class="match-location">${mat.matchLocation }</p>
									
									<div class="match-date">
										<span class="date">											
											<fmt:formatDate value="${mat.matchDay }" pattern="yyyy-MM-dd(E)" />
										</span>
										<span class="time">${mat.startTime } ~ ${mat.endTime }</span>
									</div>

									<div class="favorite">
											<c:choose>
												<c:when test="${mat.likesStatus eq 1 }">
													<img onclick="matdellike()" idx="${mat.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
												</c:when>
												<c:otherwise>
													<img onclick="like()" idx="${mat.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
												</c:otherwise>
											</c:choose>
										</div>
									
								</div>
							</div>
						</div>
		            </c:forEach>

	            </c:if>
	            
			</c:otherwise>
		</c:choose>
	</div>
	</div>
	</div>
    </li>
    
    
  </ul>
</div>
</div>

<script type="text/javascript">
const tabList = document.querySelectorAll('.tab_menu .list li.listLI');
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

<!-- <script>
    const $nav = document.querySelector('#tab-button-nav')
    const $sections = document.querySelectorAll('.tab-section');

    $nav.addEventListener('click', (e) => {
      if (!e.target.classList.contains('tab-button')) {
        return;
      }
      
      const focusedTabId = e.target.dataset.tabSection;

      $sections.forEach(($section) => {
        if ($section.id === focusedTabId) {
          $section.removeAttribute('hidden');
        } else {
          $section.setAttribute('hidden', true);
        }
      });
    });
  </script> -->
<%@ include file="footer.jsp" %>