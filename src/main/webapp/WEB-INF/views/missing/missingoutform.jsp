<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>실종강아지</h3>
<c:forEach items="${missingout}" var="mic">
<table border="1">
<tr><td>글번호</td><td>${mic.mis_no}</td></tr>
<tr><td>구분</td><td>${mic.mis_gb}</td></tr>
<tr><td>제목</td><td><a href="missingdetail?mis_no=${mic.mis_no}">${mic.mis_title}</a></td></tr>
<tr><td>반려동물이름</td><td>${mic.mis_pname}</td></tr>
<tr><td>등록번호</td><td>${mic.mis_pno}</td></tr>
<tr><td>실종날짜</td><td>${mic.mis_misdate}</td></tr>
<tr><td>실종장소</td><td>${mic.mis_misplace}</td></tr>
<tr><td>반려견사진</td><td>${mic.mis_image}</td></tr>
<tr><td>회원번호</td><td>${mic.mem_no}</td></tr>
<tr><td>회원닉네임</td><td>${mic.mem_nickname}</td></tr>
<tr><td>회원전화</td><td>${mic.mem_tel}</td></tr>
<tr><td>작성일자</td><td>${mic.mis_writeday}</td></tr>
<tr><td>내용</td><td>${mic.mis_content}</td></tr>
<tr><td>조회수</td><td>${mic.mis_readcount}</td></tr>
</table>
////////////////////////////////////////////////////////////////////////////////////////////
</c:forEach>
</body>
</html>