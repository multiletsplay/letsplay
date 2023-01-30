<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#nicknameChk").click(nicknameChk);
	
		//찜
		$("#dellikeBtn").click(dellike);
	});
	function nicknameChk(){
		let nickname = $("#nickname").val().trim();
		
		$.ajax({
			url:"/member/nicknamecheck",
			type:"get",
			data:{ "nickname" : nickname },	
			success:function(data){
				if(data == 1){
					alert("이미 사용중인 닉네임입니다.");
					$("#signup").attr("type", "button");
				}else{
					alert("사용 가능한 닉네임입니다.");
				}
			},
			error:function(){
				alert("통신 실패");
			}
		});
		
	}

	function dellike(){
		let matchSeq = $(this).attr('idx');
		$.ajax({
			url : "/match/dellikes",
			type : "GET",
			data : { 'matchSeq' : matchSeq },
			success : function(){
				alert("취소 성공");
				window.location.reload();
			}
		});
}
	
</script>
</head>
<body>
<h1>마이페이지</h1>
<h2>회원 정보</h2>
<form action="/member/update" method="POST">
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
		<td><input type="text" name="name" value="${member.name}"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td>${member.gender}</td>
	</tr>
	<tr>
		<th>닉네임</th>
		<td><input type="text" id="nickname" name="nickname" value="${member.nickname}"></td>
		<td><button type="button" id="nicknameChk">닉네임 중복확인</button>
	</tr>
	<tr>
		<th>이메일</th>
		<td><input type="text" name="email" value="${member.email}"></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><input type="text" name="phone" value="${member.phone}"></td>
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정 완료" >
		</td>
	</tr>
</table>
<input type="button" value="회원 탈퇴" onclick="location.href='/member/delete'">
</form>

<hr>
<h2>매치 내역</h2>
<table border="1">
			<tr align="center">
				<th>작성자</th>
				<th>종목</th>
				<th>제목</th>
				<th>매칭날짜</th>
				<th>남은날짜</th>
				<th>장소</th>
				<th>시작시간 ~ 종료시간</th>
				<th>참여인원/총인원</th>
				<th>레벨</th>
				<th>댓글 수</th>
			</tr>
			<c:choose>
				<c:when test="${empty list and empty joinlist }">
					<tr>
						<td colspan="10" align="center">등록된 매칭이 없습니다.</td>
					</tr>
				</c:when>
				<c:otherwise>
				<c:if test="${not empty list }">
					<c:forEach items="${list }" var="dto">
						<tr align="center">
							<td>${dto.nickName }</td>
							<td>${dto.spoName}</td>
							<td><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></td>
							<td><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" />
							<td>
								<c:forEach var="i" items="${ddays }">
									<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
										마감 ${i.value }일 전
									</c:if>
								</c:forEach>
							</td>
							<td>${dto.matchLocation }</td>
							<td>${dto.startTime } ~ ${dto.endTime }</td>
							<td>${dto.cntJoin }/${dto.matchTotal }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
						</tr>
					</c:forEach>
					</c:if>
					<c:if test ="${not empty joinlist }">
						<c:forEach items="${joinlist }" var="dto">
						<tr align="center">
							<td>${dto.nickName }</td>
							<td>${dto.spoName}</td>
							<td><a href="/match/detail?matchSeq=${dto.matchSeq }">${dto.matchTitle }</a></td>
							<td><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" />
							<td>
								<c:forEach var="i" items="${ddays2 }">
									<c:if test="${dto.matchSeq eq i.key.matchSeq }" >
										마감 ${i.value }일 전
									</c:if>
								</c:forEach>
							</td>
							<td>${dto.matchLocation }</td>
							<td>${dto.startTime } ~ ${dto.endTime }</td>
							<td>${dto.cntJoin }/${dto.matchTotal }</td>
							<td>${dto.matchLevel }</td>
							<td>${dto.cntComment }</td>
						</tr>
					</c:forEach>
					</c:if>
				</c:otherwise>
			</c:choose>
