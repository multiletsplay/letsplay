<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:300,400,500,700&display=swap" />
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons" />  

  <link rel="stylesheet" type="text/css" href="/styles/control.css">
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

  <!-- CSS LINK -->

<title>랫플 :: 운동매칭 서비스</title>
</head>
<body>
<header>
  <div class="header">
    <div class='nav__wrapper'>
      <div class="logo">
        <div>
          <h1>Let's Play</h1>
        </div>


        <div class="navigation">
          <ul class="menu">
              <li class="nav__item"><a href="/">홈</a></li>
              <li class="nav__item"><a href="/match/list">매칭하기</a></li>
              <li class="nav__item"><a href="/facility/list">시설예약</a></li>
              <li class="nav__item"><a href="/lesson/list">레슨예약</a></li>
          </ul>
        </div>


        <div class="nav__icons">
                  
          <span>
           <a href="/match/insertform"><span class='btn01'>매칭만들기</span></a> 
          </span>
          <span class="login"><span class="material-symbols-outlined" onclick="location.href='/member/loginform'">login</span>

            <!-- 로그아웃 시에는 login -> logout 으로 변경해주시면 아이콘이 변경됩니다! -->
            
          </span>
          <!-- <div  class='alarm'>
            <span  class="fav__icon">
              <i class='ri-notification-line'></i>
              <span class="badge">1</span>
            </span>

            <div class='alarm__list' ref={alarmAction}>
                <ul>
                  <Link to='/'>
                  <li>
                    <p>23.01.16</p>
                    <p><b>탁구 매칭구합니다</b>의 매칭이 완료 되었습니다</p>                            
                  </li>
                  </Link>
                  <li>
                    <p>23.01.16</p>
                    <p><b>탁구 매칭구합니다</b>의 매칭이 완료 되었습니다</p>                            
                  </li>                       
                </ul>                     
            </div>
          </div>             -->
            
          <!-- <a href="/member/loginform">
              <span>
                <i class='ri-login-box-line'>
              <span>
           </a> -->
        </div>


    </div>
    </div>
  </div>
</header>