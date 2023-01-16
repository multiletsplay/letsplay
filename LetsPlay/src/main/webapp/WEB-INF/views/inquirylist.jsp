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
	$(document).ready(function(){
		var mem = '${member.type }';
		
		if (mem=='admin'){
			
	}
	
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
<h1>1대1문의</h1>
	<table border="1">
		<col width="50">
		<col width="100">
		<col width="200">
		<col width="100">
		<tr>
			<td colspan="5" align="right">
				<input type="button" value="글 작성" onclick="location.href='/inquiry/insertform'">
			</td>
		</tr>
		<tr>
			<th>INQ_SEQ</th>
			<th>REPLY_CHECK</th>
			<th>TITLE</th>
			<th>ID</th>
			<th>DATE</th>
		</tr>
		<c:choose>
			<c:when test="${empty inquirylist }">
				<tr>
					<td colspan="5">---- 작성된 글이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${inquirylist}" var="dto">
					<tr>
						<td>${dto.inqSeq }</td>
						<c:choose>
							<c:when test="${dto.replyCheck == 0 }"><td>답변대기</td></c:when>
							<c:otherwise><td>답변완료</td></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${member.id == dto.id or member.id == 'admin' }"><td><a href="/inquiry/detail?inqSeq=${dto.inqSeq }">${dto.inqTitle }</a></td></c:when>
							<c:otherwise><td>${dto.inqTitle } 🔒 </td></c:otherwise>
						</c:choose>
						<td>${dto.id }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inqDate }"/></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
	</table>
<div class="paging">
	<form action="<c:url value='/inquiry/list'/>" name="pageForm">
		<ul class="pagination" id="pagination">
			<li class="page-item"><a class="page-link" href="<c:url value='/inquiry/list?page=${paging.cri.pageNum-1}'/>" data-pageNum="${paging.cri.pageNum-1}">이전</a></li>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<li class="{paging.cri.pageNum == num ? 'page-item active' : ''}"><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
			</c:forEach>
			<c:if test="${paging.cri.pageNum < paging.endPage }">
				<li class="page-item"><a class="page-link" href="<c:url value='/inquiry/list?page=${paging.cri.pageNum+1}'/>" data-pageNum="${paging.cri.pageNum+1}">다음</a></li>
			</c:if>
		</ul>
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
        <input type="hidden" name="amount" value="${paging.cri.amount}">
	</form>
</div>
</body>
</html>