const alertHtml = document.querySelector("input span");
const ID = document.querySelector('input#id');


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




	function idChk(){
    checkId();

		let id = $("#id").val().trim();

		$.ajax({
			url:"/member/idcheck",
			type:"get",
			data:{ "id" : id },	
			success:function(data){
				if(data == 1){
					alertHtml.innerText = "이미 사용중인 ID입니다.";
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
					alertHtml.innerText = "이미 가입된 전화번호입니다.";
					$("#signup").attr("type", "button");
				}else{
					classAdd(event);
					alertHtml.innerText = "인증 번호를 전송했습니다.";
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
					alertHtml.innerText = "인증 번호가 다릅니다.";
					$("#signup").attr("type", "button");
				} else{
					classAdd(event);
					alertHtml.innerText = "인증되었습니다.";
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
	
	
	
	