<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>    

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
<div class="container inner">
	<div class="row">


<!-- 종목 선택 -->
<div class="sport-div">
	<form action="/lesson/select" method="get">
	<button type="button"  class="sport" name="spoId" onclick="location.href='/facility/list'">전체</button>
	<button type="submit"  class="sport" name="spoId" value="1">풋살</button>
	<button type="submit"  class="sport" name="spoId" value="2">테니스</button>
	<button type="submit"  class="sport" name="spoId" value="3">배드민턴</button>
	<button type="submit"  class="sport" name="spoId" value="4">탁구</button>
	<button type="submit"  class="sport" name="spoId" value="5">수영</button>
	<button type="submit"  class="sport" name="spoId" value="6">골프</button>
	</form>
</div>


<div id="lessonlist">
	<p><input style="clear: both;" type="button" id="insertBtn" value="레슨 추가" onclick="location.href='/lesson/insertform'"></p>
	<form action="/lesson/delete" method="post">
	<div>
		<input type="submit" id="deleteBtn" value="선택 삭제">
	</div>
	<!-- <table border="1">
		<tr>
			<th><input id="selectAll" type="checkbox"></th>
			<th>스포츠 종류</th>
			<th>사진</th>
			<th>레슨 이름</th>
			<th>주소</th>
			<th>리뷰 수</th>
			<th>찜</th>
		</tr> -->
		<p>전체 선택 <input id="selectAll" type="checkbox"></p>
		<c:choose>
			<c:when test="${empty lessonlist }">
				<div>---- 등록된 레슨이 없습니다 ----</div>
			</c:when>

			<c:otherwise>
				<c:forEach items="${lessonlist }" var="dto">

				<div class="facility-list-fl">
					<span><input type="checkbox" class="delList" name="delList" value="${dto.lesSeq }"/></span>
          <div class="lesson">
            <a href="/lesson/detail?lesSeq=${dto.lesSeq}">
              <p class="img">
								<span class="sports-category">${dto.spoName }</span>
								<img src="${dto.lesImgpath }">
							</p>
            </a>
            
            <div>
              <a href="/lesson/detail?lesSeq=${dto.lesSeq}">
                <p class="fac-title">${dto.lesName }</p>
              </a>
              <p class="review-count">이용자 리뷰 ${dto.cntReview }개</p>
              <p><span class="match-location">${dto.lesLocation }</span></p>
              
              <div class="favorite">
								<c:choose>
			   				<c:when test="${dto.likesStatus eq 1 }">
			   					<img id="dellikeBtn" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589175.png">
			   				</c:when>
			   				<c:otherwise>
			   					<img id="likeBtn" idx="${dto.lesSeq }" width="20" src="https://cdn-icons-png.flaticon.com/512/2589/2589197.png">
			   				</c:otherwise>
			   			</c:choose>
							</div>
            </div>
          </div>
        </div>
					<!-- <tr>
						<td></td>
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
					</tr> -->
				</c:forEach> 
			</c:otherwise>
		</c:choose>
	</form>
</div>

</div>
</div>
<%@ include file="footer.jsp" %>