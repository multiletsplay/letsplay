<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
<link href="${pageContext.request.contextPath}/resources/css/signup.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#idChk").click(idChk);
		$("#nicknameChk").click(nicknameChk);
		$("#phoneBtn").click(auth);
		$("#phoneChkBtn").click(authChk);
	});
	
	function idChk(){
		let id = $("#id").val().trim();
		
		$.ajax({
			url:"/member/idcheck",
			type:"get",
			data:{ "id" : id },	
			success:function(data){
				if(data == 1){
					alert("이미 사용중인 ID입니다.");
					$("#signup").attr("type", "button");
				}else{
					alert("사용 가능한 ID입니다.");
				}
			},
			error:function(){
				alert("통신 실패");
			}
		});
		
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
					$("#signup").attr("type", "button");
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
					$("#signup").attr("type", "button");
				} else{
					alert("인증되었습니다.");
				}
			}
		});
	}
</script>

</head>
<body>
<form action="/member/signup" method="post">
	<div class='SigningMain inner'>
    <div class='Signing'>
        <div><h1>회원가입</h1></div>
        <span style={{color:"red"}}>*필수입력사항</span>
        <hr/>
        <div class='formBoxTop'>
        <div class='formBox'>
        <div class='ValTarget idCheck'>
          <div>
          <span>아이디</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder='아이디를 입력해주세요'
          id="id"
          name="id"/>
          <button type='button' id="idChk">중복확인</button>
        </div>
        
        <div class='ValTarget pwCheck'>
          <div>
          <span>비밀번호</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder="영문,숫자,특수문자 포함 8자 이상 15자 이하"
          name="password"
          />
        </div>
       
        <div class='ValTarget pwDCheck'>
        <div>
          <span>비밀번호확인</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder='비밀번호를 한번 더 입력해주세요'
          id="pwChk"/>
        </div>
        
        <div class='ValTarget nameCheck'>
        <div>
          <span>이름</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder='이름을 입력해주세요'
          name="name"/>
        </div>
        
        <div class='ValTarget nicCheck'>
          <div>
          <span>닉네임</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder='닉네임을 입력해주세요'
          id="nickname"
	      name="nickname"/>
		 <button type='button' id="nicknameChk">중복확인</button>
        </div>
        <div class='ValTarget emailCheck'>
          <div>
          <span>이메일</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder='ex) multi_7@campus.com'
          name="email"/>
        </div>
        
        <div class='ValTarget numCheck'>
          <div>
          <span>휴대폰</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="text"
          placeholder='숫자만 입력해주세요'
          name="phone"
          id="phone"/>
          <button type='button' id="phoneBtn">인증받기</button>
        </div>
       
        <div class='ValTarget numDCheck'>
          <input
          type="text"
		 id="phoneChk"
          value='인증번호를 입력해주세요'/>
          <button type="button" id="phoneChkBtn">인증확인</button>
        </div>
        <div class='formBtn'>
          <button name="gender" value="M">남자</button>
          <button name="gender" value="F">여자</button>
        </div>
        <div class='formDate'>
          <div>생년월일</div>
        <div class='formDate'>
          <input type="date" name="birth" style={{paddingLeft:'80px'}}/>
        </div>
        </div>
        </div>
        </div>
        <hr style={{marginTop:'25px', marginBottom:'10px'}}/>
          <div class='agreementTitle'>
            <span class='agreementAsk'>이용약관동의</span>
            <span class='redColour'>*</span>
            <label><span><input id='chkAll' type={'checkbox'} onClick={checkAll}></input></span>
            <span style={{fontSize:'larger', fontWeight:'bold'}}>전체 동의합니다.</span></label>
          </div>
        <div class='agreement'>
          <div>
            <label><span><input class='chk' type={'checkbox'}></input></span>
            <span>이용약관 동의(필수)</span></label>
          </div>
          <div>
          <label><span><input class='chk' type={'checkbox'}></input></span>
            <span>개인정보 수집•이용 동의(필수)</span></label>
          </div>
          <div>
          <label><span><input class='chk' type={'checkbox'}></input></span>
            <span>할인 쿠폰 등 혜택/정보 수신 동의(선택)</span></label>
          </div>
          <div>
          <label><span><input class='chk' type={'checkbox'}></input></span>
            <span>만 14세 이상입니다.(필수)</span></label>
          </div>
          <div class='signUpBtn'>
            <button id="signup" disabled={NotAllow} style={{width:'350px'}}>가입하기</button>
          <div class='signUpLink'>
            <span>
             이미 가입하셨나요? &nbsp;
            </span>
            <a>로그인하기</a>
          </div>
          </div>
        </div>
    </div>
    </div>


</form>
</body>
</html>