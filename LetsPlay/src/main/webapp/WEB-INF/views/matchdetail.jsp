<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- 검색기능(지역,인원,날짜)필터,검색,레벨 마감날짜 종목 참여인원/총인원 제목 장소 작성날짜 참여시간 찜하기 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body style="background-color: gray">
        <div class="container col-8 mt-2" style="background-color:white">
<script>
		$(document).ready(function(){
			var id = ${member.id}
			console.log(id);
			$("#fn2").click(fn2);
			
			$("#likeBtn").click(like);
			$("#dellikeBtn").click(dellike);
		});
		
		function like(){
			let facSeq = ${dto.facSeq};
			
			$.ajax({
				url : "/facility/likes",
				type : "POST",
				data : { 'facSeq' : facSeq },
				success : function(){
					alert("찜 성공");
					window.location.reload();
				}
			});
		}
		
		function dellike(){
			let facSeq = ${dto.facSeq};
			$.ajax({
				url : "/facility/dellikes",
				type : "GET",
				data : { 'facSeq' : facSeq },
				success : function(){
					alert("취소 성공");
					window.location.reload();
				}
			});
		}
		function fn1(){
			if (confirm("게시글을 삭제하시겠습니까?")) {
				location.href='/match/delete?matchSeq=${dto.matchSeq}'
			}
		};
		function fn2(a,b){
			if (confirm("매칭에 참여하시겠습니까?")) {
				if(a >= b){
					alert("이미 정원이 가득 찼습니다")
					return;
				}
// 				const btnElement = document.getElementById('btn');
// 				btnElement.innerText = '매칭취소';
				location.href='/match/joinMatch?matchSeq=${dto.matchSeq}'
			}
		};
	
	
	</script>	
	<table border="1" class="table">
		<tr>
			<td>
				<c:choose>
	   				<c:when test="${like == 0}">
	   					<img id="likeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
	   				</c:when>
	   				<c:otherwise>
	   					<img id="dellikeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
	   				</c:otherwise>
	   			</c:choose>
			</td>
		</tr>
		<tr class="table-active">
			<th>작성자</th>
			<td width="500px">${dto.id }</td>
		</tr>
		<tr>
			<th>제  목</th>
			<td>${dto.matchTitle }</td>
		</tr>
		<tr>
			<th>종  목</th>
			<td>${dto.spoName}</td>
		</tr>
		<tr>
			<th>내  용</th>
			<td width="500px"><textarea rows="10" cols="70" readonly="readonly">${dto.matchContent }</textarea></td>
		</tr>
		<tr>
			<th>마감일자</th>
			<td>
							<fmt:parseDate value="${dto.matchEnddate}" 
								pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
							<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /></td>
							<td>
		</tr>
		<tr>
			<th>장  소</th>
			<td>${dto.matchLocation }</td>
		</tr>
		<tr>
			<th>시작시간 ~ 종료시간</th>
			<td>${dto.startTime } ~ ${dto.endTime }</td>
		</tr>
		<tr>
			<th>참여인원/총 인원</th>
			<td>${dto.matchCnt }/${dto.matchTotal } [${dto.id }, ]</td>
		</tr>
		<tr>
			<th>레  벨</th>
			<td>${dto.matchLevel }</td>
		</tr>
		<tr>
			<th>시설유무</th>
			<td>${dto.matchFacility }</td>
		</tr>
<!-- 		<tr> -->
<!-- 			<th>참여한 사람</th> -->
<!-- 			<td><form action="/match/joinmatchlist"  method="get"></form> -->
				
<!-- 			</td> -->
<!-- 		</tr> -->
		<tr>
			<td colspan="3" align="right">
				<input type="button" value="수정" onclick="location.href='/match/updateform?matchSeq=${dto.matchSeq}'">
				<input type="button" value="삭제"  onclick="javascript:fn1();">
				<input type="button" value="목록" onclick="location.href='/match/list'">
				<div style="text-align:center">
					<c:if test="${ dto.id != null }">
					<button type="submit" id="btn" name="joinMatchList" value="${member.id }" onclick="fn2(${dto.matchCnt},${dto.matchTotal });">참여하기</button>
					</c:if>
				</div>
				<div>
					<form method="post" action="/match/insertreply?matchSeq=${dto.matchSeq}">
						<p>
							<label>댓글 작성자:</label><input type="text" name="id" value="${member.id }" readonly>
						</p>
						<p>
							<textarea rows="4" cols="100" name="repContent"></textarea>
						</p>
						<p>
							<input type="submit" value="댓글 작성">
						</p>
					</form>
					
				</div>
			</td>
		</tr>
		</table>
		<table border="1">
		<c:forEach items="${reply }" var="reply">
			<tr>
				<td width="100px">${reply.id }</td>
				<td width="475px">${reply.repContent }</td>
				<td width="200px"><fmt:formatDate value="${reply.repRegdate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate>
				<input type="button" value="삭제" onclick="location.href='/match/delreply?repSeq=${reply.repSeq} + &matchSeq=${dto.matchSeq}'"></td>
			</tr>		
		</c:forEach>		
	</table>
	</div>
</body>
</html>