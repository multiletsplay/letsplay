<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
        amount: 100,					//결제금액 ${dto.resPrice}
        buyer_email: "${dto.email}",	//주문자 이메일
        buyer_name: "${dto.name}",		//주문자명
        buyer_tel: "${dto.phone}",		//주문자 연락처
    }, function (rsp) { // callback
    	console.log(rsp.success)
        if (rsp.success) { // 결제 성공 시
 			console.log("결제 성공")
	        $.ajax({
	        	type: "POST",
	            url: "/facility/payment",
	            data: {
	                //imp_uid : rsp.imp_uid,	//아임포트 고유 결제번호
	                "resId" : rsp.merchant_uid,
	                "id" : ${dto.id},
	                "facSeq" : ${dto.facSeq},
	                "resStarttime" : "${dto.resStarttime}",
	                "resPrice" : rsp.amount
	            }
	        }).done(function(data){
	        	var msg = "결제가 완료되었습니다.";
	        	location.href="/mypage";
	        })
        } else {
        	var msg = "결제에 실패하였습니다. 에러 내용: " ;
        	msg += rsp.error_msg;
        	location.href="/mypage";
        }
	    alert(msg);
    });
  }
</script>
</head>
<body>
<h1>예약 상세정보</h1>
<table class="reservation-table" border="1">
	<tr>
		<th>이름(닉네임)</th>
		<th>예약날짜</th>
		<th>시작시간</th>
		<th>휴대폰</th>
		<th>이메일</th>
	</tr>
	<tr>
		<td>${dto.name }(${dto.nickname })</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.resDate }"/></td>
		<td>${dto.resStarttime }</td>
		<td>${dto.phone }</td>
		<td>${dto.email }</td>
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
		<td>${dto.resPrice }</td>
	</tr>
	<tr>
		<td colspan="5" align="center">
			<input type="button" value="결제하기" onclick="requestPay()">
		</td>
	</tr>
</table>
</body>
</html>