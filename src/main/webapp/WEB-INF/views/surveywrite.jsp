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
	<form action="/surveyprocess" method="post">
		<div>
			<p>
				설문지 제목:
				<textarea rows="1" cols="30" name="s_title"
					placeholder="해당 설문지의 제목을 입력하세요."></textarea>
			</p>
		</div>
		<div>
			<p>
				설문지 설명:
				<textarea rows="3" cols="50" name="s_content"
					placeholder="해당 설문지의 설명을 입력하세요."></textarea>
				<br> <br>
			</p>
		</div>
		<input type="submit" value="작성완료">
	</form>
	<hr>
	<button id="btn_add">질문추가</button>
	 <div class="q_div">
	 <textarea rows="1" cols="40" name="q_title" placeholder="질문을 입력하세요."></textarea>
			<select name="question" id="question" >
				<option value="옵션">유형을 선택하여주세요</option>
				<option value="객관식">객관식</option>
				<option value="단답형">단답형</option>
				<option value="장문형">장문형</option>
				
			</select>
			<br>
			<hr>
				
				
		
	 </div>

	
	<div class="add_div"></div>







	<script>
    let q_tag = `
		<div class="q_div">
    	<textarea rows="1" cols="40" name="q_title" placeholder="질문을 입력하세요."></textarea>
			<select name="question" id="question" >
				<option value="옵션">유형을 선택하여주세요</option>
				<option value="객관식">객관식</option>
				<option value="단답형">단답형</option>
				<option value="장문형">장문형</option>
				
			</select>
			<br>
			<hr>
				
				
		</div>
		
	`;
    
    $(document).on('click', '#btn_add', function () {
      $('.q_div').append(q_tag);
      alert("질문 추가");
      
    });
    

  
  let add_tag = `
		<div>
			<p>단답형</p>
			질문 내용:
				<br><br>
				<textarea rows="1" cols="40" name="q_title" placeholder="단답형 질문을 입력하세요."></textarea>
		</div>
		<hr>
	`;
let add2_tag =`
		<div>
			<p>장문형</p>
			<br><br>
			질문 내용:<textarea rows="3" cols="40" name="q_title" placeholder="장문형 설문지의 질문을 입력하세요."></textarea>
		</div>
		<hr>
	`;
  let add3_tag =`
		<div>
			<p>객관식</p>
			질문 내용<textarea rows="1" cols="40" name="q_title" placeholder="객관식 설문지의 질문을 입력하세요."></textarea>
			<br><br>
			<div>
				<div>
					<label>답안:<textarea rows="1" cols="30" name="i_content" placeholder="객관식 답변을 입력"></textarea></label>
				</div>
			</div>
			<button class="btn_answer">답안 추가</button>
			<br>
			
			
		</div>
		<hr>
	`;
let a_tag =`
	<div>
		<label>답안:<textarea rows="1" cols="30" name="i_content" placeholder="객관식 답변을 입력"></textarea></label>
	</div>
	`;
	
	
	
	$(document).on('click', '.btn_answer', function(){
		$(this).prev().append(a_tag);
		
	});
	
	$(document).on('change', '#question', function() {
		 
		let qs =$("#question option:selected").val();
		
		console.log('type: ' + qs);
		if(qs == '단답형'){
  			$('.add_div').append(add_tag);
  			alert(qs);
		}else if(qs == '장문형'){
			$('.add_div').append(add2_tag);  			
			alert(qs);
		}else if(qs == '객관식'){
			$('.add_div').append(add3_tag);
			alert(qs);
		}
		
	});
	 

  </script>
	... ... ...
</body>
</html>