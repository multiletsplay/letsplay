<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="header.jsp" %>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(document).ready(function(){
		//이전 라디오선택값 가져오기
		var spoid = '${dto.spoId}'
		$("input:radio[name='spoId'][value="+spoid+"]").prop('checked', true);
		
		let Weekend = '${dto.lesWeekend}'
		let Typeles = '${dto.lesType}'
		$("input:radio[name='lesWeekend'][value="+Weekend+"]").prop('checked', true);
		$("input:radio[name='lesType'][value="+Typeles+"]").prop('checked', true);
		
	});
	</script>
<div class="container inner pt40">
	<div class="m40 row">
		<div class="match">
			<h3>레슨 수정하기</h3>
<div>
	<form action="/lesson/update" method="post">
	<input type="hidden" name="lesSeq" value="${dto.lesSeq }">
	<div class="match__insert ">
		<p>매칭을 원하는 스포츠</p>
		<ul>
			<li>
				<input id="sports_01" type="radio" name="spoId" value='1'>
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
		<input type="text" name="lesName"  value="${dto.lesName }">
	</div>

	<div class="match__insert">
		<p>레슨 강사</p>
		<input type="text" name="lesTeacher" value="${dto.lesTeacher }">
	</div>

	<div class="match__insert">
		<p>이미지(시설이미지나 레슨관련 이미지)</p>
		<input type="file" name="file" multiple="multiple">
	</div>

	<div class="match__insert">
		<p>레슨장소 주소(정확히 기입해주시기 바랍니다!)</p>
		<input type="text" name="lesLocation" value="${dto.lesLocation }">
	</div>

	<div class="match__insert">
		<p>레슨 전화번호(정확히 기입해주시기 바랍니다!)</p>
		<input type="text" name="lesContact" value="${dto.lesContact }" >
	</div>

	<div class="match__insert">
		<p>레슨 비용(시간당으로 기입해주세요!)</p>
		<input type="text"name="lesCost" value="${dto.lesCost }" placeholder="${dto.lesCost }">
	</div>


	<div class="match__insert">
		<p>레슨 종류(개인 혹은 단체인지 꼭 선택해주세요)</p>
		<!-- <input type="text" name="lesType" value="${dto.lesType }"> -->
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
		<!-- <input type="text" name="lesWeekend" value="${dto.lesWeekend }"> -->
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

	<!-- <div class="match__insert">
		<p>레슨 이미지</p>
		<input type="text" name="lesImg" value="${dto.lesImg }">
	</div> -->


	<input type="submit" value="수정완료" class="pay_Btn">
	<input type="button" value="취소" onclick="location.href='/lesson/detail?lesSeq=${dto.lesSeq }'" class="cancel">
		
	<!-- table class="lesson-update" border="1" >
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
				<td><input type="text" style="width:500px;" name="lesName" value="${dto.lesName }"></td>
			</tr>
			<tr>
				<th>레슨 강사</th>
				<td><input type="text" style="width:500px;" name="lesTeacher" value="${dto.lesTeacher }"></td>
			</tr>
			<tr>
				<th>레슨 전화번호</th>
				<td><input type="text" style="width:500px;" name="lesContact" value="${dto.lesContact }"></td>
			</tr>
			<tr>
				<th>레슨 비용</th>
				<td><input type="text" style="width:500px;" name="lesCost" value="${dto.lesCost }"></td>
			</tr>
			<tr>
				<th>레슨 장소</th>
				<td><input type="text" style="width:500px;" name="lesLocation" value="${dto.lesLocation }"></td>
			</tr>
			<tr>
				<th>레슨 종류</th>
				<td><input type="text" style="width:500px;" name="lesType" value="${dto.lesType }"></td>
			</tr>
			<tr>
				<th>레슨 주중 OR 주말</th>
				<td><input type="text" style="width:500px;" name="lesWeekend" value="${dto.lesWeekend }"></td>
			</tr>
			<tr>
				<th>레슨 이미지</th>
				<td><input type="text" style="width:500px;" name="lesImg" value="${dto.lesImg }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="레슨 수정">
					<input type="button" value="수정 취소" onclick="location.href='/lesson/detail?lesSeq=${dto.lesSeq }'">
				</td>
			</tr>
		</!-->
	</form>
</div>

</div>
</div>
</div>

<%@ include file="footer.jsp" %> 