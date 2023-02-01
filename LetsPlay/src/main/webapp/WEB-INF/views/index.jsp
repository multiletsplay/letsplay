<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="header.jsp" %>

<!-- <h1>letsplay</h1>
<br>
각자 리스트로 이동하는 url 넣어서 테스트해보시면 될것같아요
<h2><a href="/match/list">매치</a></h2>
<br>
<h2><a href="/facility/list">시설</a></h2>
<br>
<h2><a href="/lesson/list">레슨</a></h2>
<br>
<h2><a href="/notice/list">공지사항</a></h2>
<br>
<h2><a href="/faqcontent">faq</a></h2>
<br>
<h2><a href="/inquiry/list">1대1문의</a></h2>
<br>
<h2><a href="/member/loginform">로그인</a></h2>
<br>
<h2><a href="/member/mypage">마이페이지</a></h2>
<br> -->

<!-- 메인 -->

<section class="visual">
   <div class="inner align-contents">
      <div class="hero__content">
        <p class="hero__subtitle">위치기반 실시간 운동매칭 서비스</p>
        <h2>Let's Play with US!</h2>
        <p>
        렛플레이는 위치기반·실시간 운동매칭 서비스로 <br />
        사용자들끼리 매칭을 통해 
        운동 메이트와 함께 운동을 할 수 있습니다<br />
        <br />
        </p>

        <button class="buy__btn">MATCHING NOW</button>
    </div>

    <div class="hero__img">
        <img src="./img/01.png" alt="" />
      </div>
   </div>
</section>

<section>
  <div class="services">
    <div class="container inner">
      <div class="row">
        <div class="col-md-3 col-lg-4 service">
          <a href="/match/list">
            <div class="service__item" style="background: rgb(253, 239, 230);">
              <span class="material-symbols-outlined">
                hub
                </span>
              <div>
                <h3>매칭하기</h3>
                <p>원하는 운동을 매칭 하세요!</p>
              </div>
            </div>
          </a>
        </div>

        <div class="col-md-3 col-lg-4 service">
          <a href="/facility/list">
            <div class="service__item" style="background: rgb(206, 235, 233);">
              <span class="material-symbols-outlined">
                hotel_class
                </span>
                <div>
                  <h3>시설예약</h3>
                  <p>원하는 시설을 예약 하세요!</p>
                </div>
            </div>
          </a>
        </div>
        
        <div class="col-md-3 col-lg-4 service">
          <a href="/lesson/list">
            <div class="service__item" style="background: rgb(226, 242, 178);">
              <span class="material-symbols-outlined">
                bookmarks
                </span>
              <div>
                <h3>레슨예약</h3>
                <p>원하는 레슨을 예약 하세요!</p>
              </div>
            </div>
          </a>
        </div>
      </div>
    </div>
  </div>
</section>

<script type="text/javascript">

const counter = ($counter, max) => {
  let now = max;
  const handle = setInterval(() => {
    $counter.innerHTML = Math.ceil(max - now);
    // 목표수치에 도달하면 정지
    if (now < 1) {
      clearInterval(handle);
    }
    // 증가되는 값이 계속하여 작아짐
    const step = now / 1;
    
    // 값을 적용시키면서 다음 차례에 영향을 끼침
    now -= step;
  }, 50);
}

window.onload = () => {
  // 카운트를 적용시킬 요소
  const $counter = document.querySelector(".count");
  // 목표 수치
  const max = '${cnt }';
  setTimeout(() => counter($counter, max), 2000);
}

</script>
<section class="rending__products">
  <div class="container inner">
    <div class="row">
      <div class="text-center col-lg-12" id="match">
        <p class="match-b-title">랫플 매칭이 총 <span class="count" >0</span>건 매칭중 입니다!</p>
      </div>
      
      <div class="home__sport">
      	<form action="/?#match" method="get">
        <button type="button"  class="sports" onclick="location.href='/#match'">전체</button>
        <button class="sports" name="mspoId" value="1">풋살</button>
        <button class="sports" name="mspoId" value="2">테니스</button>
        <button class="sports" name="mspoId" value="3">배드민턴</button>
        <button class="sports" name="mspoId" value="4">탁구</button>
        <button class="sports" name="mspoId" value="5">수영</button>
        <button class="sports" name="mspoId" value="6">골프</button>
        </form>
      </div>

      <c:forEach items="${matlisthot }" var="dto">	
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
							</span>
							<span class="time">${dto.startTime } ~ ${dto.endTime }</span>
						</div>
					</div>
				</div>
			</div>
	</c:forEach>
      
    </div>
  </div>
</section>


