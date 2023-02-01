<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div id='reviewWrapping'>
<div>
<div>
	<h2>시설/레슨 후기</h2>
	<p>시설/레슨 평가해주세요!</p>
</div>
    <div id='reviewWrapperTop'>

        <form action="/member/review/insert" method="POST">
            <c:choose>
            <c:when test="${dto.facName eq ''}">
                    
                    <div class='ReviewNameList'>
                        ${dto.lesName}
                    </div>
                    
                    <div class='ReviewStartLoc'>
                        <span class="star">
                            ★★★★★
                            <span>★★★★★</span>
                            <input name="revRate" type="range" oninput="drawStar(this)" value="1" step="2" min="0" max="10">
                          </span>
                    </div>

                    <div class='ReviewRoom'>
                        <div>Review</div>
                        <div class="revContentBox"><textarea placeholder="후기를 입력해주세요" type="text" name="revContent"></textarea></div>
                    </div>
                    <div class='ReviewAssign'>
                    <input style="background-color: red; color:white;" type="button" id="cancelBtn" value="취소" onclick="location.href='/member/mypage'">
                        <input style= 'background-color: var(--primary-600); color:white;' type="submit" value="등록">
                    </div>
                </c:when>


                <c:otherwise>
                    <div class='ReviewNameList'>
                        ${dto.facName}
                    </div>
                   
                    <div class='ReviewStartLoc'>
                        <span class="star">
                            ★★★★★
                            <span>★★★★★</span>
                            <input name="revRate" type="range" oninput="drawStar(this)" value="1" step="2" min="0" max="10">
                          </span>
                    </div>
                    <div class='ReviewRoom'>
                        <div>Review</div>
                        <div class="revContentBox"><textarea placeholder="후기를 입력해주세요" type="text" name="revContent"></textarea></div>
                    </div>
                    <div class='ReviewAssign'>
                    	<input style="background-color: red; color:white;" type="button" id="cancelBtn" value="취소" onclick="location.href='/member/mypage'">
                        <input style="background-color: var(--primary-600); color:white;" type="submit" value="등록">
                    </div>
                </c:otherwise>
                </c:choose>
            </form>
            
        </div>
        </div>
        </div>
<script>
     const drawStar = (target) => {
   	 document.querySelector(`.star span`).style.width = `${target.value * 10}%`;
  }
</script>

<%@ include file="footer.jsp" %>