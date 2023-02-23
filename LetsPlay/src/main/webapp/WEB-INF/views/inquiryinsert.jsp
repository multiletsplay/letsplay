<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<div class="container inner pt40">
	<div class="m40 row">
		<div class="match">
            <h3>1:1 등록하기</h3>
           

<div>
    <form action="/inquiry/insert" method="post">
	<input type="hidden" name="id" value="${member.id}">
        <div class="match__insert">
			<p>제목</p>
			<input type='text' name='inqTitle'>
		</div>

        <div class="match__insert">
			<p>문의 내용</p>
			<textarea rows="10" cols="80" name="inqContent"></textarea>
		</div>


        <input type="submit" value="문의등록" class="pay_Btn">
		<input type="button" value="취소" id="cancelbutton" onclick="location.href='/inquiry/list'" class="cancel">

    </form>
	</div>
	</div>
	</div>
	
</div>
<%@ include file="footer.jsp" %>