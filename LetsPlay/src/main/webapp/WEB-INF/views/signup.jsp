<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	
</script>
<div class='SigningMain inner'>
<div class='Signing'>
<div class='formBoxTop'>
<div class='formBox'>
	<div class='formBtn'>
		<!-- <input type="button" value="일반회원" onclick="location.href='/member/signupformgen'" /> 
		<input type="button" value="비즈니스회원" onclick="location.href='/member/signupformbiz'" /> -->
	  <ul>
	    <li class='formBtnGeneral' onclick="location.href='/member/signupformgen'">
	      <label for="general">일반회원</label>
	    </li>
	
	    <li class='formBtnBiz' onclick="location.href='/member/signupformbiz'">
	      <label for="gender02">비즈니스회원</label>
	    </li>
	  </ul>
	</div>
</div>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>