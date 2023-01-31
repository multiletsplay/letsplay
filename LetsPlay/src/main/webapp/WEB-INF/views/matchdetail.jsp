<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<!-- 검색기능(지역,인원,날짜)필터,검색,레벨 마감날짜 종목 참여인원/총인원 제목 장소 작성날짜 참여시간 찜하기 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    #fixmatch { display: none; }
    #unfixmatch { display: none; }
</style>
</head>
<body style="background-color: gray">
        <div class="container col-8 mt-2" style="background-color:white">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>

		$(document).ready(function(){

			var mem = '${member.id }';
			if (mem=='${dto.id}'){
				$("#joinbtn").attr('style', "display:none;");
				$("#fixmatch").show();
				$("#unfixmatch").show();
			}
			
			
			$("#joinbtn").click(join);
			$("#unjoinbtn").click(unjoin)
			$("#likeBtn").click(like);
			$("#dellikeBtn").click(dellike);
			$("#fixmatch").click(fixmatch);
			$("#unfixmatch").click(unfixmatch);
		});
		function join(){
			var matchSeq = ${dto.matchSeq}
			var id = '${member.id}';
			$.ajax({
				url : "/match/matchJoin",
				type : "POST",
				data : { 'matchSeq' : matchSeq, 'id' : id},
				success : function(){
					alert("매칭 참여");
					window.location.reload();
				}
			});
		}
		
		function unjoin(){
			var matchSeq = ${dto.matchSeq}
			var id = '${member.id}';
			$.ajax({
				url : "/match/matchUnjoin",
				type : "GET",
				data : { 'matchSeq' : matchSeq, 'id' : id},
				success : function(){
					alert("매칭 취소");
					window.location.reload();
				}
			});
		}
		function like(){
			let matchSeq = ${dto.matchSeq};
			$.ajax({
				url : "/match/likes",
				type : "POST",
				data : { 'matchSeq' : matchSeq },
				success : function(){
					alert("찜 성공");
					window.location.reload();
				}
			});
		}
		function dellike(){
			let matchSeq = ${dto.matchSeq};
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
		function fixmatch(){
			let matchSeq = ${dto.matchSeq};
			$.ajax({
				url : "/match/fixmatch",
				type : "POST",
				data : { 'matchSeq' : matchSeq },
				success : function(){
					alert("매칭 확정");
					window.location.reload();
				}
			});
		}
		
		function unfixmatch(){
			let matchSeq = ${dto.matchSeq};
			$.ajax({
				url : "/match/unfixmatch",
				type : "GET",
				data : { 'matchSeq' : matchSeq },
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
			<td width="500px">${dto.nickName }</td>
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
		</tr>
		<tr>
			<th>장  소</th>
			<td>${dto.matchLocation } 	　　　　　　　<a href="/facility/detail?facSeq=${dto.facSeq }">${dto.facName }</a></td>
			
		</tr>
		<tr>
			<th>매칭날짜</th>
			<td><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" /></td>
		</tr>
		<tr>
			<th>시작시간 ~ 종료시간</th>
			<td>${dto.startTime } ~ ${dto.endTime }</td>
		</tr>
		<tr>
			<th>참여인원/총 인원</th>
			<td>${dto.cntJoin }/${dto.matchTotal }</td>
		</tr>
		<tr>
			<th>레  벨</th>
			<td>${dto.matchLevel }</td>
		</tr>
		<tr>
			<th>시설유무</th>
			<td>${dto.matchFacility }</td>
		</tr>
		<tr>
			<th>참여한 사람</th>
			<td>${dto.nickName }
				<c:forEach items="${joinlist}" var="join">
					${join.nickName }
				</c:forEach>
			</td>
		</tr>
		<tr>
			<td colspan="3" align="right">
			<c:if test="${dto.nickName eq member.nickname }">
				<input type="button" value="수정" onclick="location.href='/match/updateform?matchSeq=${dto.matchSeq}'">
				<input type="button" value="삭제"  onclick="javascript:fn1();">
				</c:if>
				<input type="button" value="목록" onclick="location.href='/match/list'">
				<div style="text-align:center">
					<c:if test="${ dto.joinStatus ge 1 }">
					<button type="button" id="unjoinbtn">참여취소</button>
					</c:if>
					<c:if test="${ dto.joinStatus eq 0 }">
					<button type="button" id="joinbtn" onclick="fn2(${dto.cntJoin},${dto.matchTotal });" >참여하기</button>
					</c:if>
				</div>
					<div style="text-align:center">
					<c:if test="${fn:contains(dto.matchStatus, 'Y')}">
					<button type="button" id="unfixmatch">확정취소</button>
					</c:if>
					<c:if test="${fn:contains(dto.matchStatus, 'N')}">
					<button type="button" id="fixmatch">매칭확정</button>
					</c:if>
				</div>
				<div>
					<form method="post" action="/match/insertreply?matchSeq=${dto.matchSeq}">
						<p>
							<label>댓글 작성자:</label><input type="text" name="id" value="${member.nickname }" readonly>
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
				<td width="100px">${reply.nickName }</td>
				<td width="475px">${reply.repContent }</td>
				<td width="200px"><fmt:formatDate value="${reply.repRegdate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td>
				<c:if test="${member.nickname eq reply.nickName }">
				<td><input type="button" value="삭제" onclick="location.href='/match/delreply?repSeq=${reply.repSeq} + &matchSeq=${dto.matchSeq}'"></td>
				</c:if>
			</tr>		
		</c:forEach>		
	</table>
	</div>
</body>
</html>