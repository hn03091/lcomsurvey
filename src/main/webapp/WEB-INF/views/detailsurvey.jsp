<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<html>
<head>
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
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<hr>
	<p>설문지 제목 : ${survey.s_title }
	<p>
	<p>설문지 내용 : ${survey.s_content }
	<p>
	<hr>
<button class="button" type="button" id="btn_result"  >제출</button>

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
				<textarea rows="1" cols="40" name="sr_answer" placeholder="답변을 입력하세요."></textarea>			
			</c:if>
			
			<c:if test="${question.q_type  == 3 }">
		
				<c:forEach var="item" items="${question.items }">
					<input type="checkbox" name="sr_answer2" value='${item.i_idx }'>${item.i_content }
									
				</c:forEach>
			</c:if>
		</div>
	</c:forEach>
		
	
	<script>
	$(document).on('click','#btn_result',function(){				
		let Surveyresult =[];
		
		$(".a_div").each(function (a){			
			 // q_idx, 결과값 배열
			let answers =[];  //설문결과 answer 결과값 
			let s_idx = $(this).find('#sidx').val();
			let q_idx = $(this).find('#idx').val();
			let q_type = $(this).find('#type').val();			
			if(q_type < '3'){
				
				sr_answer = $(this).find('textarea[name="sr_answer"]').val();
				//console.log(sr_answer);
				//results.push(sr_answer);
			}else if(q_type == '3'){
				sr_answer = '';
				$(this).find('input:checked').each(function(){
					//console.log($(this).val());
					let i_idx = $(this).val();
					let answer = {
						i_idx : i_idx
					};
					answers.push(answer);
				});				
			}
		
			
			
			let result ={
					s_idx : s_idx,
					q_idx : q_idx,					
					sr_answer : sr_answer,
					answers : answers,
					q_type : q_type
				
					
			};
			Surveyresult.push(result);
		});
/*		let Surveyresult ={
				Surveyresults : Surveyresults
				
		};*/
		console.log(Surveyresult);
		
		$.ajax({
			type: "post",
			url:"http://localhost:8080/resultprocess",
			contentType: "application/json",
			data: JSON.stringify(Surveyresult)
		})
		.done(function (data){
			console.log(data);
			console.log('success');
			
		});
	});
	
	</script>
</body>
</html>