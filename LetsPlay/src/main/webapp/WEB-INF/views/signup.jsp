<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp</title>
</head>
<body>
<h1>회원가입</h1>
<form action="/member/signup" method="post">
	<table border="1">
		<tr>
			<th>ID</th>
			<td><input type="text" name="id"></td>
		</tr>
		<tr>
			<th>BIRTH</th>
			<td><input type="text" name="birth"></td>
		</tr>
		<tr>
			<th>PASSWORD</th>
			<td><input type="text" name="password"></td>
		</tr>
		<tr>
			<th>NAME</th>
			<td><input type="text" name="name"></td>
		</tr>
		<tr>
			<th>GENDER</th>
			<td><input type="text" name="gender"></td>
		</tr>
		<tr>
			<th>NICKNAME</th>
			<td><input type="text" name="nickname"></td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td><input type="text" name="email"></td>
		</tr>
		<tr>
			<th>PHONE</th>
			<td><input type="text" name="phone"></td>
		</tr>
		
		<tr>
			<td>
				<input type="submit" value="회원가입">
				<input type="button" value="취소" onclick="location.href='/member/login'">
			</td>
		</tr>
		
	</table>


</form>
</body>
</html>