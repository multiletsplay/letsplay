<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

<section class="rending__products">
  <div class="container inner">
    <div class="row">
      <div class="text-center col-lg-12">
        <p class="match-b-title">랫플 매칭이 총 <span class="count-num" data-count="425">0</span>건 성사 되었습니다!</p>
      </div>
      
      <div class="home__sport">
        <button class="sports" value="all">전체</button>
        <button class="sports" value="풋살">풋살</button>
        <button class="sports" value="테니스">테니스</button>
        <button class="sports" value="배드민턴">배드민턴</button>
        <button class="sports" value="탁구">탁구</button>
        <button class="sports" value="수영">수영</button>
        <button class="sports" value="골프">골프</button>
      </div>

      
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
      
      <div class="mb-20 col-md-4 col-lg-3">
        <div>
          <div class="match-list">
            <p>
              <span class="deadline">마감 4일 전</span>
              <span class="sports-category">풋살</span>
              <span class="num-people">8명</span>
            </p>
            
            <a href="/matching/2">
              <p class="match-title">풋살 매칭구합니다.</p>
            </a>
            
            <p class="match-location">서울시 강서구 어디어디</p>
            
            <div class="match-date">
              <span class="date">2023-01-20</span>
              <span class="time">4</span>
            </div>
            
            <div class="favorite">
              <i class="ri-heart-line"></i>
            </div>
          </div>
        </div>
      </div>
      
      <div class="mb-20 col-md-4 col-lg-3">
        <div>
          <div class="match-list">
            <p>
              <span class="deadline">마감 4일 전</span>
              <span class="sports-category">배드민턴</span>
              <span class="num-people">8명</span>
            </p>
            
            <a href="/matching/3">
              <p class="match-title">배드민턴 매칭구합니다.</p>
            </a>
            
            <p class="match-location">서울시 강남 어디 저기</p>
            <div class="match-date">
              <span class="date">2023-01-11</span>
              <span class="time">4</span>
            </div>
            
            <div class="favorite">
              <i class="ri-heart-line"></i>
            </div>
          
          </div>
        </div>
      </div>
      
      <div class="mb-20 col-md-4 col-lg-3">
        <div>
          <div class="match-list">
            <p>
              <span class="deadline">마감 4일 전</span>
              <span class="sports-category">탁구</span>
              <span class="num-people">8명</span>
            </p>
            
            <a href="/matching/4">
              <p class="match-title">탁구 매칭구합니다.</p>
            </a>
              <p class="match-location">서울시 강남 어디 저기</p>
              <div class="match-date">
                <span class="date">2023-01-11</span>
                <span class="time">4</span>
              </div>
              
              <div class="favorite">
                <i class="ri-heart-line"></i>
              </div>
            </div>
          </div>
        </div>
        
        <div><p class="match-btn"></p>
      </div>
    </div>
  </div>
</section>


<section class="best__sales bg">
  <div class="container inner">
    <div class="row">
      <div class="text-center col-lg-12">
        <h2 class="section__title">평점 좋은 시설</h2>
      </div>
      
      <div class="home__sport">
        <button class="sports" value="all">전체</button>
        <button class="sports" value="풋살">풋살</button>
        <button class="sports" value="테니스">테니스</button>
        <button class="sports" value="배드민턴">배드민턴</button>
        <button class="sports" value="탁구">탁구</button>
        <button class="sports" value="수영">수영</button>
        <button class="sports" value="골프">골프</button>
      </div>
      
      
      <div class="mb-20 col-md-4 col-lg-3">
        <div class="facility">
          <a href="/facility/undefined">
            <p class="img">
              <img alt="">
              <span class="fac-review">점</span>
            </p>
          </a>
        <div>
          <a href="/facility/undefined">
            <p class="fac-title"></p>
          </a>
          
          <p class="review-count">이용자 리뷰 개</p>
          
          <p>
            <span class="match-location"></span>
          </p>
          <div class="favorite">
            <i class="ri-heart-line"></i>
          </div>
        </div>
      </div>
    </div>
    
    <div class="mb-20 col-md-4 col-lg-3">
      <div class="facility">
        <a href="/facility/undefined">
          <p class="img">
            <img alt="">
            <span class="fac-review">점</span>
          </p>
        </a>
        
        <div>      
        <a href="/facility/undefined">
          <p class="fac-title"></p></a>
          <p class="review-count">이용자 리뷰 개</p>
          <p><span class="match-location"></span></p>
          
          <div class="favorite">
            <i class="ri-heart-line"></i>
          </div>
        
        </div>
      </div>
    </div>
    
    
    <div class="mb-20 col-md-4 col-lg-3">
      <div class="facility">
        <a href="/facility/undefined">
          <p class="img">
            <img alt="">
            <span class="fac-review">점</span>
          </p>
        </a>

        <div>
          <a href="/facility/undefined">
            <p class="fac-title"></p>
          </a>
          
          <p class="review-count">이용자 리뷰 개</p>
          
          <p><span class="match-location"></span></p>
          
          <div class="favorite">
            <i class="ri-heart-line"></i>
          </div>
        </div>
      </div>
    </div>
    
    <div class="mb-20 col-md-4 col-lg-3">
      <div class="facility">
        <a href="/facility/undefined">
          <p class="img">
            <img alt="">
            <span class="fac-review">점</span>
          </p>
        </a>
      <div>
        <a href="/facility/undefined">
          <p class="fac-title"></p>
        </a>
        <p class="review-count">이용자 리뷰 개</p>
        <p><span class="match-location"></span></p>
        
        <div class="favorite">
          <i class="ri-heart-line"></i>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</section>


