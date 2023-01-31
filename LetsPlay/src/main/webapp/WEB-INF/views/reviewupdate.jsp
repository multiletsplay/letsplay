<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="/member/review/update" method="post">
<table class="reviewupdate" border="1">
	<c:choose>
	<c:when test="${dto.facName eq ''}">
		<table class="reviewupdate" border="1">
			<tr>
				<td>
					<input type="hidden" name="lesSeq" value="${dto.lesSeq} ">
					<input type="hidden" name="con" value="1">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${member.id}"></td>
			</tr>
			
			
			<tr>
				<th>레슨명</th>
				<td>
                     ${dto.lesName}
				</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
                    ${dto.lesLocation}
				</td>
			</tr>
			<tr>
				<th>별점</th>
				<td><input type="text" style="width:100px;" name="revRate"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><input type="text" style="width:300px; height:200px;" name="revContent"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정 완료">
				</td>
			</tr>
		</table>
		</c:when>
		<c:otherwise>
		<table class="reviewupdate" border="1">
			<tr>
				<td>
					<input type="hidden" name="facSeq" value="${dto.facSeq} ">
					<input type="hidden" name="con" value="2">
				</td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><input type="text" name="id" value="${member.id}"></td>
			</tr>
			
			
			<tr>
				<th>시설명</th>
				<td>${dto.facName}</td>
			</tr>
			<tr>
				<th>주소</th>
				<td>${dto.facLocation}</td>
			</tr>
			<tr>
				<th>별점</th>
				<td><input type="text" style="width:100px;" name="revRate"></td>
			</tr>
			<tr>
				<th>본문</th>
				<td><input type="text" style="width:300px; height:200px;" name="revContent"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="작성 완료">
				</td>
			</tr>
		</table>
		</c:otherwise>
		</c:choose>
</table> 
</form>
</body>
</html>