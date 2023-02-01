<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
function fn1(){
	if (confirm("게시글을 수정하시겠습니까?")) {
		location.href='/inquiry/detail?inqSeq=${dto.inqSeq}'
	}
};
</script>
<div id="inquiry-update">
<div>
<h1>1대1문의 수정</h1>

    <form action="/inquiry/update" method="post">
    <input type="hidden" name="inqSeq" value="${dto.inqSeq}" >
        <ul class="inquiry-table">
      	    <li>
		        <span>작성자</span>
		        <span style="border:1px solid grey; border-radius:8px; margin-left:34px; padding:10px 20px; width:880px">${dto.id }</span>
		    </li>
		    <li>	
		    	<span>날짜</span>
		        <span style="border:1px solid grey; border-radius:8px; padding:10px 20px; width:880px">${dto.inqDate }</span>
		    </li>
		    
        	<li>
		        <span>제목</span>
		        <span><input style="border:1px solid grey" type="text" name="inqTitle" value="${dto.inqTitle }"></span>
		    </li>
		    <li>
		        <span>내용</span>
		        <span><textarea class='InqTxtArea' style="border:1px solid grey; border-radius:8px;" name="inqContent">${dto.inqContent }</textarea></span>
		    </li>
            <li>
            <div class='ReqConfirm'>
                <span>
					<input style='background-color:lightgrey; color: black' type="button" value="취소" onclick="location.href='/inquiry/list'">
					<input type="submit" value="수정완료" onclick="javascript:fn1();">
				</span>
			</div>
            </li>
        </ul>
    </form>
    </div>
</div>
<%@ include file="footer.jsp" %>