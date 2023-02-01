<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file="header.jsp" %> 

<!-- 검색기능(지역,인원,날짜)필터,검색,레벨 마감날짜 종목 참여인원/총인원 제목 장소 작성날짜 참여시간 찜하기 -->



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
			var cntJoin = ${dto.cntJoin};
			var matchTotal = ${dto.matchTotal};
			if(cntJoin==matchTotal){
				alert("더 이상 참여할 수 없습니다.");
				
			}else{
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
	<div class="container inner pt40">
	<div class="m40 row">	
		<div class="col-lg-8">
			<div>
				<div class="match_detail_lay">
					<main>
						<div class="main-content">
							<span class="sport-type">
								<button>${dto.spoName}</button>
							</span>
							<h2>${dto.matchTitle }</h2>
							<h5 style="margin-bottom: 30px;">${dto.nickName }</h5>
							<div class="carousel slide" style="margin-bottom: 20px;">

								<div class="info">
									<h4>상세정보</h4>
									<div class="p__list mb40">
										${dto.matchContent }
									</div>

									<div class="icon_list">
										<span class="material-symbols-outlined fill">magic_button</span>										
										<span>LEVEL : ${dto.matchLevel }</span>
									</div>

									<div class="icon_list">
										<span class="material-symbols-outlined fill">apartment</span>									
										<span>시설유무 : ${dto.matchFacility }</span>
									</div>

						

									<div class="p__list mt40">
										<h4>참여한 사람</h4>
										<span class="people">
											${dto.nickName }
										</span>
										<c:forEach items="${joinlist}" var="join">
											<span class="people">${join.nickName }</span>
										</c:forEach>
									</div>
								</div>

								
								<div class="comment">
									<h4 style="margin: 40px auto;">후기</h4>

									<form method="post" action="/match/insertreply?matchSeq=${dto.matchSeq}">
										<!-- <p>작성자 : ${member.nickname }</p> -->
										<p class="comment_write">
											<textarea style="padding:20px; width: 90%;" rows="4" cols="100" name="repContent"></textarea>
											<span>
												<input type="submit" value="등록">
											</span>
										</p>
									</form>
									<c:forEach items="${reply }" var="reply">
										<div class="review-list">
											<h5>${reply.nickName }</h5>
											<span>${reply.repContent }</span>
											<!-- <td width="200px"><fmt:formatDate value="${reply.repRegdate}" pattern="yyyy-MM-dd HH:mm:ss" ></fmt:formatDate></td> -->
											<c:if test="${member.nickname eq reply.nickName }">
											<span class="del_btn" onclick="location.href='/match/delreply?repSeq=${reply.repSeq} + &matchSeq=${dto.matchSeq}'">삭제</span>
											</c:if>
										</div>		
									</c:forEach>		
								</div>


								<div class="user_btn_list">
								<c:if test="${dto.nickName eq member.nickname }">
									<span onclick="location.href='/match/updateform?matchSeq=${dto.matchSeq}'">수정</span>
									<span onclick="javascript:fn1();">삭제</span>
								</c:if>
								<span onclick="location.href='/match/list'">목록</span>
							</div>
							</div>
						</div>
						</main>
						
					</div>
				</div>
			</div>

			<div class="col-lg-4">
				<div class="main-banner">
				
					<div>
						<div class="favorite">
							<c:choose>
								<c:when test="${like == 0}">
									<img id="likeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
								</c:when>
								<c:otherwise>
									<img id="dellikeBtn" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
								</c:otherwise>
							</c:choose>
						</div>
	
						<div class="check-display">MATCHING</div>
						<div class="match_left_list">
							<h3>${dto.facName }</h3>
							<div class="location_name"name="facLocation"><input type="hidden" name="facLocation" value="${dto.matchLocation }">${dto.matchLocation }</div>
							<div class="location__btn"><a href="/facility/detail?facSeq=${dto.facSeq }" target="_blank">시설디테일 확인하기 ></a></div>
						</div>
						
						<div class="match_left_list">
							<ul>
								<li>
									<p class="p_tit">매칭일</p>
									<p style="font-weight: 700;"><fmt:formatDate value="${dto.matchDay }" pattern="yyyy-MM-dd(E)" /></p>
								</li>
								<li>
									<p class="p_tit">매칭시작/종료 시간</p>
									<p>${dto.startTime } ~ ${dto.endTime }</p>
								</li>
								<li>
									<p class="p_tit">매칭마감일</p>
									<p><fmt:parseDate value="${dto.matchEnddate}" 
										pattern="yyyy-MM-dd'T'HH:mm" var="parsedDateTime" type="both"/>
										<fmt:formatDate value="${parsedDateTime}" pattern="yyyy-MM-dd(E)" /></p>
								</li>
								<li>
									<p class="p_tit">현재 참여 인원</p>
									<p><span>${dto.cntJoin }</span> /${dto.matchTotal } 명</p>
								</li>
							</ul>
						</div>

						<div>
								<c:if test="${ dto.joinStatus ge 1 }">
								<button class="join-btn" type="button" id="unjoinbtn">참여취소</button>
								</c:if>
								<c:if test="${ dto.joinStatus eq 0 }">
								<button class="join-btn btn-color" type="button" id="joinbtn">참여하기</button>
								</c:if>


								<c:if test="${fn:contains(dto.matchStatus, 'Y')}">
								<button class="join-btn" type="button" id="unfixmatch">확정취소</button>
								</c:if>
								<c:if test="${fn:contains(dto.matchStatus, 'N')}">
								<button class="join-btn btn-color" type="button" id="fixmatch">매칭확정</button>
								</c:if>

						</div>
					</div>
				</div>
			</div>
	
	</div>
</div>

<%@ include file="footer.jsp" %>