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
		location.href='/match/detail?matchSeq=${dto.matchSeq}'
	}
};
</script>
<h1>공지사항 수정</h1>
<div id="match-update">
    <form action="/match/update" method="post">
    <input type="hidden" name="matchSeq" value="${dto.matchSeq}" >
        <table class="match-table">
        	<tr>
		        <th>제목</th>
		        <td><input type="text" name="matchTitle" value="${dto.matchTitle }"></td>
		    </tr>
		    <tr>
		        <th>작성자</th>
		        <td><input type="text" name="id" value="${dto.id }" readonly></td>
		    </tr>
		    <tr>	
		    	<th>마감일자</th>
		        <td><input type="date" name="matchEnddate" value="${dto.matchEnddate }"></td>
		    </tr>
		    <tr>
		        <th>장  소</th>
		        <td><input type="text" name="matchLocation" value="${dto.matchLocation }"></td>
		    </tr>
		    <tr>
				<th>시작시간</th>
				<td><input type="time" name="startTime" value="${dto.startTime }" ></td>
			</tr>
			<tr>
				<th>종료시간</th>
				<td><input type="time" name="endTime" value="${dto.endTime }" ></td>
			</tr>
		    <tr>
		        <th>내  용</th>
		        <td><textarea rows="10" cols="80" name="matchContent">${dto.matchContent }</textarea></td>
		    </tr>
		    <tr>
				<th>총인원</th>
				<td><input type="text" name="matchTotal" value="${dto.matchTotal }"></td>
			</tr>
			<tr>
				<th>레  벨</th>
				<td><input type="range" name="matchLevel" min="0" max="5"></td>
			</tr>
			<tr>
		        <th>시설유무</th>
		        <td><input type="checkbox" name="matchFacility" value="${dto.matchFacility }"></td>
		    </tr>
            <tr>
                <td colspan="2" align="right">
					<input type="submit" value="수정완료" onclick="javascript:fn1();">
					<input type="button" value="취소" onclick="location.href='/match/detail?matchSeq=${dto.matchSeq }'">
				</td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>