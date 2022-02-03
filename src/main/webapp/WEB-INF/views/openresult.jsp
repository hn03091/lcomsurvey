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
<body>

<hr>
<p>질문 제목 : ${survey.q_title }</p>
<hr>
<c:forEach var="result" items="${result}">

	<c:if test="${result.q_type  < 3 }">
		<p>설문 답변 : ${result.sr_answer}</p>
	</c:if>
</c:forEach>

<c:if test="${survey.q_type  == 3 }">
객관식 선택지
	<c:forEach var="getitem" items="${getitem }">
		<p>${getitem.i_idx}.${getitem.i_content}</p>
	
			<input type="hidden" id="iIdx" value="${getitem.i_idx }">
	</c:forEach>
	<hr>
	<c:forEach var="countItem" items="${countItem}">
		<div class="a_div">
		<input type="hidden" id="iIdx" value="${countItem.i_idx }">
		<input type="hidden" id="iCnt" value="${countItem.cnt }">
		<p>${countItem.i_idx}번 답안 갯수 : ${countItem.cnt }개</p>
		</div>
	</c:forEach>
	<button onclick="window.open('chart','AnswerChart','width=430,height=500')" class="button" type="button" id="btn_result"  >차트로보기</button>
	<hr>
		
 
	    <div id="piechart" style="width: 900px; height: 500px;"></div>
		
</c:if>

<script>
    $(document).on('click','#btn_result',function(){
		let chart =[];
		$(".a_div").each(function(a){
			let i_idx= $(this).find('#iIdx').val();
			let i_cnt= $(this).find('#iCnt').val();
			let item={
					i_idx: i_idx,
					i_cnt: i_cnt
			};
			chart.push(item);
			
		});
		console.log(chart);
 		
		
	    $.ajax({
	    	type:"post",
	    	url :"http://localhost:8080/chart",
	    	contentType:"application/json",
	    	data: JSON.stringify(chart)
	    })
	    .done(function (data){
	    	console.log(data);
	    	console.log('success');
	    });
    });	
    
    
   
    </script>
</body>
</html>