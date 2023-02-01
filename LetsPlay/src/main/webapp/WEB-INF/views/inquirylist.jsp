<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
<div id='inqListWrapperTop'>
<div class='inqListWrapperTitle'>
<h1>1대1 문의</h1>
</div>
        <div id='inqListWrapper'>
        <div class='inqList'>
			<ul>
				<li class='inqListNum'>번호</li>
				<li class='inqListChk'>답변상태</li>
				<li class='inqListTitle'>제목</li>
				<li class='inqListID'>ID</li>
				<li class='inqListDate'>날짜</li>
			</ul>
		</div>
		<div class='inquirylistContentsWrap'>
		<c:choose>
			<c:when test="${empty inquirylist }">
				<div class='inquiryReadlist'>
					<div>---- 작성된 글이 없습니다 ----</div>
				</div>
			</c:when>
			<c:otherwise>	
				<c:forEach items="${inquirylist}" var="dto">
					<ul id='inqContentsList'>
						<li class='inqListNum'>${dto.inqSeq }</li>
						<c:choose>
							<c:when test="${dto.replyCheck == 0 }"><li>답변대기</li></c:when>
							<c:otherwise><li>답변완료</li></c:otherwise>
						</c:choose>
						<c:choose>
							<c:when test="${member.id == dto.id or member.id == 'admin' }"><li class='inqListTitle'><a href="/inquiry/detail?inqSeq=${dto.inqSeq }">${dto.inqTitle }</a></li></c:when>
							<c:otherwise><li>${dto.inqTitle } 🔒 </li></c:otherwise>
						</c:choose>
						<li class='inqListID'>${dto.id }</li>
						<li class='inqListDate'><fmt:formatDate pattern="yyyy-MM-dd" value="${dto.inqDate }"/></li>
					</ul>
				</c:forEach>
			</c:otherwise>
		</c:choose>	
		</div>
<div class="inqListpaging">
	<form action="<c:url value='/inquiry/list'/>" name="pageForm">
		<ul class="pagination" id="pagination">
			<li class="page-item"><a class="page-link" href="<c:url value='/inquiry/list?page=${paging.cri.pageNum-1}'/>" data-pageNum="${paging.cri.pageNum-1}"><</a></li>
			<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
				<li class="{paging.cri.pageNum == num ? 'page-item active' : ''}"><a class="page-link" href="#" data-pageNum="${num}">${num}</a></li>
			</c:forEach>
			<c:if test="${paging.cri.pageNum < paging.endPage }">
				<li class="page-item"><a class="page-link" href="<c:url value='/inquiry/list?page=${paging.cri.pageNum+1}'/>" data-pageNum="${paging.cri.pageNum+1}">></a></li>
			</c:if>
		</ul>
		<input type="hidden" name="pageNum" value="${paging.cri.pageNum}">
        <input type="hidden" name="amount" value="${paging.cri.amount}">
	</form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>