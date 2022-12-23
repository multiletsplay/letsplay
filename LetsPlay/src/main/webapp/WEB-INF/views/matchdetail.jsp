<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<!-- 검색기능(지역,인원,날짜)필터,검색,레벨 마감날짜 종목 참여인원/총인원 제목 장소 작성날짜 참여시간 찜하기 -->
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div>
<script>
function fn1(){
	if (confirm("게시글을 삭제하시겠습니까?")) {
		location.href='/board/delete?boardSeq=${dto.boardSeq}'
	}
};
function fn2(){
	if (confirm("게시글을 추천하시겠습니까?")) {
		location.href='/board/updatelike?boardSeq=${dto.boardSeq}'
	}
};
</script>
	</div>
	
</body>
</html>