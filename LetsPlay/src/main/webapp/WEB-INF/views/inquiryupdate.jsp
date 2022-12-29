<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
function fn1(){
	if (confirm("게시글을 수정하시겠습니까?")) {
		location.href='/inquiry/detail?inqSeq=${dto.inqSeq}'
	}
};
</script>
<h1>1대1문의 수정</h1>
<div id="inquiry-update">
    <form action="/inquiry/update" method="post">
    <input type="hidden" name="inqSeq" value="${dto.inqSeq}" >
        <table class="inquiry-table">
        	<tr>
		        <th>제목</th>
		        <td><input type="text" name="inqTitle" value="${dto.inqTitle }"></td>
		    </tr>
		    <tr>
		        <th>작성자</th>
		        <td>${dto.id }</td>
		    </tr>
		    <tr>	
		    	<th>날짜</th>
		        <td>${dto.inqDate }</td>
		    </tr>
		    <tr>
		        <th>내용</th>
		        <td><textarea rows="10" cols="80" name="inqContent">${dto.inqContent }</textarea></td>
		    </tr>
            <tr>
                <td colspan="2" align="right">
					<input type="submit" value="수정완료" onclick="javascript:fn1();">
					<input type="button" value="취소" onclick="location.href='/inquiry/detail?inqSeq=${dto.inqSeq }'">
				</td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>