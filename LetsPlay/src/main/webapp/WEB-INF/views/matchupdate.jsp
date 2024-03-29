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
}
function subtractDays() {
    // 첫 번째 input 태그에서 입력된 날짜 가져오기
    var date = document.getElementById("matchDay").value;
    
    
    // 날짜를 Date 객체로 변환
    var selectedDate = new Date(date);
    
    // 3일을 뺀 날짜 계산
    var newDate = new Date(selectedDate.getTime() - (3 * 24 * 60 * 60 * 1000));
    
    // 두 번째 input 태그의 value 변경
    document.getElementById("matchEnddate").value = newDate.toISOString().substr(0, 10);
}

function addOneHour() {
    // 첫 번째 input 태그에서 입력된 시간 가져오기
    var time = document.getElementById("startTime").value;

    
    // 시간을 Date 객체로 변환하기
    var selectedTime = new Date("1970-01-01T" + time + "Z");
    
    // 1시간을 더한 시간 계산하기
    var newTime = new Date(selectedTime.getTime() + (1 * 60 * 60 * 1000));
    
    // 두번째 input 태그의 value 변경하기
    document.getElementById("endTime").value = newTime.toISOString().substr(11, 5);
}


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
			<div class="match__insert">
				<div>
					<p>시설등록</p>
					<div style="position: relative;">
						<input type="hidden" id="facSeq" name="facSeq" style="display: none;">
						<input type="text" id="facname" required>			
						<input class="facBtn" type="button" value="시설 수정" onclick="openPopUp()" >
						<input type="hidden" name="matchFacility" value="Y">
					</div>
				</div>
				<div>
					<p>장소</p>
					<div>
						<select id="region1" name="matchLocation">
							<option value="">시/도</option>
							<option value="서울">서울</option>
						</select>
						<select id="region2" name="matchLocation" >
							<option value="">군/구</option>
							<option value="강남구">강남구</option>
							<option value="강동구">강동구</option>
							<option value="강북구">강북구</option>
							<option value="강서구">강서구</option>
							<option value="관악구">관악구</option>
							<option value="광진구">광진구</option>
							<option value="구로구">구로구</option>
							<option value="금천구">금천구</option>
							<option value="노원구">노원구</option>
							<option value="도봉구">도봉구</option>
							<option value="동대문구">동대문구</option>
							<option value="동작구">동작구</option>
							<option value="마포구">마포구</option>
							<option value="서대문구">서대문구</option>
							<option value="서초구">서초구</option>
							<option value="성동구">성동구</option>
							<option value="성북구">성북구</option>
							<option value="송파구">송파구</option>
							<option value="양천구">양천구</option>
							<option value="영등포구">영등포구</option>
							<option value="용산구">용산구</option>
							<option value="은평구">은평구</option>
							<option value="종로구">종로구</option>
							<option value="중구">중구</option>
							<option value="중랑구">중랑구</option>
						</select>
					</div>
				</div>
		
				
			</div>

			<div class="match__insert">
				<p>매칭 날짜</p>
				<input type="date" name="matchDay" id="matchDay" value="${dto.matchDay }" onchange="subtractDays()">
			</div>
	
			<div class="match__insert ">
				<p>매칭 마감일자</p>
				<input type="date" name="matchEnddate" id="matchEnddate" value="${dto.matchEnddate }">
			</div>
			
			<p style="margin-bottom: 50px; color: var(--bs-red);">
			* 매칭 등록 유저의 시설 예약 환불 기준에 대한 불이익을 최소화하기 위해 
			시설 이용 날짜와 매칭 마감 날짜의 간격을 최소 3일 기준으로 한다. 
			</p>
			
			<div class="match__insert">
				<p>매칭 시작시간</p>
				<input type="time" name="startTime" id="startTime" value="${dto.startTime }" onchange="addOneHour()">
			</div>
	
			<div class="match__insert">
				<p>매칭 종료시간</p>
				<input type="time" name="endTime" id="endTime" value="${dto.endTime }" >
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
					<input type="range" name="matchLevel" min="1" max="5" value="1" oninput="document.getElementById('levelmatch').innerHTML=this.value;">
					<span style="margin-left: 15px;">레벨: </span><span id="levelmatch">1</span>
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