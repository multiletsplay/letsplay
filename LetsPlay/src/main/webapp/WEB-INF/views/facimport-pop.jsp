<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function selectfac() {
	  var facSeq = $("#facSeq").val();
	  var facName = $("#facname").val();

	  var parent = window.opener;
	  window.opener.document.getElementById("facSeq").value = facSeq;
	  window.opener.document.getElementById("facname").value = facName;

	self.close();
	}
</script>
</head>
<body>
<h2>예약 내역</h2>
<div id="reserv-list">
	<br><br>
	<table border="1">
		<tr>
			<th>예약날짜</th>
			<th>시설명</th>
			<th>주소</th>
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
		            		<td><a href="/facility/detail?facSeq=${dto.facSeq }"><input type="text" value="${dto.facName }" id="facname"></a></td>
		            		<td>${dto.facLocation }</td>
		            		<td><input type="button" value="시설 선택" onclick="selectfac()"></td>
		            		<td><input type="hidden" value="${dto.facSeq }" id="facSeq" ></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	        </c:otherwise>
	    </c:choose>
    </table>
</div>

</body>
</html>