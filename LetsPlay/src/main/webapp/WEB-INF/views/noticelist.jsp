<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- <style type="text/css">
	ul{list-style: none; }
	li{float: left; margin-right: 10px;}
</style> -->
<style type="text/css">
	#insertBtn { visibility: hidden; }
	#deleteBtn { visibility: hidden; }
	#writeBtn { visibility: hidden; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
		var mem = '${member.id }';
		
		if (mem=='admin'){
			$("#insertBtn").css("visibility","visible");
			$("#deleteBtn").css("visibility","visible");
			$("#writeBtn").css("visibility","visible");
		}
		
	});

$(function() {
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('pagenum');
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		})
		
	});
	
	function fn1(){
	if (confirm("게시글을 삭제하시겠습니까?")) {
		location.href='/notice/delete?noticeSeq=${dto.noticeSeq}'
	}};

	function showContent() {
		console.log("clicked")
		var Contents = document.getElementById('PersonalResult');
		if(Contents.style.display === 'block'){
			Contents.style.display = 'none';
		}else {
			Contents.style.display = 'block';
		}
	};

</script>

<div class='NoticeTop'>
<div class='LetplNoticeMain'>

<div class='noticeBanner'>
<h2>공지사항</h2>
</div>

<div class='LetplCompose'>
	<p><input type="button" id="writeBtn" value="글쓰기" onclick="location.href='/notice/insertform'"></p>
</div>
<div class='LetplNotice'>
	<div class='LetplNum'>번호</div>
	<div class='LetplWriter'>작성자</div>
	<div class='LetplTitle'>제목</div>
	<div class='LetplDate'>작성일</div>
</div>
<ul class='LetplList'>
<c:choose>
<c:when test="${empty noticelist }">
<div class='NoticeZero'>---- 공지사항이 없습니다 ----</div>
</c:when>
<c:otherwise>
<c:forEach items="${noticelist}" var="notice">
	<div id='listSection'>
	<li>
		<div class='listNum'>${notice.noticeSeq }</div>
		<div class='listWriter'>${notice.id }</div>
 		<div  class='listTitle' onclick='showContent();'>${notice.noticeTitle }</div>
 		<div class='listDate'><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd(E)" /></div>
	</li>
	<div id='PersonalResult'>
        <div>${notice.noticeContent }</div>
        <div class='modBtn'>
          <input type="button" id="insertBtn" value="수정" onclick="location.href='/notice/updateform?noticeSeq=${notice.noticeSeq}'">
       	  <input style='margin-right:15px;' id="deleteBtn" type="button" value="삭제" onclick="javascript:fn1();"></button>
        </div>
      </div>
      </div>
</c:forEach>
</c:otherwise>
</c:choose>	
</ul>


<div class="NoticeListPaging">
	<form action="<c:url value='/notice/list'/>" name="pageForm">
		<ul class="pagination" id="pagination">
<%-- 			<c:if test="${paging.prev ne true }"> --%>
				<li class="page-item"><a class="page-link" href="<c:url value='/notice/list?page=${paging.startPage-1}'/>" data-pageNum="${paging.startPage-1}"><</a></li>
<%-- 			</c:if> --%>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<li class="{paging.pageNum == num ? 'page-item active' : ''}" page-item><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
			</c:forEach>
<%-- 			<c:if test="${paging.next ne true }"> --%>
				<li class="page-item"><a class="page-link" href="<c:url value='/notice/list?page=${paging.endPage+1}'/>" data-pageNum="${paging.endPage+1}">></a></li>
<%-- 			</c:if> --%>
		</ul>
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
        <input type="hidden" name="countPerPage" value="${paging.cri.amount}">
	</form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>