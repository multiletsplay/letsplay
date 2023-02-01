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
<div class="inquiryTopWrapper">
  <div>
  <div class="inquiryHeader">
    <h1>1대1문의</h1>
  </div>
  <div class="inquiryMainWrapper">
  <div>
      <span>제목</span>
      <span>${dto.inqTitle }</span>
  </div>
  <div>
      <span>작성자</span>
      <span style="margin-left: 10px;">${dto.id }</span>
  </div>
  <div>
      <span>날짜</span>
      <span>${dto.inqDate }</span>
  </div>
  <div class="repContentWrapper">
      <span>내용</span>
      <textarea rows="10" cols="80" name="repContent"></textarea>
  </div>
  <div class="UploadeAnswers">
    <input type="button" value="목록" onclick="location.href='/inquiry/list'">
    <input type="button" value="삭제" onclick="location.href='/inquiry/delete?inqSeq=${dto.inqSeq}'">
    <input type="button" value="수정" onclick="location.href='/inquiry/updateform?inqSeq=${dto.inqSeq}'">
</div>
</div>

<c:choose>
  <c:when test="${empty reply }">
    <form action="/inquiry/reply/insert" method="post">
    <input type="hidden" name="id" value="admin" >	<!-- 로그인 기능 완료시 로그인데이터로 id값 받아오기 -->
      <input type="hidden" name="inqSeq" value="${dto.inqSeq}" >
      <div class="inquiryMainWrapper">
        <div>
          <span>작성자</span>
          <span style="margin-left: 10px;">관리자</span>	<!-- 추후 관리자id일경우 '관리자'로 표시로 수정 -->
        </div>
        <div>
          <span>날짜</span>
          <span></span>
        </div>
        <div class="repContentWrapper">
          <span>내용</span>
          <textarea rows="10" cols="80" name="repContent"></textarea>
        </div>
        <div class="UploadeAnswer">
          <input type="submit" value="댓글 등록">
        </div>
    </form>
  </c:when>
  <c:otherwise>
  </div>

  <div class="inquiryMainWrapper">
      <div>
        <span>작성자</span>
        <span style="margin-left: 10px;">관리자</span>	<!-- 추후 관리자id일경우 '관리자'로 표시로 수정 -->
      </div>
      <div>
        <span>날짜</span>
        <span>${reply.repDate }</span>
      </div>
      <div class="repContentWrapper">
        <span>내용</span>
        <textarea rows="10" cols="80" readonly="readonly">${reply.repContent }</textarea>
      </div>
      <div class="ChangeAnswers">
        <input type="button" value="삭제" onclick="location.href='/inquiry/reply/delete?repSeq=${reply.repSeq}&inqSeq=${reply.inqSeq }'">
        <input type="button" value="수정" onclick="location.href='/inquiry/reply/updateform?repSeq=${reply.repSeq}'">
      </div>
  </c:otherwise>
</c:choose>
</div>
</div>
</div>

<%@ include file="footer.jsp" %>