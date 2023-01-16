<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
	$(document).ready(function(){
		$("input [id=file]").change(function(){
			if($(this).val() !== ""){
				for(var i=0; i<this.files.length; i++){
					var fileSize = this.files[i].size;
					var maxSize = 1024*1024*10;
					if(fileSize>maxSize){
						alert(this.files[i].name+"(이)가 10MB를 초과했습니다.");
						$(this).val("");
					}
				}
			}
		})
	});
</script>
</head>
<body>
<h1>시설 추가</h1>
<div>
	<form action="/facility/insert" method="post" enctype="multipart/form-data">
		<table class="facility-insert" border="1">
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
				<td><input type="text" style="width:500px;" name="facName"></td>
			</tr>
			<tr>
				<th>이미지</th>
				<td><input type="file" style="width:500px;" name="file" multiple="multiple"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" style="width:500px;" name="facLocation"></td>
			</tr>
			<tr>
				<th>시설전화번호</th>
				<td><input type="text" style="width:500px;" name="facContact"></td>
			</tr>
			<tr>
				<th>가격</th>
				<td><input type="text" style="width:500px;" name="facCost"></td>
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
					<input type="submit" value="시설 추가">
				</td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>