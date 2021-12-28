<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
	<h1>설문조사</h1>
	<p>설문지 제목: <textarea rows="1" cols="30" name="content" placeholder="해당 설문지의 제목을 입력하세요."></textarea>	</p>
	<p>설문지 설명: <textarea rows="3" cols="50" name="content" placeholder="해당 설문지의 설명을 입력하세요."></textarea>	
	<br><br>

	<button id="btn_add">질문추가</button>
	<div class="q_div"></div>

	<input type="button" name="btn" id="btn" value="질문선택 완료">
	<div class="add_div"></div>

	<script>
    let q_tag = `
		<div>
			<p>질문 추가</p>
			<select name="question" id="question">
				<option value="choice">객관식</option>
				<option value="short">단답형</option>
				<option value="long">장문형</option>
				
			</select>
		</div>
	`;
    
    $(document).on('click', '#btn_add', function () {
      $('.q_div').append(q_tag);
      alert("질문 추가");
    });
    
  </script>
  <script>
  let add_tag = `
  		<div>
  			<p>단답형</p>
  			질문 내용<input type= text>
  		</div>
  		<hr>
  	`;
  let add2_tag =`
  		<div>
  			<p>장문형</p>
  			질문 내용<input type= text>
  		</div>
  		<hr>
  	`;
    let add3_tag =`
  		<div>
  			<p>객관식</p>
  			질문 내용<input type= text>
  			<br><br>
  			<label><input type="checkbox"><input type=text></label>
  			<label><input type="checkbox"><input type=text></label>
  			<label><input type="checkbox"><input type=text></label>
  			<label><input type="checkbox"><input type=text></label>
  			
  		</div>
  		<hr>
  	`;
  	$(function(){
  		$('#btn').click(function(){
  			var qs =$("#question option:selected").text();
  			if(qs == '단답형'){
  	  			$('.add_div').append(add_tag);
  	  			alert(qs);
  			}else if(qs == '장문형'){
  				$('.add_div').append(add2_tag);  			
  				alert(qs);
  			}else if(qs == '객관식'){
  				$('.add_div').append(add3_tag);
  				alert(qs);
  			}else{
  				alert("옵션 선택하여주세요");
  			}
  		});
  	});
  </script>

</body>
</html>