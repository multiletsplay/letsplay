<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/javascript">
	window.location.href="/";
</script>
</head>
<body>
<%
session.removeAttribute("login");
%>
</body>
</html>