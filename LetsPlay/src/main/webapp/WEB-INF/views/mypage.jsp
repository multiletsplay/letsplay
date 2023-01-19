<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
</head>
<body>
<h1>마이페이지</h1>
<h2>회원 정보</h2>
<form action="/member/mypage" method="GET">
<table border="1">
	<tr>
		<th>아이디</th>
		<td>${member.id}</td>
	</tr>
	<tr>
		<th>생년월일</th>
		<td>${member.birth}</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td>${member.password}</td>
	</tr>
	<tr>
		<th>이름</th>
		<td>${member.name}</td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td>${member.nickname}</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>${member.email}</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>${member.phone}</td>
	</tr>
</table>
<input type="button" value="회원 정보 수정" onclick="location.href='/member/updateform'">
<input type="button" value="회원 탈퇴" onclick="location.href='/member/delete'">
</form>

<hr>
<h2>매치 내역</h2>


<hr>
<h2>예약 내역</h2>
<form action="/member/mypage/resselect" method="get">
		<button type="submit" name="type" value="F">시설</button>
		<button type="submit" name="type" value="L">레슨</button>
</form>
<div id="reserv-list">
	<br><br>
	<table border="1">
		<tr>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>시설/레슨</th>
			<th>이름</th>
			<th>주소</th>
		</tr>
	    <c:choose>
	        <c:when test="${empty faclist and empty leslist }">
	            <td colspan="5">------ 예약이 없습니다. ------</td>
	        </c:when>
	        <c:otherwise>
	        	<c:if test="${not empty faclist }">
		            <c:forEach items="${faclist }" var="dto">
	           			<tr>
		            		<td><fmt:formatDate pattern="MM.dd" value="${dto.resDate}"/></td>
		            		<td>${dto.resStarttime } ~ ${dto.resEndtime }</td>
		            		<td>시설</td>
		            		<td><a href="/facility/detail?facSeq=${dto.facSeq }">${dto.facName }</a></td>
		            		<td>${dto.facLocation }</td>
		            		<td><input type="button" value="후기 작성" onclick="location.href='/member/reviewinsertform'"></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	            <c:if test="${not empty leslist }">
		            <c:forEach items="${leslist }" var="dto">
	           			<tr>
		            		<td><fmt:formatDate pattern="MM.dd" value="${dto.resDate}"/></td>
		            		<td>${dto.resStarttime } ~ ${dto.resEndtime }</td>
		            		<td>레슨</td>
		            		<td><a href="/lesson/detail?facSeq=${dto.lesSeq }">${dto.lesName }</a></td>
		            		<td>${dto.lesLocation }</td>
		            		<td><input type="button" value="후기 작성" onclick="location.href='/member/reviewinsertform'"></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	        </c:otherwise>
	    </c:choose>
    </table>
</div>

<hr>
<h2>찜한 목록</h2>
<form action="/member/mypage/likeselect" method="get">
		<button type="submit" name="type" value="M">매치</button>
		<button type="submit" name="type" value="F">시설</button>
		<button type="submit" name="type" value="L">레슨</button>
</form>
<div class="likes-list">
	<table border="1">
		<tr>
			<th>종목</th>
			<th>이미지</th>
			<th>시설/레슨명</th>
			<th>리뷰개수</th>
			<th>주소</th>
			<th>찜여부</th>
		</tr>
		<c:choose>
			<c:when test="${empty likesfaclist and empty likesmatlist and empty likesleslist }">
				<td colspan="6">------ 찜 목록이 없습니다. ------</td>
			</c:when>
			<c:otherwise>
	        	<c:if test="${not empty likesfaclist }">
		            <c:forEach items="${likesfaclist }" var="fac">
	           			<tr>
		            		<td>${fac.spoName}</td>
		            		<td><img width="100" src="${fac.facImgpath }"></td>
		            		<td><a href="/facility/detail?facSeq=${fac.facSeq }">${fac.facName }</a></td>
		            		<td>${fac.facLocation }</td>
		            		<td>이용자 리뷰 ${fac.cntReview }개</td>
		            		<td>
		            		<c:choose>
				   				<c:when test="${fac.likesStatus eq 1 }">
				   					<img id="dellikeBtn" idx="${fac.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
				   				</c:when>
				   				<c:otherwise>
				   					<img id="likeBtn" idx="${fac.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
				   				</c:otherwise>
				   			</c:choose>
		            		</td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	            <c:if test="${not empty likesmatlist }">
		            <c:forEach items="${likesmatlist }" var="mat">
	           			<tr>
	           				<td><fmt:formatDate pattern="MM.dd" value="${mat.matchDate}"/></td>
	           				<td>${mat.startTime } ~ ${mat.endTime }</td>
		            		<td>${mat.spoName}</td>
		            		<td>${mat.matchTotal }
		            		<td><a href="/match/detail?matchSeq=${mat.matchSeq }">${mat.matchName }</a></td>
		            		<td>${mat.matchLocation }</td>
		            		<td>
		            		<c:choose>
				   				<c:when test="${mat.likesStatus eq 1 }">
				   					<img id="dellikeBtn" idx="${mat.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
				   				</c:when>
				   				<c:otherwise>
				   					<img id="likeBtn" idx="${mat.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
				   				</c:otherwise>
				   			</c:choose>
		            		</td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	            <c:if test="${not empty likesleslist }">
		            <c:forEach items="${likesleslist }" var="les">
	           			<tr>
		            		<td>${les.spoName}</td>
		            		<td><img width="100" src="${les.lesImgpath }"></td>
		            		<td><a href="/lesson/detail?lesSeq=${les.lesSeq }">${les.lesName }</a></td>
		            		<td>${les.lesLocation }</td>
		            		<td>이용자 리뷰 ${les.cntReview }개</td>
		            		<td>
		            		<c:choose>
				   				<c:when test="${les.likesStatus eq 1 }">
				   					<img id="dellikeBtn" idx="${les.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
				   				</c:when>
				   				<c:otherwise>
				   					<img id="likeBtn" idx="${les.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
				   				</c:otherwise>
				   			</c:choose>
		            		</td>
	            		</tr>
		            </c:forEach>
	            </c:if>
			</c:otherwise>
		</c:choose>
	</table>
</div>
</body>
</html>