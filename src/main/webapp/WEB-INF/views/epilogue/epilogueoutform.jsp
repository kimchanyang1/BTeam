<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4><B><font color="#fdafab">후기게시판</font></B></h4>
<h6><B>분양이 완료된 아이들의 후기글이 올라오는 게시판입니다</B></h6>
<h6><B>🐶😻</B></h6>
<br><br>

<table border="0" align="center" width="700">
<tr>
	<td>
	<c:if test="${fn:length(epiloguelist) > 0}">
	<c:forEach var="e" begin="0" end="${fn:length(epiloguelist)-1}" step="1">
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<a href="epiloguedetail?ep_no=${epiloguelist[e].ep_no}">
					<div class="thumbnail" style="cursor: pointer;">
						<p align="left"><B>구분</B>　${epiloguelist[e].ep_gb } </p>
						<p align="left"><B>제목</B>　${epiloguelist[e].ep_title } </p>
							<fmt:parseDate value="${epiloguelist[e].ep_writeday }" var="writedaydate" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${writedaydate }" var="writedaystring" pattern="yyyy-MM-dd HH:mm"/>
						<p align="left"><B>일자</B>　${writedaystring } </p>
						<img src="${pageContext.request.contextPath}/image/${epiloguelist[e].ep_image }" style="width: 200px; height: 200px;">
						<div class="caption">
							<p><B>${epiloguelist[e].mem_nickname }</B></p>
						</div>
					</div>
				</a>
			</div>
	<c:if test="${e%3 eq 2}">
	</td>
</tr>
<tr>
	<td>
	</c:if>
	</c:forEach>
	</c:if>
	
	<tr>
		<td colspan="5">　　</td></tr>
	   		<tr>
	   		 <td colspan="5" align="center">  
               <c:if test="${paging.startPage != 1}">
					<a href="epilogue?nowPage=1"><i class="fas fa-angle-double-left" style="font-size:18px;"></i></a>
				</c:if>    
               <c:if test="${paging.startPage != 1 }">
               <a href="epilogue?nowPage=${paging.startPage - 1}"><i class="fas fa-angle-left" style="font-size:18px;"></i></a>
               </c:if>
                   
               <c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="i">
               	<c:choose>
               		<c:when test="${paging.nowPage eq i}">
               			<font color="#ff8000"><B>　${i}　</B></font>
               		</c:when>
               		<c:otherwise>
               			<a href="epilogue?nowPage=${i}">　${i}　</a>
               		</c:otherwise>      		
               	</c:choose>        	
                </c:forEach>
                
               <c:if test="${paging.endPage != paging.lastPage}">
                  <a  href="epilogue?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
               </c:if>
               <c:if test="${paging.endPage != paging.lastPage}">
				<a href="epilogue?nowPage=${page.lastPage}"><i class="fas fa-angle-double-right" style="font-size:18px;"></i></a>
			</c:if>
			</td>
            </tr>
</table>

<br><br>

<table border="0" align="center" width="700">
<tr>
	<td colspan="6" align="center">
		<form action="epiloguesearch">
			<select name="selectname1">
		  		<option value="gohome">　귀가　</option>
		  		<option value="rehome">　분양　</option>
		  	</select>
			<select name="selectname2">
		  		<option value="ep_title">　제목　</option>
		  		<option value="mem_nickname">　작성자　</option>
		  	</select>
			<input type="text" name="searchname">
			<B><input type="submit" value="검색"></B>
		</form>
	</td>
</tr>

			
</table>

</body>
</html>