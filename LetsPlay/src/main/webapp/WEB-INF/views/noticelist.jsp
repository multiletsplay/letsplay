<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul{list-style: none; }
	li{float: left; margin-right: 10px;}
</style>
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
</head>
<body>
<h2>공지사항</h2>
<div class="div2"></div>
<div class="div2">

</div>


<div>
	<table border="1">
		<col width="100">
		<col width="200">
		<col width="400">
		<col width="200">
		<tr>
			<th>NO</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성날짜</th>
		</tr>
		<c:choose>
			<c:when test="${empty noticelist }">
				<tr>
					<td colspan="4" align="center">---- 공지사항이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${noticelist}" var="notice">
					<tr>
						<td>${notice.noticeSeq }</td>
						<td>${notice.id }</td>
						<td><a href="/notice/detail?noticeSeq=${notice.noticeSeq }">${notice.noticeTitle }</a></td>
						<td><fmt:formatDate value="${notice.noticeDate }" pattern="yyyy-MM-dd(E)" /></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글 작성" onclick="location.href='/notice/insertform'">
			</td>
		</tr>
	</table>
	</div>
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
</body>
</html>