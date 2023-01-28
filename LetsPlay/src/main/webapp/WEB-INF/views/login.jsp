<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src = "https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">

	$(document).ready(function(){
		$("#loginChk").hide();
	});
	
	function login(){
		let id = $("#id").val().trim();
		let pw = $("#password").val().trim();
		
		let loginVal = {
			"id":id,	
			"password":pw
		};
		
		if(id==null || id=="" || pw==null || pw==""){
			alert("id 및 pw를 확인해 주세요");
		}else{
			$.ajax({
				url:"/member/login",
				type:"post",
				data:JSON.stringify(loginVal),	
				contentType:"application/json",	
				dataType:"json", 
				success:function(msg){
					console.log(msg);
					if(msg.check==true){
						alert("성공적으로 로그인되었습니다.");
						location.href="/";
					}else{
						$("#loginChk").show();
						$("#loginChk").html("ID 혹은 PW가 잘못 되었습니다.")
					}
				},
				error:function(){
					alert("통신 실패");
				}
			});
		}
		
	}
</script>
</head>
<body>
	<div class="mainContent inner">
  		<h2 class="section__title mb-40">Login</h2>
		 <form>
   			<div class="inputBox">
		 	<input type="text" placeholder="아이디를 입력해주세요" id="id" name="id" label="id">
     		 </div>
     		 <div class="inputBox">
      			  <input type="password" placeholder="비밀번호를 입력해주세요" id="password" name="password" label="Password">
     	     </div>
        	  <div class="mainBtn">
         		   <button type="button id="login" onclick="login(); class="loginBtn">로그인</button>
           	  </div>
          </form>
          <div class="findAccount">
         	 <ul>
               <a href="/member/findidform"><li>아이디 찾기</li></a>
               <a href="/member/findpwform"><li>비밀번호 찾기</li></a>
             </ul>
          </div>
          <div class="social_media">
            <h5>SNS로 간편하게 로그인하기</h5>
            <div style="width: 60px" id="naver_id_login"></div>
            <div href="javascript:void(0)" onclick="kakaoLogin();">
            	<img alt="kakao" src="${pageContext.request.contextPath}/image/kakao_login_small.png">
            </div>
            
	<!-- onclick="kakaoLogout();">
      <a href="javascript:void(0)">
          <span>카카오 로그아웃</span>
      </a>
	-->

<!-- 카카오 스크립트 -->
<script>
Kakao.init('ae26df69368734f004e25f2eaa96590c'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
/* function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }   */
</script>
           </div>
           <div class="ask_signup">
      	    <span>아직도 랫플 회원이 아니세요?</span>
	            <a href="/member/signupform">
	           	 <span class="signup">회원가입</span>
	            </a>
           </div>
   	 </div>
<div id="loginChk"></div>
</body>
 <script type="text/javascript">
  	var naver_id_login = new naver_id_login("nlgdIwCIkJWqjjJYv6n7", "http://localhost:8787/");
      var state = naver_id_login.getUniqState();
      naver_id_login.setButton("white", 2,30);
      naver_id_login.setDomain("http://localhost:8787/member/loginform#");
      naver_id_login.setState(state);
      naver_id_login.init_naver_id_login();
  </script>
</html>