<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ include file="header.jsp" %>

<div class="container">
	<div class="row">
		<div class="mainContent">
			<h2 class="section__title mb-40">아이디 찾기</h2>
<div class="findId">
	<form action="/member/findid" method="get">

		
		<c:choose>
		<c:when test="${empty id }">
			<div class="inputBox">				
				<input type="text" placeholder="이름" name="name">
			</div>
			<div class="inputBox">				
				<input type="text" name="phone" placeholder="000-0000-0000">
			</div>
			<input type="submit" value="찾기" class="loginBtn" onclick="login();"> 
		</c:when>
			<c:otherwise> 
			</c:otherwise> 
		</c:choose>
		<!-- <div>이름: <input type="text" name="name"></div>
		<div>전화번호: <input type="text" name="phone" placeholder="000-0000-0000"></div>
		<div><input type="submit" value="찾기"></div> -->
	</form>

	
</div>

<c:if test="${not empty id }">
	<div class="findid-res">
		<p>아이디는 <strong>
			<!-- 아이디의 앞 3자리까지 보여 주고 -->
		      ${fn:substring(id,0,3) }
		      <!-- 4자리부터 id의 길이만큼 *를 찍어줌 -->
		      <c:forEach begin="4" end="${fn:length(id)}" step="1">
		        *
		      </c:forEach>
		</strong> 입니다.</p>
		<input class="loginBtn" type="button" value="로그인" onclick="location.href='/member/loginform'">
	</div>
</c:if>
<div><a href="/member/findpwform">비밀번호 찾기</a></div>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>