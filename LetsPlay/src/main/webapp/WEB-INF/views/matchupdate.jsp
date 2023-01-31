<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function openPopUp() {
    window.open("/match/facimport", "시설 선택", "width=450, height=400, top=150, left=200");
}
function fn1(){
	if (confirm("게시글을 수정하시겠습니까?")) {
		location.href='/match/detail?matchSeq=${dto.matchSeq}'
	}
};
</script>
</head>
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
		        <td><input type="text" name="id" value="${dto.nickName }" readonly></td>
		    </tr>
		    <tr>	
		    	<th>마감일자</th>
		        <td><input type="datetime-local" name="matchEnddate" value="${dto.matchEnddate }"></td>
		    </tr>
		    <tr>
		        <th>장  소</th>
		        <td>
				<select id="region" name="matchLocation" >
					<option value="">시/도</option>
					<option value="서울">서울</option>
				</select>
				<select id="region" name="matchLocation">
					<option value="">군/구</option>
					<option value="강서구">강서구</option>
					<option value="관악구">관악구</option>
					<option value="구로구">구로구</option>
					<option value="동작구">동작구</option>
					<option value="서초구">서초구</option>
					<option value="송파구">송파구</option>
					<option value="종로구">종로구</option>
					<option value="중구">중구</option>
				</select>
				</td>
		        <td><input type="button" value="시설 수정" onclick="openPopUp()"></td>
				<td><input type="text" id="facname"></td>
				<td><input type="hidden" id="facSeq" name="facSeq"></td>
		    </tr>
		    <tr>
		        <th>매칭날짜</th>
		        <td><input type="date" name="matchDay" value="${dto.matchDay }"></td>
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
		        <th></th>
		        <td><input type="hidden" name="matchFacility" value="Y" ></td>
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