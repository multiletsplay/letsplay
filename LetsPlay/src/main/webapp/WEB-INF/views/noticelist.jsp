<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- <style type="text/css">
	ul{list-style: none; }
	li{float: left; margin-right: 10px;}
</style> -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
$(function() {
		$('#pagination').on('click', 'a', function(e) {
			e.preventDefault();
			console.log($(this));
			const value = $(this).data('pagenum');
			console.log(value);
			document.pageForm.pageNum.value = value;
			document.pageForm.submit();
		});
		
	})
</script>
<h2>공지사항</h2>


<div class='NoticeTop'>
<div class='LetplNoticeMain'>
<div class='LetplCompose'>
	<input type="button" value="글쓰기" onclick="location.href='/notice/insertform'"/>
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
<div>---- 공지사항이 없습니다 ----</div>
</c:when>
<c:otherwise>
<c:forEach items="${noticelist}" var="notice">
	<li>
		<div class='listNum'>${notice.noticeSeq }</div>
		<div class='listWriter'>${notice.id }</div>
 		<a  class='listTitle' href="/notice/detail?noticeSeq=${notice.noticeSeq }">${notice.noticeTitle }</a>
 		<div class='listDate'><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd(E)" /></div>
	</li>
</c:forEach>
</c:otherwise>
</c:choose>	
</ul>


<div class="paging">
	<form action="<c:url value='/notice/list'/>" name="pageForm">
		<ul class="pagination" id="pagination">
<%-- 			<c:if test="${paging.prev ne true }"> --%>
				<li class="page-item"><a class="page-link" href="<c:url value='/notice/list?page=${paging.startPage-1}'/>" data-pageNum="${paging.startPage-1}">이전</a></li>
<%-- 			</c:if> --%>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<li class="{paging.pageNum == num ? 'page-item active' : ''}" page-item><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
			</c:forEach>
<%-- 			<c:if test="${paging.next ne true }"> --%>
				<li class="page-item"><a class="page-link" href="<c:url value='/notice/list?page=${paging.endPage+1}'/>" data-pageNum="${paging.endPage+1}">다음</a></li>
<%-- 			</c:if> --%>
		</ul>
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
        <input type="hidden" name="countPerPage" value="${paging.cri.amount}">
	</form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>