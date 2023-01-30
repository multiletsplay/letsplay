<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>NaverLoginSDK</title>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
    <script>
        var naver_id_login = new naver_id_login("nlgdIwCIkJWqjjJYv6n7", "http://localhost:8787/");
          // 접근 토큰 값 출력
          alert(naver_id_login.oauthParams.access_token);
          // 네이버 사용자 프로필 조회
          naver_id_login.get_naver_userprofile("naverSignInCallback()");
          // 네이버 사용자 프로필 조회 이후 프로필 정보를 처리할 callback function
          var email, username, id, img;
          function naverSignInCallback() {
              // 토큰에 있는 프로필 정보 가져와서 저장
              // email
              email = naver_id_login.getProfileData('email');
              // 별명
              username = naver_id_login.getProfileData('nickname');
              // id
              id = naver_id_login.getProfileData('id');
              // 프로필 사진
              img = naver_id_login.getProfileData('profileImage');
              
              // 정보 가지고 가서 저장할 url
              var url = "http://" + window.location.hostname + 
              		( (location.port==""||location.port==undefined)?"":":" + location.port) + "최종 로그인 url"; 
              
              // 함수 호출
              post_to_url( url, {'id': id, 'username': username, 'email': email, 'img': img})
          }
          
    </script>
</body>

<script type="text/javascript">
// url로 넘기면서 정보도 같이 담아서 갖고가기
function post_to_url(path, params, method='post') {
	  // body 에 form 태그 추가
      const form = document.createElement('form');
      form.method = method;
      form.action = path;
      
      // 정보 hidden으로 form태그 안에 추가하기
      for(const key in params) {
          if(params.hasOwnProperty(key)) {
              const hiddenField = document.createElement('input');
              hiddenField.type = 'hidden';
              hiddenField.name = key;
              hiddenField.value = params[key];
              form.appendChild(hiddenField);
          }
      }
      // form태그 닫기
      document.body.appendChild(form);
      
      // submit으로 전송
      form.submit();
}

</script>
</html>