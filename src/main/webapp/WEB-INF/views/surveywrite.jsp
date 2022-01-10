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
<style>
.layer1 {
	display: none;
}

.layer2 {
	display: none;
}

.layer3 {
	display: none;
}
</style>
<body>
	<h1>설문조사</h1>
	<div>
		<p class="survey">
			설문지 제목:
			<textarea class="title" rows="1" cols="30" name="s_title"
				placeholder="해당 설문지의 제목을 입력하세요."></textarea>
		</p>
	</div>
	<div>
		<p class="survey">
			설문지 설명:
			<textarea class="content" rows="3" cols="50" name="s_content"
				placeholder="해당 설문지의 설명을 입력하세요."></textarea>
			<br> <br>
		</p>
	</div>
	<div>
		<button type="button" id="btn_survey">작성완료</button>
	</div>
	<hr>
	<br>
	<br>



	<div class="q_div">
		<textarea rows="1" cols="40" name="q_title"
			placeholder="질문의 제목을 입력하세요."></textarea>

		<select name="q_type" class="q_type">
			<option value="0" selected>유형을 선택하여주세요</option>
			<option value="1">단답형</option>
			<option value="2">장문형</option>
			<option value="3">객관식</option>

		</select>

		<div class="layer1">
			<br>
			<div>

				질문 내용: <br> <br>
				<textarea rows="1" cols="40" name="q_content"
					placeholder="단답형 질문을 입력하세요."></textarea>
			</div>
			<hr>
		</div>
		<div class="layer2">
			<br>
			<div>

				<br> <br> 질문 내용:
				<textarea rows="3" cols="40" name="q_content"
					placeholder="장문형 설문지의 질문을 입력하세요."></textarea>
			</div>
			<hr>
		</div>
		<div class="layer3">
			<br>
			<div>
				질문 내용
				<textarea rows="3" cols="40" name="q_content"
					placeholder="객관식 설문지의 질문을 입력하세요."></textarea>
				<br> <br>
			</div>
			<div>
				<div class="i_div">
					<label>답안:<textarea rows="1" cols="30" name="i_content"
							placeholder="객관식 답변을 입력"></textarea></label>
				</div>
			</div>
			<br>
			<button class="btn_answer">답안 추가</button>
			<br>
		</div>
		<hr>
	</div>

	<br>
	<hr>

	<div>
		<button id="btn_add">질문추가</button>
	</div>



	<script>
    let q_tag = `
    	<div class="q_div">
		<textarea rows="1" cols="40" name="q_title" placeholder="질문의 제목을 입력하세요."></textarea>
		<select name="q_type" class="q_type">
			<option value="0">유형을 선택하여주세요</option>
			<option value="1">단답형</option>
			<option value="2">장문형</option>
			<option value="3">객관식</option>
		</select>
		<div class="layer1">
			<br>
			<div>				
				질문 내용: <br> <br>
				<textarea rows="1" cols="40" name="q_content"
					placeholder="단답형 질문을 입력하세요."></textarea>
			</div>
			<hr>
		</div>
		<div class="layer2">
			<br>
			<div>				
				<br>
				<br> 질문 내용:
				<textarea rows="3" cols="40" name="q_content"
					placeholder="장문형 설문지의 질문을 입력하세요."></textarea>
			</div>
			<hr>
		</div>
		<div class="layer3">
			<br>
			<div>				
				질문 내용
				<textarea rows="1" cols="40" name="q_content"
					placeholder="객관식 설문지의 질문을 입력하세요."></textarea>
				<br>
				<br>
			
				<div>
					<div class="i_div">
						<label>답안:<textarea rows="1" cols="30" name="i_content"
								placeholder="객관식 답변을 입력"></textarea></label>
					</div>
				</div>
				<br>
				<button class="btn_answer">답안 추가</button>
				<br>
			</div>
			<hr>
		</div>
		<br>
		<hr>
	</div>
		
	`;
    
    $(document).on('click', '#btn_add', function () {
      $(this).before(q_tag);

      alert("질문 추가");
      
    });
    

 
	let a_tag =`
	<div class = "i_div">
		<label>답안:<textarea rows="1" cols="30" name="i_content" placeholder="객관식 답변을 입력"></textarea></label>
	</div>
	<br>
	`;
			
	$(document).on('click', '.btn_answer', function(){
		$(this).before(a_tag);
		
	});
	
	$(document).on('change', '.q_type', function() {
		let qs = $(this).find('option:selected').val();
	
		//let qs = $(this).val();
		//let qs =$("#question option:selected").val();
		
		console.log('type: ' + qs);
		if(qs == '1'){ //단답형
 			$(this).next('.layer1').show();
 			$(this).next().next().hide();
 			$(this).next().next().next().hide();
  			
		}else if(qs == '2'){ //장문형
			$(this).next().hide();
 			$(this).next().next('.layer2').show();
 			$(this).next().next().next().hide();
  			
		}else if(qs == '3'){ //객관식
			$(this).next().hide();
 			$(this).next().next().hide();
 			$(this).next().next().next('.layer3').show();
  			
		}
		
	});
	
	$(document).on('click','#btn_survey',function(){
		let s_title = $('p.survey').find('textarea.title').val();
		let s_content = $('p.survey').find('textarea.content').val();
		
		let questions = [];
		$(".q_div").each(function (i) {
			let q_title = $(this).find('textarea[name="q_title"]').val();
			//let q_content = $(this).find('textarea[name="q_content"]:eq(1)').val();
			let q_type = $(this).find('option:selected').val();
				if(q_type == '1'){
					q_content=$(this).find('textarea[name="q_content"]:eq(0)').val();
				}else if(q_type =='2'){
					q_content=$(this).find('textarea[name="q_content"]:eq(1)').val();
				}else if(q_type =='3'){
					q_content=$(this).find('textarea[name="q_content"]:eq(2)').val();
				}
		
			let items = [];
			$(this).find(".i_div").each(function (i) {
				//console.log($(this));
				
					let i_content = $(this).find('textarea[name="i_content"]').val();
					let item = {
						i_content: i_content
						};
					items.push(item);
				
			});
			let question = {
				q_title: q_title,
				q_type: q_type,
				q_content: q_content,
				items: items
			}
			questions.push(question);
		});
		let survey = {
			s_title: s_title,
			s_content: s_content,
			questions: questions
		};
		console.log(survey);

		$.ajax({
			type: "post",
			url:"http://localhost:8080/surveyprocess",
			contentType: "application/json",
			data: JSON.stringify(survey)
		})
		.done(function (data) {
			console.log(data);
			console.log('success');
		});
	});


  </script>
	... ... ...
</body>
</html>