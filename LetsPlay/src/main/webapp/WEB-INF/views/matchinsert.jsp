<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="header.jsp" %> 
<!-- CSS only -->

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
function openPopUp() {
    window.open("/match/facimport", "시설 선택", "width=720, height=400, top=150, left=200");
}
</script>


<div class="container inner pt40">
	<div class="m40 row">	
<div class="match">
	<h3>매칭 등록하기</h3>
	<form action="/match/insert" method="post">
	<input type="hidden" name="matchCnt" value="1">
	<div class="match__insert">
		<p>제목</p>
		<input type="text" name="matchTitle" required placeholder="제목을 입력 해주세요!">
	</div>

	<!-- <div class="match__insert">
		<p>작성자</p>
		<input type="text" name="id" value="${member.id}" readonly>
	</div> -->

	<div class="match__insert ">
		<p>매칭을 원하는 스포츠</p>
		<ul>
			<li>
				<input id="sports_01" type="radio" name="spoId" value='1' checked="checked">
				<label for="sports_01">풋살</label>
			</li>
			<li>
				<input id="sports_02" type="radio" name="spoId" value='2'>
				<label for="sports_02">테니스</label>
			</li>
			<li>
				<input id="sports_03" type="radio" name="spoId" value='3'>
				<label for="sports_03">배드민턴</label>
			</li>
			<li>
				<input id="sports_04" type="radio" name="spoId" value='4'>
				<label for="sports_04">탁구</label>
			</li>
			<li>
				<input id="sports_05" type="radio" name="spoId" value='5'>
				<label for="sports_05">수영</label>
			</li>
			<li>
				<input id="sports_06" type="radio" name="spoId" value='6'>
				<label for="sports_06">골프</label>
			</li>
		</ul>
	</div>

	<div class="match__insert ">
		<p>마감일자</p>
		<input type="datetime-local" name="matchEnddate" required>
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

		<div>
			<p>시설등록</p>
			<div style="position: relative;">
				<input type="hidden" id="facSeq" name="facSeq" style="display: none;">
				<input type="text" id="facname" required readonly placeholder="시설을 먼저 등록해주세요!">
	
				<input class="facBtn" type="button" value="시설 등록" onclick="openPopUp()" >
				<input type="hidden" name="matchFacility" value="Y">
			</div>
		</div>
	</div>

	
		<div class="match__insert">
			<p>매칭 날짜</p>
			<input type="date" name="matchDay" required>
		</div>

		<div class="match__insert">
			<p>매칭 시작시간</p>
			<input type="time" name="startTime"step="30:00" value="11:00">
		</div>

		<div class="match__insert">
			<p>매칭 종료시간</p>
			<input type="time" name="endTime" min="06:00" max="23:59" value="14:00">
		</div>

		<div class="match__insert">
			<p>매칭 인원 (최소인원 : 본인 포함 2명)</p>
			<div class="match_people">
				<span class="bseq_ea" style="display: none;">22</span>
				<button type="button" class="s" onclick="fnCalCount('m', this);">-</button>
				<input type="text" name="matchTotal" min="2" max="22" value="2" style="padding-left:60px">
				<button type ="button" class="f" onclick="fnCalCount('p',this);">+</button>
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
			<textarea rows="10" cols="100" name="matchContent"></textarea>
		</div>

		<input type="submit" value="등록" class="pay_Btn">
		<input type="button" value="목록" onclick="location.href='/match/list'" class="cancel">


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
	
		<!--table border="1">
			<tr>
				<th>제  목</th>
				<td><input type="text" name="matchTitle" required>
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="id" value="${member.id}" readonly></td>
			</tr>
			<tr>
				<th>스포츠 종류</th>
				<td>
					<input type="radio" name="spoId" value='1' checked="checked">풋살
					<input type="radio" name="spoId" value='2'>테니스
					<input type="radio" name="spoId" value='3'>배드민턴
					<input type="radio" name="spoId" value='4'>탁구
					<input type="radio" name="spoId" value='5'>수영
					<input type="radio" name="spoId" value='6'>골프</td>
			</tr>
			<tr>
				<th>마감일자</th>
				<td><input type="datetime-local" name="matchEnddate" required></td>
			</tr> -->
<!-- 			<tr> -->
<!-- 				<th>마감일자</th> -->
<!-- 				<td><input type="date" name="matchEnddate" value="2023-01-01" required pattern="\d{4}-\d{2}-\d{2}-'T'\d{2}:\d{2}"></td> -->
<!-- 			</tr> -->
		<!-- 		<tr>
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
				<td><input type="button" value="시설 등록" onclick="openPopUp()"></td>
				<td><input type="text" id="facname" required></td>
				<td><input type="hidden" id="facSeq" name="facSeq"></td>
			</tr>
			<tr>
				<th>매칭날짜</th>
				<td><input type="date" name="matchDay" required></td>
			</tr>
			<tr>
				<th>시작시간</th>
				<td><input type="time" name="startTime"step="30:00" value="11:00"></td>
			</tr>
			<tr>
				<th>종료시간</th>
				<td><input type="time" name="endTime" min="06:00" max="23:59" value="14:00"></td>
			</tr>
			<tr>
				<th>내  용</th>
				<td><textarea rows="10" cols="100" name="matchContent"></textarea></td>
			</tr>
			<tr>
				<th>총인원<br>(본인을 포함한 수)</th>
				<td><input type="number" name="matchTotal" min="2" max="22" value="2"></td>
			</tr>
			<tr>
				<th>레벨</th>
				<td><input type="range" name="matchLevel" min="1" max="5" value="3"></td>
			</tr>
			<tr>
		        <th></th>
		        <td><input type="hidden" name="matchFacility" value="Y" ></td>
		    </tr>
			<tr>
				<td colspan="2" align="right">
					<input type="submit" value="등록">
					<input type="button" value="목록" onclick="location.href='/match/list'">
				</td>
			</tr>
		</!--table> -->	
	</form>
</div>

</div>
</div>
<%@ include file="footer.jsp" %>