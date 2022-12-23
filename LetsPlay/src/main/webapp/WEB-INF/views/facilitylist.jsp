<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
p { width: 230px; font-size: 14px;}
</style>
</head>
<body>
<h1>시설리스트</h1>
<div id="facility-list">
    <c:choose>
        <c:when test="${empty faclist }">
            <div>------ 시설이 없습니다. ------</div>
        </c:when>
        <c:otherwise>
            <c:forEach items="${faclist }" var="dto">
                <p>${dto.spoName}</p>
                <p><img width="210" src="${dto.facImg }"></p>
                <p><a href="/facility/detail?facseq=${dto.facSeq }">${dto.facName }</a></p>
                <p>${dto.facLocation }</p>
            </c:forEach>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>