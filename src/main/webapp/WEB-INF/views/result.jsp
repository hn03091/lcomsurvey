<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style type="text/css">
.a_div {
	
	border: 0.5px solid;
	padding: 10px;
}

.button {
 
 background-color: #4CAF50; /* 초록 */
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
	
}
</style>
<body>
<c:forEach var="question" items="${survey.questions}">

		<div class="a_div">
		설문 ${question.q_idx}
	
			<input type="hidden" id="sidx" value="${survey.s_idx }">
			<input type="hidden" id="type" value="${question.q_type}">
			<input type="hidden" id="idx" value="${question.q_idx}">
			<p>질문 제목: ${question.q_title }</p>
			
			<p>질문 설명: ${question.q_content }<p>
		
			<hr>
			
			<c:if test="${question.q_type < 3}">			
				설문 결과보기(?개) <!--  hide, show 이용 -->
				<hr>
				
			</c:if>
			
			<c:if test="${question.q_type  == 3 }">
		
				<c:forEach var="item" items="${question.items }">
					<input type="checkbox" name="sr_answer2" disabled checked>${item.i_content }
								
				</c:forEach>
				<hr>
				설문 결과보기(?개)	
			</c:if>
		</div>
	</c:forEach>
</body>
</html>