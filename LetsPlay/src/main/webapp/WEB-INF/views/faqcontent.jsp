<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<div id='FAQBundleTop'>
<div class="BundleWrapper">
<div><h2>자주 묻는 질문</h2></div>
<div class='Bundle'>
      <span class='titleSection' onClick={Appearance}>
        <span class='TitleQs'><button type='button'>랫플 소개</button></span>
      </span>
      <div class='PersonalResult'>
        다양한 스포츠를 한번에 비교, 예약, 매칭 가능한 시스템<br>
				스포츠 매칭을 통하여, 누구나 쉽고 빠르게 여러 사람들과 스포츠를 즐길 수 있다.<br>
				원하는 운동에 대한 시설 정보와 레슨 예약을 직접 검색해서 하나씩 알아봐야 하는 번거로움을 줄여서 
				스포츠를 즐길 수 있는 환경을 조성하고, 진입 장벽을 낮추어 생활체육의 참여를 높이는 장점이 있다.<br>
				기존 한 종목만 예약 가능한 스포츠 예약 사이트에서 벗어나, 다양한 스포츠를 
				한곳에서 예약하고 팀매칭까지 이뤄지는 웹서비스
      </div>
      </div>

<div class='Bundle'>
<span class='titleSection' onClick={Appearance}>
        <span class='TitleQs'><button type='button'>로그인 문제</button></span>
      </span>
      <div class='PersonalResult'>
        로그인이 어려우시면 다음 중 가장 관련 있는 상황을 선택해서 자세히 알아보세요.<br><br>
				로그인을 어떻게 하는지 모르겠습니다<br>
				아이디 또는 비밀번호를 잊어버렸습니다<br>
				비밀번호 재설정 인증번호를 받지 못했습니다<br>
				위에 해당 사항 없음<br><br>
				로그인을 어떻게 하는지 모르겠습니다<br>

				아이디/비밀번호로 로그인하기<br>
				렛플 홈페이지에 접속해 로그인합니다<br>
				렛플 가입에 사용한 아이디와 비밀번호를 입력합니다<br>
				로그인을 클릭하여 로그인이 되는지 확인합니다<br><br>

				소셜미디어 로그인<br>
				카카오톡, 네이버, 구글, 페이스북 계정을 이용하여 로그인이 가능합니다.<br><br>
				
				아이디 또는 비밀번호를 잊어버렸습니다.<br>
				잊어버린 비밀번호를 재설정해야 로그인할 수 있습니다.<br>
				아이디 찾기를 클릭하여 아이디 찾기를 시작합니다.<br>
				전화번호와 이름을 입력하여 아이디의 일부분을 출력합니다.<br>
				비밀번호 찾기를 클릭하여 비밀번호 찾기를 시작합니다.<br>
				ID와 전화번호를 입력하고 전화번호 인증을 진행합니다.<br>
				인증에 성공하면 비밀번호 변경 입력칸과 비밀번호 변경 입력 확인칸이 생성됩니다.<br>
				비밀번호를 형식에 맞게 입력 후 비밀번호 변경을 클릭하여 비밀번호를 변경합니다.<br><br>

				비밀번호 재설정 인증번호를 받지 못했습니다<br>
				비밀번호 변경에 필요한 전화번호 인증번호를 받지 못하거나 <br>
				인증번호가 오지 않을 시 잠깐 대기 후 만료시간 5분이 지난 후 인증번호 전송을 다시 시도해주세요.<br>
				이 인증번호는 회원님에게만 보내드리는 고유한 번호이며 5분이 지나면 만료됩니다. <br>
				진행이 되지 않을 시, 고객센터로 문의바랍니다.<br>
				중요: 계정 정보 유출이 의심되시면 비밀번호를 재설정하고, 고객센터에 문의바랍니다.<br><br>

				위에 해당 사항 없음<br>
				위의 정보와 관계없는 로그인 문제를 겪고 계시면 고객선터에 문의하세요. <br>
				최대한 빨리 로그인 문제를 해결하고 저희 서비스를 마음껏 사용할 수 있도록 상담원이 도와드리겠습니다.
      </div>
      </div>

<div class='Bundle'>
<span class='titleSection' onClick={Appearance}>
        <span class='TitleQs'><button type='button'>결제 관련 문제</button></span>
      </span>
      <div class='PersonalResult'>
        결제 거부 또는 처리 실패가 떠요<br>
				결제 수단이 거절되거나 처리되지 않을 때는 다음의 원인이 있을 수 있습니다.<br>

				카드 기한 만료<br>
				청구 정보 불일치 <br>
				카드 잔액 부족<br>
				카드 발급사 지원 불가 <br>
			
				각 원인들을 확인 후 다시 결제를 진행해주시기 바랍니다.<br>
				이후에도 결제 거부 또는 처리 실패가 뜰 경우, 고객센터에 문의바랍니다.
      </div>
      </div>
      
<div class='Bundle'>
<span class='titleSection' onClick={Appearance}>
        <span class='TitleQs'><button type='button'>환불 관련 문제</button></span>
      </span>
      <div class='PersonalResult'>
        각 시설 업체에서 준수하고 있는 환불 가능 기간을 확인하여 주시기 바랍니다.
      </div>
</div>
    </div>
    </div>
<%@ include file="footer.jsp" %>