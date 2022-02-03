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
<div id="piechart" style="width: 900px; height: 500px;"></div>


<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
  
    
google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
  	
      function drawChart() {
    	  
    	/*  var jsonData = $.ajax({
    		
      		url :"http://localhost:8080/openresult",
      		async : false
      	  }).responseText;
     
      	  
      	  var data = new google.visualization.DataTable();
      	  var chart = new google.visualization.PieChart(document
      			  .getElementById('chart_div'));
      	  chart.draw(data,{
      		width:400,
      	  	height : 240,
      	  	title: 'Answer Chart'
      	  });
      	*/
      	
 				
        var data = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['1',     3],
          ['2',      2],
          ['3',  2],
          ['4', 2]
        ]);

        var options = {
          title: 'AnswerChart'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
</body>
</html>