</table>

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
		            		<td>${dto.resDatetime }</td>
		            		<td>시설</td>
		            		<td><a href="/facility/detail?facSeq=${dto.facSeq }">${dto.facName }</a></td>
		            		<td>${dto.facLocation }</td>
		            		<td><input type="button" value="후기 작성" onclick="location.href='/member/reviewinsertform?facSeq=${dto.facSeq }'"></td>
		            		<td><input type="button" value="예약 취소" onclick="location.href='/member/cancelfacres?resId=${dto.resId }'"></td>
	            		</tr>
		            </c:forEach>
	            </c:if>
	            <c:if test="${not empty leslist }">
		            <c:forEach items="${leslist }" var="dto">
	           			<tr>
		            		<td>${dto.resDatetime }</td>
		            		<td>레슨</td>
		            		<td><a href="/lesson/detail?lesSeq=${dto.lesSeq }">${dto.lesName }</a></td>
		            		<td>${dto.lesLocation }</td>
		            		<td><input type="button" value="후기 작성" onclick="location.href='/member/reviewinsertform?lesSeq=${dto.lesSeq }'"></td>
		            		<td><input type="button" value="예약 취소" onclick="location.href='/member/cancellesres?resId=${dto.resId }'"></td>
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

		<c:choose>
			<c:when test="${empty likesfaclist and empty likesmatlist and empty likesleslist }">
				<td colspan="6">------ 찜 목록이 없습니다. ------</td>
			</c:when>
			<c:otherwise>
	        	<c:if test="${not empty likesfaclist }">
	        	<table border="1">
						<tr>
							<th>종목</th>
							<th>이미지</th>
							<th>시설/레슨명</th>
							<th>리뷰개수</th>
							<th>주소</th>
							<th>찜여부</th>
						</tr>
		            <c:forEach items="${likesfaclist }" var="fac">
	           			<tr>
		            		<td>${fac.spoName}</td>
		            		<td><img width="100" src="${fac.facImgpath }"></td>
		            		<td><a href="/facility/detail?facSeq=${fac.facSeq }">${fac.facName }</a></td>
		            		<td>${fac.facLocation }</td>
		            		<td>이용자 리뷰 ${fac.cntReview }개</td>
		            		<td>
				   					<img id="dellikeBtn" idx="${fac.facSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
		            		</td>
	            		</tr>
		            </c:forEach>
		            </table>
	            </c:if>
	            <c:if test="${not empty likesmatlist }">
	            <table border="1">
						<tr>
							<th>날짜</th>
							<th>시간</th>
							<th>종목</th>
							<th>총인원</th>
							<th>제목</th>
							<th>시설명</th>
							<th>찜여부</th>
						</tr>
		            <c:forEach items="${likesmatlist }" var="mat">
	           		
	           			<tr>
<%-- 	           				<td><fmt:formatDate pattern="MM.dd" value="${mat.matchRegdate}"/></td> --%>
							<td>
							<fmt:parseDate  value="${mat.matchRegdate}"
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
							<fmt:formatDate value="${parsedDateTime}" pattern="MM.dd" /></td>

	           				<td>${mat.startTime } ~ ${mat.endTime }</td>
		            		<td>${mat.spoName}</td>
		            		<td>${mat.matchTotal }
		            		<td><a href="/match/detail?matchSeq=${mat.matchSeq }">${mat.matchTitle }</a></td>
		            		<td></td>
		            		<td>
				   					<img id="dellikeBtn" idx="${mat.matchSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
		            		</td>
	            		</tr>
		            </c:forEach>
		            </table>
	            </c:if>
	            <c:if test="${not empty likesleslist }">
	            <table border="1">
						<tr>
							<th>종목</th>
							<th>이미지</th>
							<th>시설/레슨명</th>
							<th>리뷰개수</th>
							<th>주소</th>
							<th>찜여부</th>
						</tr>
		            <c:forEach items="${likesleslist }" var="les">
	           			
	           			<tr>
		            		<td>${les.spoName}</td>
		            		<td><img width="100" src="${les.lesImgpath }"></td>
		            		<td><a href="/lesson/detail?lesSeq=${les.lesSeq }">${les.lesName }</a></td>
		            		<td>${les.lesLocation }</td>
		            		<td>이용자 리뷰 ${les.cntReview }개</td>
		            		<td>
				   					<img id="dellikeBtn" idx="${les.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
		            		</td>
	            		</tr>
		            </c:forEach>
		            </table>
	            </c:if>
			</c:otherwise>
		</c:choose>
</div>

<hr>
<h2>1대1문의</h2>
	<table border="1">
		<tr>
			<th>INQ_SEQ</th>
			<th>REPLY_CHECK</th>
			<th>TITLE</th>
			<th>ID</th>
			<th>DATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty inqlist }">
				<tr>
					<td colspan="5">---- 작성된 글이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${inqlist}" var="dto">
					<tr>
						<td>${dto.inqSeq }</td>
						<c:choose>
							<c:when test="${dto.replyCheck == 0 }"><td>답변대기</td></c:when>
							<c:otherwise><td>답변완료</td></c:otherwise>
						</c:choose>
						<td><a href="/inquiry/detail?inqSeq=${dto.inqSeq }">${dto.inqTitle }</a></td>
						<td>${dto.id }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inqDate }"/></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</table>
</body>
</html>