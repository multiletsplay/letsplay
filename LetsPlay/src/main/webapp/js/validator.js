const alertHtml = document.querySelector("input span");
const ID = document.querySelector('input#id');
const REGPASSSWORD = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,15}$/;
const passwordInputBox = document.querySelector('#password');
const passwordError = document.querySelector("span.password");
const passwordErrorRetype = document.querySelector("span.password-retype");
const passwordDouble = document.getElementById("pwChk");
const phoneInput = document.getElementById("phone");
const phoneNumSpan = document.querySelector("span.phone-number");

const warningMessage = document.querySelector('.warning');
const successMessage = document.querySelector('.success');

	$(document).ready(function(){
		$("#idChk").click(idChk);
		$("#phoneBtn").click(auth);
		$("#phoneChkBtn").click(authChk);
		$("#nicknameChk").click(nicknameChk);
	});
	
	function checkId(){

  }


  //아이디 입력창에 글자를 키보드로 입력할 때, 메세지를 보여주는 함수
  ID.onkeyup = function () {
  if (isMoreThan4Length(ID.value)) {
    warningMessage.classList.add('hide')
  }
  else {
    successMessage.classList.add('hide')
    warningMessage.classList.remove('hide')
  }
}

//글자수가 4개이상이면
function isMoreThan4Length(value) {
  return value.length >= 4
}


// 비밀번호체크
function passwordCheck(){
	if(passwordInputBox.value.length< 8 || passwordInputBox.value.length >15) {
		passwordError.innerText = "8이상 15자 이내로 입력해주세요";
	}else if(!REGPASSSWORD.test(passwordInputBox.value)){
		passwordError.innerText = "비밀번호는 문자, 숫자, 특수문자 포함입니다";
	}else{passwordError.style.display='none';} };

	passwordInputBox.addEventListener("keyup",passwordCheck);


passwordDouble.onkeyup = function () {
  if (isMatch(passwordInputBox.value, passwordDouble.value) ) {
    passwordErrorRetype.innerText = ""
  }
  else {
    passwordErrorRetype.innerText = "두 비밀번호가 일치하지 않습니다."
  }
}

//비밀번호 값과 비밀번호 확인값이 일치하는지 판별하는 함수
function isMatch (password1, password2) {
  if ( password1 === password2 ) {
    return true;
  }
  else {
    return false;
  }
}



//휴대폰
function autoHypenPhone(str){
	str = str.replace(/[^0-9]/g, '');
	var tmp = '';
	if( str.length < 4){
			return str;
	}else if(str.length < 7){
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3);
			return tmp;
	}else if(str.length < 11){
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 3);
			tmp += '-';
			tmp += str.substr(6);
			return tmp;
	}else{              
			tmp += str.substr(0, 3);
			tmp += '-';
			tmp += str.substr(3, 4);
			tmp += '-';
			tmp += str.substr(7);
			return tmp;
	}
	return str;
}
phoneInput.onkeyup = function(event){
event = event || window.event;
var _val = this.value.trim();
this.value = autoHypenPhone(_val) ;
}




	function idChk(){
    checkId();

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
					successMessage.classList.remove('hide');
          document.querySelector('#idChk').disabled = true;
          document.querySelector('#idChk').style.color = 'rgb(240, 240, 240)'
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
				}else{
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
					classAdd(event);
					alert("인증되었습니다.");
				}
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
					alertHtml.innerText = "이미 사용중인 닉네임입니다";
					$("#signup").attr("type", "button");
				}else{
					classAdd(event);
					alertHtml[4].innerText = "사용가능한 닉네임 입니다.";
				}
			},
			error:function(){
				alert("통신 실패");
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
	
	
	
	