<section class="new__arrivals">
  <div class="container inner">
      <div class="row">
        <div class="text-center mb-5 col-lg-12">
          <h2 class="section__title">평점 좋은 레슨</h2>
        </div>
        <div class="home__sport">
          <button class="sports" value="all">전체</button>
          <button class="sports" value="풋살">풋살</button>
          <button class="sports" value="테니스">테니스</button>
          <button class="sports" value="배드민턴">배드민턴</button>
          <button class="sports" value="탁구">탁구</button>
          <button class="sports" value="수영">수영</button>
          <button class="sports" value="골프">골프</button>
        </div>
        
        <div class="mb-20 col-md-4 col-lg-3">
          <div class="lesson">
            <a href="/lesson/1">
              <p class="img"><span class="sports-category">테니스</span></p>
            </a>
            
            <div>
              <a href="/lesson/1">
                <p class="fac-title">테니스 매칭구합니다.</p>
              </a>
              <p class="review-count">이용자 리뷰 10개</p>
              <p><span class="match-location">서울시 강서구 화곡동</span></p>
              
              <div class="favorite"><i class="ri-heart-line"></i></div>
            </div>
          </div>
        </div>
        
        <div class="mb-20 col-md-4 col-lg-3">
          <div class="lesson">
            <a href="/lesson/2">
              <p class="img"><span class="sports-category">풋살</span></p>
            </a>

            <div>
            <a href="/lesson/2">
              <p class="fac-title">풋살 매칭구합니다.</p>
            </a>
            
            <p class="review-count">이용자 리뷰 10개</p>
            <p><span class="match-location">서울시 강서구 어디어디</span></p>
            
            <div class="favorite">
              <i class="ri-heart-line"></i>
            </div>
          </div>
        </div>
      </div>
      
      <div class="mb-20 col-md-4 col-lg-3">
        <div class="lesson">
          <a href="/lesson/3">
            <p class="img">
              <span class="sports-category">배드민턴</span>
            </p>
          </a>
          
          <div>
            <a href="/lesson/3">
              <p class="fac-title">배드민턴 매칭구합니다.</p>
            </a>
            
            <p class="review-count">이용자 리뷰 10개</p>
            <p>
              <span class="match-location">서울시 강남 어디 저기</span>
            </p>
            
            <div class="favorite">
              <i class="ri-heart-line"></i>
            </div>
          
          </div>
        </div>
      </div>
      
      <div class="mb-20 col-md-4 col-lg-3">
        <div class="lesson">
          <a href="/lesson/4">
            <p class="img">
              <span class="sports-category">탁구</span>
            </p>
          </a>

          <div>
            <a href="/lesson/4">
              <p class="fac-title">탁구 매칭구합니다.</p>
            </a>
            <p class="review-count">이용자 리뷰 10개</p>
            <p><span class="match-location">서울시 강남 어디 저기</span></p>
            
            <div class="favorite">
              <i class="ri-heart-line"></i>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<section class="timer__count">
  <div class="container inner">
    <div class="row">
      <div class="col-md-6 col-lg-6">
        <div class="clock__top-content">
          <h4 class="text-white fs-6 mb-2">Event</h4>
          <h3 class="text-white fs-5 mb-3">렛플이벤트 들어가는 공간</h3>
        </div>
        <button class="buy__btn store__btn">
          <a href="/shop">Visit Notice</a>
        </button></div>
        <div class="text-end col-md-6 col-lg-6"></div>
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
      <li>
        <span class="sports-category">테니스</span>
        <a href="/matching/1"><p>테니스 매칭구합니다.</p></a>
        
        <div class="mr-30">
          <span class="match-location">서울시 강서구 화곡동</span>
          <span class="match-location">하나테니스장</span>
          <span class="deadline">마감10일</span>
          <span class="num-people">4명</span>
        </div>
        
        <div class="favorite">
          <i class="ri-heart-line"></i>
        </div>
      </li>
      
      <li>
        <span class="sports-category">풋살</span>
        <a href="/matching/2"><p>풋살 매칭구합니다.</p></a>
        <div class="mr-30">
          <span class="match-location">서울시 강서구 어디어디</span>
          <span class="match-location">하나풋살장</span>
          <span class="deadline">마감4일</span>
          <span class="num-people">8명</span>
        </div>
        
        <div class="favorite">
          <i class="ri-heart-line"></i>
        </div>
      </li>
      
      <li>
        <span class="sports-category">배드민턴</span>
        <a href="/matching/3"><p>배드민턴 매칭구합니다.</p></a>
        <div class="mr-30">
          <span class="match-location">서울시 강남 어디 저기</span>
          <span class="match-location">하나배드민턴</span>
          <span class="deadline">마감4일</span>
          <span class="num-people">8명</span>
        </div>
        
        <div class="favorite">
          <i class="ri-heart-line"></i>
        </div>
      </li>
      
      <li>
        <span class="sports-category">탁구</span>
        <a href="/matching/4"><p>탁구 매칭구합니다.</p></a>
        <div class="mr-30">
          <span class="match-location">서울시 강남 어디 저기</span>
          <span class="match-location">하나탁구</span>
          <span class="deadline">마감4일</span>
          <span class="num-people">8명</span>
        </div>
        
        <div class="favorite">
          <i class="ri-heart-line"></i>
        </div>
      </li>
    </ul>
  </div>
</section>



<%@ include file="footer.jsp" %>