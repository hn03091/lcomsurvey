<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['Work',     3],
          ['Eat',      2],
          ['Commute',  2],
          ['Watch TV', 2],
          ['Sleep',    7]
        ]);

        var options = {
          title: 'My Daily Activities'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
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
		<p>${countItem.i_idx}번 답안 갯수 : ${countItem.cnt }개</p>
	</c:forEach>
	<hr>
	    <div id="piechart" style="width: 900px; height: 500px;"></div>
		
</c:if>


</body>
</html>