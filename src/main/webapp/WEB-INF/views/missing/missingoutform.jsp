<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resources/css/style.css" rel="stylesheet" />
</head>
<body>

<h3>실종반려동물</h3>
<c:if test="${logon eq true && mem_no != null}">
<a href="missinginputform"><input type="button" value="글 작성"></a>
</c:if>
<table border="1">
	<tbody>
		<c:forEach items="${missingout}" var="mic">		
		<tr> 
		<td><img src="${pageContext.request.contextPath}/image/${mic.mis_image}"></td>	
		</tr>
		<tr>
			<td><a href="missingdetail?mis_no=${mic.mis_no}">${mic.mis_title}</a></td>
		</tr>
		
		</c:forEach>
	</tbody>
</table>

</body>
</html>