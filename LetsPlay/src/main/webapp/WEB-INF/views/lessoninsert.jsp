<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %> 
<div class="container inner pt40">
	<div class="m40 row">
		<div class="match">
			<h3>레슨 등록하기</h3>

			<form action="/lesson/insert" method="post" enctype="multipart/form-data">
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

			<div class="match__insert">
				<p>레슨 명</p>
				<input type="text" name="lesName" required placeholder="레슨 명">
			</div>

			<div class="match__insert">
				<p>레슨 강사</p>
				<input type="text" name="lesTeacher" required placeholder="레슨 강사님 이름">
			</div>

			<div class="match__insert">
				<p>이미지(시설이미지나 레슨관련 이미지)</p>
				<input type="file" name="file" multiple="multiple">
			</div>

			<div class="match__insert">
				<p>레슨장소 주소(정확히 기입해주시기 바랍니다!)</p>
				<input type="text" name="lesLocation" placeholder="예) 서울시 강서구 ...">
			</div>

			<div class="match__insert">
				<p>레슨 전화번호(정확히 기입해주시기 바랍니다!)</p>
				<input type="text" name="lesContact" placeholder="예) 010-1234-5678">
			</div>

			<div class="match__insert">
				<p>레슨 비용(시간당으로 기입해주세요!)</p>
				<input type="text" name="lesContact" placeholder="30000">
			</div>

		
			<div class="match__insert">
				<p>레슨 종류(개인 혹은 그룹인지 꼭 선택해주세요)</p>
				<ul>
					<li>
						<input id="sports_personal" type="radio" name="lesType" value='personal'>
						<label for="sports_personal">개인</label>
					</li>
					<li>
						<input id="sports_group" type="radio" name="lesType" value='group'>
						<label for="sports_group">그룹</label>
					</li>
				</ul>
			</div>

			<div class="match__insert">
				<p>레슨 일정(주말 혹은 평일인지 꼭 선택해주세요)</p>
				<ul>
					<li>
						<input id="sports_weekday" type="radio" name="lesWeekend" value='weekday'>
						<label for="sports_weekday">평일</label>
					</li>
					<li>
						<input id="sports_weekend" type="radio" name="lesWeekend" value='weekend'>
						<label for="sports_weekend">주말</label>
					</li>
				</ul>
			</div>

			<div class="match__insert">
				<p>레슨 스케줄</p>
				<input type="text" name="" placeholder="비어있는 공간">
			</div>


			<input type="submit" value="레슨등록" class="pay_Btn">
			<input type="button" value="취소" id="cancelbutton" onclick="location.href='/lesson/list'" class="cancel">

	
		<!--table class="lesson-insert" border="1">
			<tr>
				<th>종목</th>
				<td>
					<input type="radio" name="spoId" value='1'>풋살
					&nbsp;
					<input type="radio" name="spoId" value='2'>테니스
					&nbsp;
					<input type="radio" name="spoId" value='3'>배드민턴
					&nbsp;
					<input type="radio" name="spoId" value='4'>탁구
					&nbsp;
					<input type="radio" name="spoId" value='5'>수영
					&nbsp;
					<input type="radio" name="spoId" value='6'>골프
				</td>
			</tr>
			<tr>
				<th>레슨명</th>
				<td><input type="text" style="width:500px;" name="lesName"></td>
			</tr>
			<tr>
				<th>레슨 강사</th>
				<td><input type="text" style="width:500px;" name="lesTeacher"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" style="width:500px;" name="file" multiple="multiple"></td>
			</tr>
			<tr>
				<th>레슨 장소</th>
				<td><input type="text" style="width:500px;" name="lesLocation"></td>
			</tr>
			<tr>
				<th>레슨 전화번호</th>
				<td><input type="text" style="width:500px;" name="lesContact"></td>
			</tr>
			<tr>
				<th>레슨 비용</th>
				<td><input type="text" style="width:500px;" name="lesCost"></td>
			</tr>
			<tr>
				<th>개인/단체</th>
				<td>
					<input type="radio" name="lesType" value='personal'>개인
					&nbsp;
					<input type="radio" name="lesType" value='group'>단체
				</td>
			</tr>
			<tr>
				<th>주중/주말</th>
				<td>
					<input type="radio" name="lesWeekend" value='weekday'>주중
					&nbsp;
					<input type="radio" name="lesWeekend" value='weekend'>주말
				</td>
			</tr>
			<tr>
				<th>레슨 스케줄</th>
				<td></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="레슨 추가">
				</td>
			</tr>
		</table-->
	</form>
	<!-- <input type="submit" id="cancelbutton" value="취소" onclick="location.href='/lesson/list'"> -->



</div>

</div>
</div>

<%@ include file="footer.jsp" %> 