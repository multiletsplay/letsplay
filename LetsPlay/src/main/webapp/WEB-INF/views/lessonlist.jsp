<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LessonList</title>
<style type="text/css">
	#insertBtn { visibility: hidden; }
	#deleteBtn { visibility: hidden; }
	#selectAll { display: none; }
	.delList { display: none; }
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		var mem = '${member.type }';
		
		if (mem=='admin'){
			$("#insertBtn").css("visibility","visible");
			$("#deleteBtn").css("visibility","visible");
			$("#selectAll").show();
			$(".delList").show();
		}
		
		$('#selectAll').click(function(){
			var checked = $(this).is(':checked');
			
			$('.delList').prop("checked", checked);
		});
		
		$("#likeBtn").click(like);
		$("#dellikeBtn").click(dellike);
		
	});
	
	function like(){
		let lesSeq = $(this).attr('idx');
		
		$.ajax({
			url : "/lesson/likes",
			type : "POST",
			data : { 'lesSeq' : lesSeq },
			success : function(){
				alert("찜 성공");
				window.location.reload();
			}
		});
	}
	
	function dellike(){
		let lesSeq = $(this).attr('idx');
		$.ajax({
			url : "/lesson/dellikes",
			type : "GET",
			data : { 'lesSeq' : lesSeq },
			success : function(){
				alert("취소 성공");
				window.location.reload();
			}
		});
	}
</script>
</head>
<body>
<h1>레슨 리스트</h1>
<!-- 종목 선택 -->
<h3>종목 선택</h3>
<div class="select-sports">
	<form action="/lesson/select" method="get">
		<button type="button" name="spoId" onclick="location.href='/lesson/list'"><img src="https://cdn-icons-png.flaticon.com/512/443/443635.png" width="30"></button>
		<button type="submit" name="spoId" value="1"><img src="https://cdn-icons-png.flaticon.com/512/6938/6938829.png" width="30"></button>
		<button type="submit" name="spoId" value="2"><img src="https://cdn-icons-png.flaticon.com/512/3978/3978317.png" width="30"></button>
		<button type="submit" name="spoId" value="3"><img src="https://cdn-icons-png.flaticon.com/512/1633/1633893.png" width="30"></button>
		<button type="submit" name="spoId" value="4"><img src="https://cdn-icons-png.flaticon.com/512/2500/2500356.png" width="30"></button>
		<button type="submit" name="spoId" value="5"><img src="https://cdn-icons-png.flaticon.com/512/50/50004.png" width="30"></button>
		<button type="submit" name="spoId" value="6"><img src="https://cdn-icons-png.flaticon.com/512/1695/1695095.png" width="30"></button>
	</form>
</div>
<br><br>
<div id="lessonlist">
	<form action="/lesson/delete" method="post">
	<div>
		<input type="submit" id="deleteBtn" value="선택 삭제">
	</div>
	<table border="1">
		<tr>
			<th><input id="selectAll" type="checkbox"></th>
			<th>스포츠 종류</th>
			<th>사진</th>
			<th>레슨 이름</th>
			<th>주소</th>
			<th>리뷰 수</th>
			<th>찜</th>
		</tr>
		
		<c:choose>
			<c:when test="${empty lessonlist }">
				<tr>
					<td colspan="4">---- 등록된 레슨이 없습니다 ----</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${lessonlist }" var="dto">
					<tr>
						<td><input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/></td>
						<td>${dto.spoName }</td>
						<td><img width="210" src="${dto.lesImgpath }"></td>
						<td><a href="/lesson/detail?lesSeq=${dto.lesSeq}">${dto.lesName }</a></td>
						<td>${dto.lesLocation }</td>
						<td>이용자 리뷰 ${dto.cntReview }개</td>
	            		<td>
	            		<c:choose>
			   				<c:when test="${dto.likesStatus eq 1 }">
			   					<img id="dellikeBtn" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
			   				</c:when>
			   				<c:otherwise>
			   					<img id="likeBtn" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
			   				</c:otherwise>
			   			</c:choose>
	            		</td>
					</tr>
				</c:forEach> 
			</c:otherwise>
		</c:choose>
	</table>
	</form>
	<input type="button" id="insertBtn" value="레슨 추가" onclick="location.href='/lesson/insertform'">
</div>
</body>
</html>