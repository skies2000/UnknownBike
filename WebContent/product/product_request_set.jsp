<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작업 설정</title>
<link rel='stylesheet' href='../category/product_request_set.css' />
</head>
<body>
<form name='req_set' method='post'>
<div id='main'>
	<h2>작업 설정</h2>
	<hr>
	<div id='content'>
		<label>제품코드</label>
		<span></span><br>
		<label>제품명</label>
		<span></span><br>
		<label>수량</label>
		<span></span><br>
		<label>작업 라인</label>
		<select>
			<option selected>1라인</option>
			<option>2라인</option>
			<option>3라인</option>
			<option>4라인</option>
			<option>5라인</option>
			<option>6라인</option>
		</select><br>
		<label>작업 인원</label>
		<input type='text' id='workP' placeholder='인원을 입력하세요'><br>
		<label>소요 시간</label>
		<span></span><br>
		<label>시작일</label>
		<input type='date' id='startD'><br>
		<label>완료일</label>
		<input type='date' id='endD'><br>
		<label>생산 기한</label>
		<span></span>
	</div>
	<div id='btn'>
		<input type='submit' value='저장'>
		<input type='reset' value='취소'>
	</div>
</div>
</form>
</body>
</html>