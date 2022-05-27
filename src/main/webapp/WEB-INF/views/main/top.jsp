<%@page import="com.ezen.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<header>
	<h1 style="color: white;">PETMILLY</h1>
</header>
<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
		<a class="navbar-brand" href="home"><span class="glyphicon glyphicon-home"></span></a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active">
				<a href="noticeoutform">공지</a>
        	</li>
        	
        	<li class="active">
        		<a href="missingoutform">실종</a>
        	</li>
        	
			<li class="active">
				<a href="rehomeoutform">임시보호/분양</a>
        	</li>
        	
			<li class="active">
				<a class="dropdown-toggle" data-toggle="dropdown" href="#">
					실종/분양 후기<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li><a href="missingend">귀가 완료</a></li>
					<li><a href="rehomeend">분양 완료</a></li>
					<li><a href="epilogue">후기글</a></li>
				</ul>
        	</li>
        	<li class="active">
        			<a href="board">자유게시판</a>
        	</li>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:choose>
				<c:when test="${logon eq true && mem_nickname != null}">
					<c:if test="${mem_no eq 0}">
						<li class="active">
							<a class="dropdown-toggle" data-toggle="dropdown" style="cursor: pointer;">관리자 메뉴<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="rehomeadminpage">임시보호/분양 관리</a></li>
								<li><a href="ADmemberPage">회원목록 관리</a></li>
							</ul>
						</li>
					</c:if>
					<li><a class="navbar-brand" href="memberdetail">환영합니다! ${mem_nickname}님!</a></li>
					<li><a href="logout"><span class="glyphicon glyphicon-log-in"></span> 로그아웃</a></li>
				</c:when>
				<c:otherwise>
					<li><a href="signpolicy"><span class="glyphicon glyphicon-user"></span> 회원가입</a></li>
					<li><a href="loginform"><span class="glyphicon glyphicon-log-in"></span> 로그인</a></li>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</nav>
</body>
</html>