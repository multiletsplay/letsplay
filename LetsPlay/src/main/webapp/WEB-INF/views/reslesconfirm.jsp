<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#payment-submit{ display:none;}
</style>
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
        name: "${dto.lesName}",			//주문명
        amount: ${dto.resPrice},					//결제금액
        buyer_email: "${member.email}",	//주문자 이메일
        buyer_name: "${member.name}",		//주문자명
        buyer_tel: "${member.phone}"		//주문자 연락처
    }, function (rsp) { // callback
        if (rsp.success) { // 결제 성공 시
	        document.getElementById('payment-form').submit();
        } else {
        	alert("결제에 실패하였습니다. 에러 내용: "+rsp.error_msg);
        	location.href="/mypage";
        }
    });
  }
</script>
</head>
<body>
<h1>레슨 예약 상세정보</h1>
<form action="/lesson/payment" method="post" id="payment-form">
<input type="hidden" name="resId" value="${dto.resId }">
<input type="hidden" name="id" value="${member.id }">
<input type="hidden" name="lesSeq" value="${dto.lesSeq }">
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
			<td><input type="date" name="resDate" value="<fmt:formatDate pattern="yyyy-MM-dd" value="${dto.resDate }"/>"></td>
			<td><input type="hidden" name="resStarttime" value="${dto.resStarttime }">${dto.resStarttime }</td>
			<td>${member.phone }</td>
			<td>${member.email }</td>
		</tr>
		<tr>
			<th colspan="5" align="left">레슨정보</th>
		</tr>
		<tr>
			<td><img width="300" src="${dto.lesImgpath }"></td>
			<td>${dto.lesName }</td>
			<td>${dto.lesLocation }</td>
			<td>${dto.lesContact }</td>
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
	</table>
</form>
</body>
</html>