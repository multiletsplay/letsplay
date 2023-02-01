<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
<link rel="stylesheet" type="text/css" href="/styles/control.css">
<style type="text/css">
.ReviewStartLoc input[type=radio]{ display: none;  }
.ReviewStartLoc label{
    font-size: 3em;
    color: transparent;
    text-shadow: 0 0 0 #f0f0f0; 
}
.ReviewStartLoc label:hover{ text-shadow: 0 0 0 rgb(255,234,0); }
.ReviewStartLoc label:hover ~ label{ text-shadow: 0 0 0 rgb(255,234,0); }
.ReviewStartLoc fieldset{
    display: inline-block; 
    direction: rtl; 
    border: 0; 
}
.ReviewStartLoc input[type=radio]:checked ~ label{ text-shadow: 0 0 0 rgb(255,234,0); }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	function insert(){
		alert("등록 완료")
		$('#insertBtn').submit();
	}
	
	function cancel(){
		window.close();
	}
</script>
</head>
<body>
<div id='reviewWrapping'>
<div>
<div>
	<h2>시설/레슨 후기</h2>
	<p>시설/레슨 평가해주세요!</p>
</div>
    <div id='reviewWrapperTop'>

        <form action="/member/review/insert" method="POST">
            <c:choose>
            <c:when test="${dto.facName eq ''}">
                    <input type="hidden" name="lesSeq" value="${dto.lesSeq} ">
					<input type="hidden" name="con" value="1">
					<input type="hidden" name="id" value="${member.id }">
                    <div class='ReviewNameList'>
                        ${dto.lesName}
                    </div>
                    
                    <div class='ReviewStartLoc'>
                        <fieldset>
			               <input type="radio" name="revRate" value="5" id="rate1"><label for="rate1">⭐</label>
			               <input type="radio" name="revRate" value="4" id="rate2"><label for="rate2">⭐</label>
			               <input type="radio" name="revRate" value="3" id="rate3"><label for="rate3">⭐</label>
			               <input type="radio" name="revRate" value="2" id="rate4"><label for="rate4">⭐</label>
			               <input type="radio" name="revRate" value="1" id="rate5"><label for="rate5">⭐</label>
			           </fieldset>
                    </div>

                    <div class='ReviewRoom'>
                        <div>Review</div>
                        <div class="revContentBox"><textarea placeholder="후기를 입력해주세요" type="text" name="revContent"></textarea></div>
                    </div>
                    <div class='ReviewAssign'>
                    <input style="background-color: red; color:white;" type="button" id="cancelBtn" value="취소" onclick="cancel()" >
                    <input type="submit" style= 'background-color: var(--primary-600); color:white;' type="submit" id="insertBtn" value="등록" onclick="insert()">
                    </div>
                </c:when>


                <c:otherwise>
                	<input type="hidden" name="facSeq" value="${dto.facSeq} ">
					<input type="hidden" name="con" value="2">
					<input type="hidden" name="id" value="${member.id }">
                    <div class='ReviewNameList'>
                        ${dto.facName}
                    </div>
                   
                    <div class='ReviewStartLoc'>
                        <fieldset>
			               <input type="radio" name="revRate" value="5" id="rate1"><label for="rate1">⭐</label>
			               <input type="radio" name="revRate" value="4" id="rate2"><label for="rate2">⭐</label>
			               <input type="radio" name="revRate" value="3" id="rate3"><label for="rate3">⭐</label>
			               <input type="radio" name="revRate" value="2" id="rate4"><label for="rate4">⭐</label>
			               <input type="radio" name="revRate" value="1" id="rate5"><label for="rate5">⭐</label>
			           </fieldset>
                    </div>
                    <div class='ReviewRoom'>
                        <div>Review</div>
                        <div class="revContentBox"><textarea placeholder="후기를 입력해주세요" type="text" name="revContent"></textarea></div>
                    </div>
                    <div class='ReviewAssign'>
                    	<input style="background-color: red; color:white;" type="button" id="cancelBtn" value="취소" onclick="cancel()">
                        <input type="submit" style= 'background-color: var(--primary-600); color:white;' type="submit" id="insertBtn" value="등록" onclick="insert()">
                    </div>
                </c:otherwise>
                </c:choose>
            </form>
            
        </div>
        </div>
        </div>
<script type="text/javascript">
     const drawStar = (target) => {
   	 document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  }
</script>