<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="header.jsp" %>  
<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script>
var IMP = window.IMP;
IMP.init("imp31758044"); //가맹점식별코드

function requestPay() {
    // IMP.request_pay(param, callback) 결제창 호출
    IMP.request_pay({ // param
        pg: "kakaopay",				//PG사코드 kg이니시스:html5_inicis, kakaopay:kakaopay / kg이니시스는 체크카드결제시 실결제되므로 주의!! 
        pay_method: "card",				//결제수단
        merchant_uid: "${dto.resId }",	//고유 주문번호
        name: "${dto.facName}",			//주문명
        amount: ${dto.resPrice},					//결제금액
        buyer_email: "${member.email}",	//주문자 이메일
        buyer_name: "${member.name}",		//주문자명
        buyer_tel: "${member.phone}"		//주문자 연락처
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시
	        /* $.ajax({
	        	url: "/facility/payment",
	        	type: 'POST',
	            data: {
	                //imp_uid : rsp.imp_uid,	//아임포트 고유 결제번호
	                "resId" : rsp.merchant_uid,
	                "id" : ${dto.id},
	                "facSeq" : ${dto.facSeq},
	                "resStarttime" : "${dto.resStarttime}",
	                "resPrice" : rsp.amount
	            }
	        }); */
	        document.getElementById('payment-form').submit();
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: "+rsp.error_msg);
        	location.href="/member/mypage";
        }
    });
  }
</script>

<div class="container inner pt40">
	<div class="row">
		<p class="bookicon"><span class="material-symbols-outlined">receipt_long</span></p>

<div class="book_wrap">
<form action="/facility/payment" method="post" id="payment-form">
	<input type="hidden" name="resId" value="${dto.resId }">
<input type="hidden" name="id" value="${member.id }">
<input type="hidden" name="facSeq" value="${dto.facSeq }">
	<h3>예약 상세정보</h3>
	<div class="info__detail">
		<p>${dto.facName }</p>
		<p><img src="${dto.facImgpath }"></p>
		<ul>
			<li>
				<p>주소</p>
				<p class="">${dto.facLocation }</p>
			</li>
			<li>
				<p>시설 전화번호</p>
				<p>${dto.facContact }</p>
			</li>
		</ul>
	</div>

	<div class="book__detail">
			<ul>
			<li>
				<p>이름(닉네임)</p>
				<p>${member.name }(${member.nickname })</p>
			</li>
			<li>
				<p>휴대폰</p>
				<p>${member.phone }</p>
			</li>
			<li>
				<p>이메일</p>
				<p>${member.email }</p>
			</li>
			<li>
				<p>예약날짜</p>
				<p>${dto.resDate }</p>
			</li>
			<li>
				<p>시작시간</p>
				<p>${dto.resStarttime }</p>
			</li>
		</ul>
	</div>

	
	
	<div class="pay__detail">
		<p>결제 예정 금액</p>
		<p><input type="hidden" name="resPrice" value="${dto.resPrice }">${dto.resPrice }<span style="color: var(--font);"> 원</span></p>
	</div>

	<div>
		<input type="button" value="결제하기" onclick="requestPay()" class="pay_Btn">
		<input type="submit" id="payment-submit">
	</div>
<!-- <input type="hidden" name="resId" value="${dto.resId }">
<input type="hidden" name="id" value="${member.id }">
<input type="hidden" name="facSeq" value="${dto.facSeq }">
	<table class="reservation-table" border="1">
		<tr>
			<th>이름(닉네임)</th>
			<th>예약날짜</th>
			<th>시작시간</th>
			<th>휴대폰</th>
			<th>이메일</th>
		</tr>
		<tr>
			<td>${member.name }(${member.nickname })</td>
			<td><input type="text" name="resDate" value="${dto.resDate }"></td>
			<td><input type="hidden" name="resStarttime" value="${dto.resStarttime }">${dto.resStarttime }</td>
			<td>${member.phone }</td>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th colspan="5" align="left">시설정보</th>
		</tr>
		<tr>
			<td><img width="300" src="${dto.facImgpath }"></td>
			<td>${dto.facName }</td>
			<td>${dto.facLocation }</td>
			<td>${dto.facContact }</td>
		</tr>
		<tr>
			<th>결제 예정 금액</th>
			<td><input type="hidden" name="resPrice" value="${dto.resPrice }">${dto.resPrice }</td>
		</tr>
		<tr>
			<td colspan="5" align="center">
				<input type="button" value="결제하기" onclick="requestPay()">
				<input type="submit" id="payment-submit">
			</td>
		</tr>
	</table> -->
</form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>  