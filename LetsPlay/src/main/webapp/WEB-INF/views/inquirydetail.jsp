<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
	#commentBtn { visibility: hidden; }
	#comUpdateBtn { visibility: hidden; }
	#comDelBtn { visibility: hidden; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var mem = '${member.type }';
		if (mem=='admin'){
			$("#commentBtn").css("visibility","visible");
			$("#comUpdateBtn").css("visibility","visible");
			$("#comDelBtn").css("visibility","visible");
		}
	});
	
	function replyUpdateShow(){
		$(".reply-table").attr("style", "display:none")
		$(".reply-update").attr("style", "display:table")
	}
</script>
<div id='InquiryDetailForm'>
<div class='InquiryDetailHeader'>
<h1>1대1 문의</h1>
</div>
<div id='InquiryDetailMain'>
    <div>
        <span>제목</span>
        <span>${dto.inqTitle }</span>
    </div>
    <div>
        <span>작성자</span>
        <span>${dto.id }</span>
    </div>
    <div>
    	<span>날짜</span>
        <span>${dto.inqDate }</span>
    </div>
    <hr style='width:955px; height:1px; background-color:rgb(244, 244, 244)'/>
    <br/>
    <div>
        <span>내용</span>
        <span><div class='inquiryContentSentence'>${dto.inqContent }</div></span>
    </div>
    <div class='inquiryDetailOptions'>
		<span>
			<input style="background-color:var(--primary-600);" type="button" value="수정" onclick="location.href='/inquiry/updateform?inqSeq=${dto.inqSeq}'"/>
			<input style="background-color:red" type="button" value="삭제" onclick="location.href='/inquiry/delete?inqSeq=${dto.inqSeq}'"/>
			<input style="background-color:grey" type="button" value="목록" onclick="location.href='/inquiry/list'"/>
		</span>
	</div>
	</div>
	
	<div id='InquiryDetailSecondMain'>
	<c:choose>
		<c:when test="${empty reply }">
			<form action="/inquiry/reply/insert" method="post">
			<input type="hidden" name="id" value="admin" >	<!-- 로그인 기능 완료시 로그인데이터로 id값 받아오기 -->
    		<input type="hidden" name="inqSeq" value="${dto.inqSeq}" >
				<div class="reply-insert">
					<div>
						<span>작성자</span>
						<span>관리자</span>	<!-- 추후 관리자id일경우 '관리자'로 표시로 수정 -->
					</div>
					<div>
						<span>날짜</span>
						<span></span>
					</div>	
					<div>
						<span>내용</span>
						<span><div name="repContent"></div></span>
					</div>
					<div>
						<span colspan="2" align="right">
							<input type="submit" id="commentBtn" value="댓글 등록">
						</span>
					</div>
			</form>
		</c:when>
		<c:otherwise>
			<div class="replyTable">
				<div>
					<span>작성자</span>
					<span style="margin-left: -18px;">관리자</span>
				</div>
				<div>
					<span>날짜</span>
					<span>${reply.repDate }</span>
				</div>
				<div>
					<span>내용</span>
					<span><div class='replyContentSentence' name="repContent">${reply.repContent }</div></span>
				</div>
				<div>
					<span colspan="2" align="right">
						<input type="button" value="수정" id="comUpdateBtn" onclick="replyUpdateShow();"/>
						<input type="button" value="삭제" id="comDelBtn" onclick="location.href='/inquiry/reply/delete?repSeq=${reply.repSeq}&inqSeq=${reply.inqSeq }'"/>
					</span>
				</div>
			</div>
			
			
			<form action="/inquiry/reply/update" method="post">
			<input type="hidden" name="inqSeq" value="${reply.inqSeq}" />
			<input type="hidden" name="repSeq" value="${reply.repSeq}" />
			<div class="reply-update" style="display:none">
				<div>
					<span>답변 수정</span>
				</div>
				<div>
					<span>작성자</span>
					<span>관리자</span>	<!-- 추후 관리자id일경우 '관리자'로 표시로 수정 -->
				</div>
				<div>
					<span>날짜</span>
					<span>${reply.repDate }</span>
				</div>
				<div>
					<span>내용</span>
					<span><div name="repContent">${reply.repContent }</div></span>
				</div>
				<div>
					<span colspan="2" align="right">
						<input type="submit" value="수정">
						<input type="button" value="취소" onclick="location.href='/inquiry/detail?inqSeq=${dto.inqSeq}'">
					</span>
				</div>
			</div>
			</form>
		</c:otherwise>
	</c:choose>
	</div>
</div>

<%@ include file="footer.jsp" %>