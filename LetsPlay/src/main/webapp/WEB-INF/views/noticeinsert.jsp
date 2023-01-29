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
        <table class="notice-table">
       		 <tr>
                <th>제목</th>
                <td><input type="text" name="noticeTitle"></td>
            </tr>
        	
            
            <tr>
                <th>내용</th>
                <td><textarea rows="10" cols="80" name="noticeContent"></textarea></td>
            </tr>
            <tr>
                <th>ID</th>
                <td><input type="text" name="id"></td>
            </tr>
            <tr>
                <td colspan="2" align="right">
					<input type="submit" value="등록">
					<input type="button" value="취소" onclick="location.href='/notice/list'">
				</td>
            </tr>
        </table>
    </form>
</div>
</div>
</div>
<%@ include file="footer.jsp" %>