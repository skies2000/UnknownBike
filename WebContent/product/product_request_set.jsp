<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>작업 설정</title>
<link rel='stylesheet' href='../category/product_request_set.css' />
<script src="../jq_lib/jquery-3.2.1.min.js"></script>
<script>
function saveData() {
	// 상단폼(ffffff) 하단폼(fff : 히든값 저장)
	var frm1 = document.getElementById('ffffff');
	var frm2 = document.getElementById('fff');
	
	// 상단 폼에 있는 데이터를 변수에 저장
	var wL = frm1.workLine.value;
	var wP = frm1.workPeople.value;
	var sD = frm1.startDate.value;
	var eD = frm1.endDate.value;
	
	// 히든값에 저장
	frm2.workLine.value = wL;
	frm2.workPeople.value = wP;
	frm2.workStartDate.value = sD;
	frm2.workEndDate.value = eD;
	
	frm2.action = 'saveData.hoon';
	frm2.submit();
}
</script>
</head>
<body>
<form name='req_set' method='post' id='ffffff'>
<div id='main'>
	<h2><span class='title'>작업 설정</span></h2>
	<div id='content'>
		<label>제품코드</label>
		<span>${vo.srlMCode }</span><br>
		<label>제품명</label>
		<span>${vo.pName }</span><br>
		<label>수량</label>
		<span class='test444'>${vo.srlEa }</span><br>
		<label>작업 라인</label>
		<select name="workLine">
			<option selected>1라인</option>
			<option>2라인</option>
			<option>3라인</option>
			<option>4라인</option>
			<option>5라인</option>
			<option>6라인</option>
		</select><br>
		<label>작업 인원</label>
		<input type='text' id='workP' placeholder='인원을 입력하세요' name='workPeople'><br>
		<label>소요 시간</label>
		<span>${vo.pManhour }</span><br>
		<label>시작일</label>
		<input type='date' id='startD' name='startDate'><br>
		<label>완료일</label>
		<input type='date' id='endD' name='endDate'><br>
		<label>생산 기한</label>
		<span>${vo.srlTerm }</span>
	</div>
	<div id='btn'>
		<input type='button' value='저장' onclick="saveData()">
		<input type='reset' value='취소'>
	</div>
</div>
</form>
<form name='frm' method='post' id='fff'>
	<!-- fList table에 저장할 값 8개 -->
	<input type='hidden' name='srlCode' value='${vo.srlCode }'>
	<input type='hidden' name='srlMCode' value='${vo.srlMCode }'>
	<input type='hidden' name='srlEa' value='${vo.srlEa }'>
	<input type='hidden' name='workLine'>
	<input type='hidden' name='workPeople'>
	<input type='hidden' name='pManhour' value='${vo.pManhour }'>
	<input type='hidden' name='workStartDate'>
	<input type='hidden' name='workEndDate'>
</form>
<script>start()</script>
</body>
</html>