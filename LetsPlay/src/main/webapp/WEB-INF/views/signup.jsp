<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>

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
	
	function checkAll(){
	    var isChecked = document.getElementById('chkAll').checked;
	    var chks = document.getElementsByClassName('chk');
	    for(let i=0; i<chks.length; i++){
	     chks[i].checked = isChecked;
	    }
	  }
	
</script>

<form action="/member/signup" method="post">
	<div class='SigningMain inner'>
    <div class='Signing'>
        <div><h1>회원가입</h1></div>
        <span style="color:red">*필수입력사항</span>
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
          <span class="warning">${valid_id}</span>
        </div>
        
        <div class='ValTarget pwCheck'>
          <div>
          <span >비밀번호</span>
          <span class='redColour' >*</span>
          </div>
          <input
          type="password"
          placeholder="영문,숫자,특수문자 포함 8자 이상 15자 이하"
          name="password"
          />
          <span class="warning">${valid_password}</span>
        </div>
       
        <div class='ValTarget pwDCheck'>
        <div>
          <span>비밀번호확인</span>
          <span class='redColour'>*</span>
          </div>
          <input
          type="password"
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
          <span class="warning">${valid_name }</span>
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
		 <span class="warning">${valid_nickname }</span>
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
          <span class="warning">${valid_email }</span>
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
          <span class="warning">${valid_phone }</span>
          <button type='button' id="phoneBtn">인증받기</button>
        </div>
       
        <div class='ValTarget numDCheck'>
          <div>
            <span>&nbsp;</span>
            <span class='redColour'></span>
          </div>

          <input type="text" id="phoneChk" placeholder='인증번호를 입력해주세요'/>
          <button type="button" id="phoneChkBtn">인증확인</button>

        </div>
        <div class='formBtn'>
       	  <label class='formBtnGender'>
	          <input type="radio" name="gender" value="M"/>
	          <span>남자</span>
          </label>
          
          <label class='formBtnGender'>
	          <input type="radio" name="gender" value="F"/>
	          <span>여자</span>
           </label>
        </div>
        <div class='formDate ValTarget'>
          <div>생년월일</div>
        <div class='formDate'>
          <input type="date" name="birth" style="padding-left:80px"/>
          <span class="warning">${valid_birth }</span>
        </div>
        </div>
        </div>
        </div>
        <hr style="margin-top:25px; margin-bottom:10px"/>
          <div class='agreementTitle'>
            <span class='agreementAsk'>이용약관동의</span>
            <span class='redColour'>*</span>
            <label><span><input id='chkAll' type='checkbox' onclick="checkAll();"></input></span>
            <span style="font-size:larger; font-weight:bold">전체 동의합니다.</span></label>
          </div>
        <div class='agreement'>
          <div>
            <label><span><input class='chk' type='checkbox'></input></span>
            <span class='agrChk'>이용약관 동의(필수)</span></label>
          </div>
          <div>
          <label><span><input class='chk' type='checkbox'></input></span>
            <span class='agrChk'>개인정보 수집•이용 동의(필수)</span></label>
          </div>
          <div>
          <label><span><input class='chk' type='checkbox'></input></span>
            <span class='agrChk'>할인 쿠폰 등 혜택/정보 수신 동의(선택)</span></label>
          </div>
          <div>
          <label><span><input class='chk' type='checkbox'></input></span>
            <span class='agrChk'>만 14세 이상입니다.(필수)</span></label>
          </div>
          <div class='signUpBtn'>
            <button type="submit" id="signup" style="width:350px; cursor: pointer">가입하기</button>
          <div class='signUpLink'>
            <span>
             이미 가입하셨나요? &nbsp;
            </span>
            <a href="/member/loginform">로그인하기</a>
          </div>
          </div>
        </div>
    </div>
    </div>


</form>
<%@ include file="footer.jsp" %>