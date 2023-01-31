<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#phoneBtn").click(auth);
		$("#phoneChkBtn").click(authChk);
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
					alert("이미 가입된 전화번호입니다.");
					$("#findpw").attr("type", "button");
				} else{
					alert("인증 번호를 전송했습니다.");
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
				}
			}
		});
	}
</script>
</head>
<body>
<h1>비밀번호 찾기</h1>
<div class="findpw">
	<p>ID : <input type="text" name="id"></p>
	<p>전화번호 : <input type="text" name="phone" placeholder="010-0000-0000"> <button type="button" id="verifyNum">인증번호받기</button></p>
</div>
<form action="/member/findpw" method="post">
	<table>
	<tr>
			<th>전화번호</th>
			<td><input type="text" name="phone" id="phone" placeholder="숫자만 입력해주세요"></td>
			<td><button type="button" id="phoneBtn">인증번호 받기</button>
		</tr>
		<tr>
			<th></th>
			<td><input type="text" id="phoneChk" placeholder="인증번호를 입력해주세요"></td>
			<td><button type="button" id="phoneChkBtn">인증번호 확인</button>
		</tr>
		</table>
</form>
</body>
</html>