<section class="best__sales bg">
  <div class="container inner">
    <div class="row">
      <div class="text-center col-lg-12" id="facility">
        <h2 class="section__title">평점 좋은 시설</h2>
      </div>
      
      <div class="home__sport">
      	<form action="/?#facility" method="get">
        <button type="button"  class="sports" onclick="location.href='/'">전체</button>
        <button class="sports" name="fspoId" value="1">풋살</button>
        <button class="sports" name="fspoId" value="2">테니스</button>
        <button class="sports" name="fspoId" value="3">배드민턴</button>
        <button class="sports" name="fspoId" value="4">탁구</button>
        <button class="sports" name="fspoId" value="5">수영</button>
        <button class="sports" name="fspoId" value="6">골프</button>
        </form>
      </div>
      <c:forEach items="${faclist }" var="dto">
		<div class="facility-list-fl">
			<input type="checkbox" class="delList" name="delList" value="${dto.facSeq }"/>
			<div class="facility">
				<a href="/facility/detail?facSeq=${dto.facSeq }">
					<p class="img">
						<span class="sports-category">${dto.spoName}</span>
						<img src="${dto.facImgpath }">
						<span class="fac-review">${dto.avgRate }점</span>
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
			</div>
		</div>
		</div>
      </c:forEach>
      
      
</div>
</div>
</section>

<section class="new__arrivals">
  <div class="container inner">
      <div class="row">
        <div class="text-center mb-5 col-lg-12" id="lesson">
          <h2 class="section__title">평점 좋은 레슨</h2>
        </div>
        <div class="home__sport">
          <form action="/?#lesson" method="get">
	        <button type="button"  class="sports" onclick="location.href='/'">전체</button>
	        <button id="1" class="sports" name="lspoId" value="1">풋살</button>
	        <button id="2" class="sports" name="lspoId" value="2">테니스</button>
	        <button id="3" class="sports" name="lspoId" value="3">배드민턴</button>
	        <button id="4" class="sports" name="lspoId" value="4">탁구</button>
	        <button id="5" class="sports" name="lspoId" value="5">수영</button>
	        <button id="6" class="sports" name="lspoId" value="6">골프</button>
	       </form>
        </div>
        
        <c:forEach items="${leslist }" var="dto">
				<div class="lesson-list-l">
					<input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/>
					<div class="lesson">
						<a href="/lesson/detail?lesSeq=${dto.lesSeq}">
							<p class="img">
								<span class="sports-category">${dto.spoName}</span>
								<img src="${dto.lesImgpath }">
								<span class="les-review">${dto.avgRate }점</span>
							</p>
						</a>
						<div>
							<a href="/lesson/detail?lesSeq=${dto.lesSeq}">
								<p class="fac-title">${dto.lesName }</p>
							</a>
							<p class="review-count">이용자 리뷰 ${dto.cntReview }개</p>
							<p><span class="match-location">${dto.lesLocation }</span></p>
						</div>
					</div>
				</div>
				</c:forEach> 
    </div>
  </div>
</section>


<section class="timer__count">
  <div class="container inner">
    <div class="row">
      <div class="event_text">
        <div class="clock__top-content">
          <h4 class="text-white fs-6 mb-2">OPEN EVENT</h4>
          <p class="text-white fs-5 mb-3 event__title">렛츠플레이 최고의<br>매치를 찾아서!</p>
        </div>
        <button class="buy__btn store__btn">
          <a href="/facility/list">시설예약하기</a>
        </button>
      </div>
        <div class="event_img">
          <img src="../../img/02.png"/>
        </div>
      </div>
    </div>
</section>
    
<section class="new__arrivals">
  <div class="container inner">
    <div class="row">
      <div class="text-center mb-5 col-lg-12">
        <h2 class="section__title mb-3">신규 매칭</h2>
      </div>
    </div>
    
    
    <ul class="listmatch">
    	<c:forEach items="${matlist }" var="dto">
	      <li>
	        <span class="sports-category">${dto.spoName }</span>
	        <a href="/match/detail?matchSeq=${dto.matchSeq }"><p>${dto.matchTitle }</p></a>
	        
	        <div class="mr-30">
	          <span class="match-location">${dto.matchLocation }</span>
	          <span class="match-location">${dto.facName }</span>
	          <span class="deadline">
	          	<c:forEach var="i" items="${ddays }">
					<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
						마감 ${i.value }일 전
					</c:if>
				</c:forEach>
			  </span>
	          <span class="num-people">${dto.cntJoin }/${dto.matchTotal }명</span>
	        </div>
	      </li>
	     </c:forEach>
    </ul>
  </div>
</section>



<%@ include file="footer.jsp" %>