<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<style>
table {
	border-collapse: collapse;
}

table tr th {
	font-weight: 700;
}

table tr td, table tr th {
	border: 1px solid #818181;
	width: 200px;
	text-align: center;
}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Home Page</h1>
	<hr>
	<table>
	<c:forEach var="survey" items="${list}">
			<tr>
				<td>${survey.ROWNUM }</td>
				<td><a href="/detailsurvey?s_idx=${survey.s_idx}">${survey.s_title }</td>
				<td>${survey.s_content }</td>

			</tr>
		</c:forEach>
	</table>
	<div>
		<sec:authorize access="isAnonymous()">
			<a href="/login">로그인</a>
			<a href="/beforeSignUp">회원가입</a>
		</sec:authorize>
		<sec:authorize access="isAuthenticated()">
			<a href="/surveywrite">게시물 작성</a>
			<a href="/logout">로그아웃</a>
			<sec:authentication property="principal" var="principal" />
			<h2>${principal }</h2>
		</sec:authorize>
	</div>
	<div>
		<sec:authorize access="isAuthenticated()">
			<a href="/user/info">내 정보</a>
			<a href="/admin">관리자</a>
		</sec:authorize>
	</div>

</body>
</html>
