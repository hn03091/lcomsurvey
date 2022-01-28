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
	
			<input type="hidden" id="s_idx" value="${survey.s_idx }">
			<input type="hidden" id="q_type" value="${question.q_type}">
			<input type="hidden" id="q_idx" value="${question.q_idx}">
			<p>질문 제목: ${question.q_title }</p>
			
			<p>질문 설명: ${question.q_content }<p>
		
			<hr>
			
			
			<c:if test="${question.q_type  == 3 }">
		
				<c:forEach var="item" items="${question.items }">
					<input type="checkbox" name="sr_answer2" disabled checked>${item.i_content }
								
				</c:forEach>
				<hr>
				
			</c:if>
		<a href="/openresult?q_idx=${question.q_idx}&s_idx=${survey.s_idx}&q_type=${question.q_type}" target='_blank'>결과보기</a>
			
		</div>
	</c:forEach>
	

	<!-- <button class="button" onclick="window.open('openresult');" type="button" id="btn_openresult"  >결과보기</button> -->

	<!-- 
	<script>
	$(document).on('click','#btn_openresult',function(){
		
		let Result=[];
		
		$(".a_div").each(function (a){
			let s_idx= $(this).find('#s_idx').val();
			let q_idx =$(this).find('#q_idx').val();
			let q_type =$(this).find('#q_type').val();
			let getresult ={
					s_idx : s_idx,
					q_idx : q_idx,
					q_type : q_type
			}
			Result.push(getresult);
			
		});
	
		console.log(Result);
		
		$.ajax({
			type: "post",
			url:"http://localhost:8080/openresult",
			contentType: "application/json",
			data: JSON.stringify(Result)
		})
		.done(function (data){
			console.log(data);
			console.log('success');
			
		});
	});
	</script>
	 -->
</body>
</html>