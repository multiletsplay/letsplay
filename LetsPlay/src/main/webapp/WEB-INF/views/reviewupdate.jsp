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
</head>
<body>
<div id='reviewWrapping'>

<div>
<div style='text-align: center;'>
	<h2 style='margin-bottom: 20px; '>시설/레슨 후기</h2>
	<p>시설/레슨 후기 수정 가능!</p>
</div>
<div id='reviewWrapperTop'>

<form action="/member/review/update" method="post">
<input type="hidden" name="revId" value="${dto.revId}">
	<c:choose>
	<c:when test="${dto.facName eq null}">
<%-- 			<div class='reviewModId'>
				<div>아이디</div>
				<div><input type="text" name="id" value="${member.id}" readonly></div>
			</div>
 --%>			
			
			<div>
               ${dto.lesName}
			</div>
			<div>
               ${dto.lesLocation}
			</div>
			<div class='ReviewStartLoc'>
				<span class="star">
	                     ★★★★★
	                     <span>★★★★★</span>
                     <input name="revRate" type="range" oninput="drawStar(this)" value="${dto.revRate} " step="2" min="0" max="10">
                </span>
				
			</div>
			<div class='ReviewRoom' style='margin-top:20px;'>
				<div>Review</div>
				<div class="revContentBox"><textarea style="width: 100%"; value="${dto.revContent} type="text" name="revContent"></textarea></div>
			</div>
			<div class='ReviewUpdateRoom'>
				<input style="background-color: red; color:white;" type="button" value="후기 삭제" onclick="location.href='/member/review/delete?revId=${dto.revId}'">
				<input style= 'background-color: var(--primary-600); color:white;' type="submit" value="수정 완료">
			</div>
		</c:when>
		<c:otherwise>
			<div>
				<div>아이디</div>
				<div><input type="text" name="id" value="${member.id}" readonly></div>
			</div>
			
			
			<div>
				${dto.facName}
			</div>
			<div>
				${dto.facLocation}
			</div>
			<div>
				<span class="star">
	                     ★★★★★
	                     <span>★★★★★</span>
                     <input name="revRate" type="range" oninput="drawStar(this)" value="${dto.revRate} " step="2" min="0" max="10">
                </span>
			</div>
			<div>
				<div>Review</div>
				<div class="revContentBox"><textarea value="${dto.revContent} type="text" name="revContent"></textarea></div>
			</div>
			<div>
				<input style="background-color: red; color:white;" type="button" value="후기 삭제" onclick="location.href='/member/review/delete?revId=${dto.revId}'">
				<input style= 'background-color: var(--primary-600); color:white;' type="submit" value="수정 완료">
			</div>
		</c:otherwise>
		</c:choose>

</form>
</div>
</div>
</div>

</body>
</html>
