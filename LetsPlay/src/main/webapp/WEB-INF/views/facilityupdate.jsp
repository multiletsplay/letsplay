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
	
	var parking = '${dto.facParking}'
	var lent = '${dto.facLent}'
	var shower = '${dto.facShower}'
	var locker = '${dto.facLocker}'
	var light = '${dto.facLight}'
	var costcheck = '${dto.facCostcheck}'
	$("input:radio[name='facParking'][value="+parking+"]").prop('checked', true);
	$("input:radio[name='facLent'][value="+lent+"]").prop('checked', true);
	$("input:radio[name='facShower'][value="+shower+"]").prop('checked', true);
	$("input:radio[name='facLocker'][value="+locker+"]").prop('checked', true);
	$("input:radio[name='facLight'][value="+light+"]").prop('checked', true);
	$("input:radio[name='facCostcheck'][value="+costcheck+"]").prop('checked', true);
	
});
</script>
<div class="container inner pt40">
	<div class="m40 row">
		<form action="/facility/update" method="post">
			<input type="hidden" name="facSeq" value="${dto.facSeq }">
		<div class="match">
			<h3>시설 수정하기</h3>
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
				<p>시설 명</p>
				<input type="text" name="facName" value="${dto.facName }">
			</div>
	
			<div class="match__insert">
				<p>이미지(시설이미지나 시설관련 이미지)</p>
				<input type="file" name="file" multiple="multiple">
			</div>
	
			<div class="match__insert">
				<p>시설장소 주소(정확히 기입해주시기 바랍니다!)</p>
				<input type="text" name="facLocation"  value="${dto.facLocation }">
			</div>
	
			<div class="match__insert">
				<p>시설 전화번호(정확히 기입해주시기 바랍니다!)</p>
				<input type="text" name="facContact" value="${dto.facContact }">
			</div>
	
			<div class="match__insert">
				<p>시설 비용(시간당으로 기입해주세요! 없으면 0으로 기입!)</p>
				<input type="text" name="facCost" value="${dto.facCost }">
			</div>


			<div class="match__insert">
				<h4>상세정보</h4>
				<div class="options__list" style=" margin-left: 0px;">
					<p>주차장</p>
					<ul>
						<li>
							<input id="facility-PARK-y" type="radio" name="facParking" value='true'>
							<label for="facility-PARK-y">가능</label>
						</li>
						<li>
							<input id="facility-PARK-n" type="radio" name="facParking" value='false'>
							<label for="facility-PARK-n">불가능</label>
						</li>
					</ul>
				</div>
	
				<div class="options__list">
					<p>장비대여</p>
					<ul>
						<li>
							<input id="facility-RENT-y" type="radio" name="facLent" value='true'>
							<label for="facility-RENT-y">가능</label>
						</li>
						<li>
							<input id="facility-RENT-n" type="radio" name="facLent" value='false'>
							<label for="facility-RENT-n">불가능</label>
						</li>
					</ul>
				</div>
	
				<div class="options__list">
					<p>샤워시설</p>
					<ul>
						<li>
							<input id="facility-SWR-y" type="radio" name="facShower" value='true'>
							<label for="facility-SWR-y">가능</label>
						</li>
						<li>
							<input id="facility-SWR-n" type="radio" name="facShower" value='false'>
							<label for="facility-SWR-n">불가능</label>
						</li>
					</ul>
				</div>
	
				<div class="options__list">
					<p>락커</p>
					<ul>
						<li>
							<input id="facility-STASH-y" type="radio" name="facLocker" value='true'>
							<label for="facility-STASH-y">가능</label>
						</li>
						<li>
							<input id="facility-STASH-n" type="radio" name="facLocker" value='false'>
							<label for="facility-STASH-n">불가능</label>
						</li>
					</ul>
				</div>
	
				<div class="options__list">
					<p>조명</p>
					<ul>
						<li>
							<input id="facility-LIGHT-y" type="radio" name="facLight" value='true'>
							<label for="facility-LIGHT-y">가능</label>
						</li>
						<li>
							<input id="facility-LIGHT-n" type="radio" name="facLight" value='false'>
							<label for="facility-LIGHT-n">불가능</label>
						</li>
					</ul>
				</div>
	
				<div class="options__list">
					<p>가격 유무료</p>
					<ul>
						<li>
							<input id="facility-FEE-f" type="radio" name="facCostcheck" value='false'>
							<label for="facility-FEE-f">무료</label>
						</li>
						<li>
							<input id="facility-FEE-p" type="radio" name="facCostcheck" value='true'>
							<label for="facility-FEE-p">유료</label>
						</li>
					</ul>
				</div>
	
			</div>




			<p style="clear: both; margin-bottom: 70px;"></p>
			<input type="submit" value="시설등록" class="pay_Btn">
			<input type="button" value="취소" id="cancelbutton" onclick="location.href='/facility/detail?facSeq=${dto.facSeq }'" class="cancel">




<div>

		<!--table class="facility-insert" border="1">
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
				<th>시설명</th>
				<td><input type="text" style="width:500px;" name="facName" value="${dto.facName }"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" style="width:500px;" name="file" multiple="multiple"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" style="width:500px;" name="facLocation" value="${dto.facLocation }"></td>
			</tr>
			<tr>
				<th>시설전화번호</th>
				<td><input type="text" style="width:500px;" name="facContact" value="${dto.facContact }"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" style="width:500px;" name="facCost" value="${dto.facCost }"></td>
			</tr>
			<tr>
				<td colspan="2"><strong>상세정보</strong></td>
			</tr>
			<tr>
				<th>주차장</th>
				<td>
					<input type="radio" name="facParking" value='true'>Y
					&nbsp;
					<input type="radio" name="facParking" value='false'>N
				</td>
			</tr>
			<tr>
				<th>장비대여</th>
				<td>
					<input type="radio" name="facLent" value='true'>Y
					&nbsp;
					<input type="radio" name="facLent" value='false'>N
				</td>
			</tr>
			<tr>
				<th>샤워시설</th>
				<td>
					<input type="radio" name="facShower" value='true'>Y
					&nbsp;
					<input type="radio" name="facShower" value='false'>N
				</td>
			</tr>
			<tr>
				<th>락커</th>
				<td>
					<input type="radio" name="facLocker" value='true'>Y
					&nbsp;
					<input type="radio" name="facLocker" value='false'>N
				</td>
			</tr>
			<tr>
				<th>조명</th>
				<td>
					<input type="radio" name="facLight" value='true'>Y
					&nbsp;
					<input type="radio" name="facLight" value='false'>N
				</td>
			</tr>
			<tr>
				<th>가격유무료</th>
				<td>
					<input type="radio" name="facCostcheck" value='true'>Y
					&nbsp;
					<input type="radio" name="facCostcheck" value='false'>N
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="시설 수정">
					<input type="button" value="수정 취소" onclick="location.href='/facility/detail?facSeq=${dto.facSeq }'">
				</td>
			</tr>
		</!--table>-->
	</form>
</div>
</div>

</div>
</div>
<%@ include file="footer.jsp" %> 