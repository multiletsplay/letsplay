<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">


	$(document).ready(function(){
		$("#phoneBtn").click(auth);
		$("#phoneChkBtn").click(authChk);
		$(".passwordFind").hide();
		$(".phoneNum").hide();
	});
	
	function auth(){
		const phoneNum = $("#phone").val();
		$.ajax({
			type: 'POST',
			url: '/member/phoneAuth',
			header: {"Content-Type":"application/json"},
			dataType:'json',
			data : {tel : phoneNum},
			success: function(result){
				if(result == true){
					$("#findpw").attr("type", "button");
				} else{
					alert("인증 번호를 전송했습니다.");
					$(".phoneNum").show();
				}
			}
		});
	}
	
	function authChk(){
		const code = $("#phoneChk").val();
		$.ajax({
			type: 'POST',
			url: '/member/phoneAuthOk',
			header: {"Content-Type":"application/json"},
			dataType:'json',
			data : {code : code},
			success: function(result){
				if(result == true){
					alert("인증 번호가 다릅니다.");
					$("#findpw").attr("type", "button");
				} else{
					alert("인증되었습니다.");
					$(".passwordFind").show();
				}
			}
		});
	}
</script>
<div class="container">
	<div class="">
		<div class="mainContent">
			<h2 class="section__title mb-40" >비밀번호 찾기</h2>

			<div class="findpw">
				<div class="inputBox">				
					<input type="text" placeholder="아이디" name="id" >
				</div>
				<div class="inputBox">				
					<input  type="text" name="phone" id="phone" placeholder="010-0000-0000" >
					<button type="button" id="phoneBtn" class="btn__number">인증번호 받기</button>
				</div>
			</div>

			<div class="inputBox phoneNum">				
				<input type="text" id="phoneChk" placeholder="인증번호를 입력해주세요">
				<button type="button" id="phoneChkBtn" class="btn__number">인증번호 확인</button>
			</div>
			<div class="passwordFind">
				<p>고객님의 비밀번호는</p>${pw}</div>

		</div>
	</div>
</div>
<%@ include file="footer.jsp" %>