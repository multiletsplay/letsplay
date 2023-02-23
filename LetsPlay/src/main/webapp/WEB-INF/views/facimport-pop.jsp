<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
<link rel="stylesheet" type="text/css" href="/styles/control.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function selectfac() {

	  let facSeq = $(event.target).attr('idx');
	  let facName = $(event.target).attr('fname');
 	  let facLocation = $(event.target).attr('floc');
 	  const array = facLocation.split(' ');

// 	  console.log(facSeq);
// 	  console.log(facName);
	  var parent = window.opener;
	  window.opener.document.getElementById("facSeq").value = facSeq;
	  window.opener.document.getElementById("facname").value = facName;
	  window.opener.document.getElementById("region1").options[1].selected = true ;
	  const el = window.opener.document.getElementById("region2");
	  const len = el.options.length; //select box의 option 갯수
	  //select box의 option 갯수만큼 for문 돌림
	  for (let i=0; i<len; i++){  
	  	//select box의 option value가 faclocation의 값과 일치할 경우 selected
	    if(el.options[i].value == array[1]){
	    	el.options[i].selected = true;
	    }
	  }  

	self.close();
	}
</script>

<style>
	body{
		text-align: center;
		padding: 30px;
	}

	h2{
		margin-bottom: 20px;
	}

	#reserv-list{
		border: 2px solid #ddd !important;
		border-radius: 15px !important;
		padding: 20px !important;
		font-size: 1rem !important;
		text-align: left !important;
	}
	table{
		width: 100%;
	}
	table td{
		border-bottom: 1px solid #ddd;
	}

</style>
</head>
<body>
	<div>
	<h2>예약 내역</h2>
<div id="reserv-list">
	<table>
		<tr>
			<th>예약날짜</th>
			<th>시설명</th>
			<th colspan="2">주소</th>
		</tr>
	    <c:choose>
	        <c:when test="${empty faclist }">
	            <td colspan="5">------ 예약이 없습니다. ------</td>
	        </c:when>
	        <c:otherwise>
	        	<c:if test="${not empty faclist }">
		            <c:forEach items="${faclist }" var="dto">
	           			<tr>
		            		<td>${dto.resDatetime }</td>
		            		<td><input type="text" value="${dto.facName }" id="facname" onclick="location.href='/facility/detail?facSeq=${dto.facSeq }'" style="padding-left: 0px;"></td>
		            		<td>${dto.facLocation }</td>
		            		<td><input type="button" value="시설 선택" idx="${dto.facSeq }" fname="${dto.facName }" floc="${dto.facLocation }" onclick="selectfac();" style="
											padding: 5px 10px;
											background-color: var(--primary);
											border: none;
											color: #fff;
											border-radius: 10px;
											cursor: pointer;"></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	        </c:otherwise>
	    </c:choose>
    </table>
</div>
</div>
</body>
</html>