<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="header.jsp" %> 

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function openPopUp() {
    window.open("/match/facimport", "시설 선택", "width=720, height=400, top=150, left=200");
}
function fn1(){
	if (confirm("게시글을 수정하시겠습니까?")) {
		location.href='/match/detail?matchSeq=${dto.matchSeq}'
	}
};
</script>
<div class="container inner pt40">
	<div class="m40 row">	
<div class="match">
	<h3>매칭 수정</h3>
<div id="match-update">
    <form action="/match/update" method="post">
    <input type="hidden" name="matchSeq" value="${dto.matchSeq}" >
		<div class="match__insert">
			<div class="match__insert">
				<p>제목</p>
				<input type="text" name="matchTitle" value="${dto.matchTitle }">
			</div>

			<div class="match__insert ">
				<p>마감일자</p>
				<input type="datetime-local" name="matchEnddate" value="${dto.matchEnddate }">
			</div>	


			<div class="match__insert">

				<div>
					<p>장소</p>
					<div>
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
					</div>
				</div>
		
				<div>
					<p>시설등록</p>
					<div style="position: relative;">
						<input type="hidden" id="facSeq" name="facSeq" style="display: none;">
						<input type="text" id="facname">			
						<input class="facBtn" type="button" value="시설 수정" onclick="openPopUp()" >
					</div>
				</div>
			</div>


			<div class="match__insert">
				<p>매칭 날짜</p>
				<input type="date" name="matchDay" value="${dto.matchDay }">
			</div>
	
			<div class="match__insert">
				<p>매칭 시작시간</p>
				<input type="time" name="startTime" value="${dto.startTime }" >
			</div>
	
			<div class="match__insert">
				<p>매칭 종료시간</p>
				<input type="time" name="endTime" value="${dto.endTime }" >
			</div>
	
			<div class="match__insert">
				<p>매칭 인원 (최소인원 : 본인 포함 2명)</p>
				<div class="match_people">
					<span class="bseq_ea" style="display: none;">22</span>
					<button type ="button" class="f" onclick="fnCalCount('p',this);">+</button>
					<input type="text" name="matchTotal" min="2" max="22" value="${dto.matchTotal }" style="padding-left:60px">
					<button type="button" class="s" onclick="fnCalCount('m', this);">-</button>
				</div>
			</div>
	
			<div class="match__insert">
				<p>매칭 레벨</p>
				<div class="match_level">
					<input type="range" name="matchLevel" min="1" max="5" value="3" oninput="document.getElementById('levelmatch').innerHTML=this.value;">
					<span style="margin-left: 15px;">레벨: </span><span id="levelmatch">3</span>
				</div>
			</div>
	
			<div class="match__insert">
				<p>매칭 내용(공지사항, 주의사항 등 매칭러에게 알려주실 내용을 입력해주세요!)</p>
				<textarea rows="10" cols="100" name="matchContent">${dto.matchContent }</textarea>
			</div>

			<input type="submit" value="수정완료" onclick="javascript:fn1();" class="pay_Btn">
			<input type="button" value="취소" onclick="location.href='/match/detail?matchSeq=${dto.matchSeq }'" class="cancel">


        <!-- <table class="match-table">
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
        </table> -->
    </form>
</div>
</div>
<script>
	function fnCalCount(type, ths){
			var $input = $(ths).parents("div").find("input[name='matchTotal']");
			var tCount = Number($input.val());
			var tEqCount = Number($(ths).parents("div").find("span.bseq_ea").html());
			
			if(type=='p'){
					if(tCount < tEqCount){
						$input.val(Number(tCount)+1)
					}else{
						alert("더 이상 추가하실 수 없습니다.");
					};
			}else{
					if(tCount > 2) {
						$input.val(Number(tCount)-1);
					}else if(tCount == 2){
						alert("최소 인원 본인포함 2명 입니다.");   
					}
	}
	}
		</script>
</div>
</div>
</div>
<%@ include file="footer.jsp" %> 