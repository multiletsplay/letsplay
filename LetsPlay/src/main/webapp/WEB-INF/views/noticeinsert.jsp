<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<div class='noticeInsertWrapper'>
<div class='noticeInsertMain'>
<div class='headCover'>
<h2>공지사항</h2>
<p class='subhead'>공지할 글을 작성해 주세요</p>
</div>
<span class='redColour' style='margin-left:600px;'>*필수입력사항</span>
<hr style='width: 700px; margin-bottom: 30px;'/>
<div id="notice-insert">
    <form action="/notice/insert" method="post">
        <div class='noticeInsertMainContent'>
			<div style="align-items:center;">
				<span>제목</span>
				<span class='NoticeredColour'>*</span>
				<input type='text' name='noticeTitle'></input>
			</div>
			<div style="align-items:center;">
				<span>내용</span>
				<span class='NoticeredColour'>*</span>
				<input type='text' name='noticeContent'></input>
			</div>
			<div style="align-items:center;">
				<span>I D</span>
				<span class='NoticeredColour NoticeredColourID'>*</span>
				<input type='text' name='id' value="${member.id}"></input>
			</div>
			<div class='InsertContentBtn'>
				<button id='Cancelation' type="button" onclick="location.href='/notice/list'">취소</button>
				<button id='Registration' type="submit">등록</button>
			</div>
	    </div>
    </form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>