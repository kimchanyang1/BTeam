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


<h1>여기는 상세페이지</h1>

<table border="1">
<tr>
<td><img src="${pageContext.request.contextPath}/image/${mic.mis_image }"></td>
<td>
<table border="1">
	<tr><td>글번호</td><td>${mic.mis_no}</td></tr>
	<tr>
		<td>구분</td>
		<td>
			${mic.mis_gb}
			<c:if test="${mem_id eq 'admin' || mem_no eq mic.mem_no}">
				<c:if test="${mic.mis_gb eq '실종'}">
					<button onclick="location.href='rehoming?mis_no=${mic.mis_no}'">귀가완료</button>
				</c:if>
			</c:if>
		</td>
	</tr>
	
	<tr><td>제목</td><td>${mic.mis_title}</td></tr>
	<tr><td>동물종류</td><td>${mic.mis_gb2}</td></tr>
	<tr><td>반려동물이름</td><td>${mic.mis_pname}</td></tr>
	<tr><td>등록번호</td><td>${mic.mis_pno}</td></tr>
	<tr><td>실종날짜</td><td>${mic.mis_misdate}</td></tr>
	<tr><td>실종장소</td><td>${mic.mis_misplace}</td></tr>
	<tr><td>회원번호</td><td>${mic.mem_no}</td></tr>
	<tr><td>회원닉네임</td><td>${mic.mem_nickname}</td></tr>
	<tr><td>회원전화</td><td>${mic.mem_tel}</td></tr>
	<tr><td>작성일자</td><td>${mic.mis_writeday}</td></tr>
	<tr><td>내용</td><td>${mic.mis_content}</td></tr>
	<tr><td>조회수</td><td>${mic.mis_readcount}</td></tr>
	<tr><td>글삭제/수정</td>
		<td>
			<c:if test="${mem_nickname eq mic.mem_nickname || mem_id eq 'admin'}">
					<a href="missingdelete?mis_no=${mic.mis_no}">삭제</a>
					<a href="missingmodifyform?mis_no=${mic.mis_no}">수정</a>
				<c:if test="${mic.mis_gb eq '귀가'}">
					<button onclick="location.href='epilogueinputform?ep_gb=귀가완료&ep_originno=${mic.mis_no}'">후기글쓰기</button>
				</c:if>
			</c:if>
		</td>
	</tr>
</table>
</td>
</tr>
</table>
</body>
</html>