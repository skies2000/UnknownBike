<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>자재 재고 조회</title>
<link rel='stylesheet' href='../category/product_stock.css' />
<script>
function viewImg(code) {
	var gsWin = window.open("", "winName", 'width=800, height=600');
	var frm = document.getElementById('f');
	frm.mCode.value = code;
	frm.action = 'viewMimg.hoon';
    frm.target = "winName";
	frm.submit();
}
function search() {
	var frm = document.getElementById('frm');
	
	// 검색어로 사용할 변수들
	var mco = frm.txtCode.value;
	var mna = frm.txtName.value;
	var mca = frm.txtCate.value;
	
	// 히든에 꾸겨담는다
	frm.mCode.value = mco;
	frm.mName.value = mna;
	frm.mCate.value = mca;
	
	// 검색어에 아무것도 설정하지 않고 검색할 경우 리턴
	if (mco=='' && mna=='' && mca==0) {
		alert("검색 조건을 최소 1개 이상 입력해주씨오!");
		return;
	} 
	
	frm.action = 'searchM.hoon';
	frm.submit();
}
</script>
</head>
<body>
<div id=category> <!-- 항상 갖고 다니는 상단 카테고리 -->
	<jsp:include page="../category/submenuProduct.jsp"/>
</div>
<form id='frm' method='post'>
	<div id=top_line> <!-- 맨 위 검색범위 선택하는 부분 -->
		<span class='top_main'>자재 검색</span>
		<span class='top_menu'>자재 코드</span>
		<input type='text' name='txtCode' value='0'>
		<span class='top_menu'>자재명</span>
		<input type='text' name='txtName'>
		<span class='top_menu'>카테고리</span>
		<select name="txtCate">
			<option selected value="0">- Category -</option>
			<option value="1">바퀴</option>
			<option value="2">핸들</option>
			<option value="3">프레임</option>
			<option value="4">바구니</option>
			<option value="5">안장</option>
			<option value="6">보조바퀴</option>
			<option value="7">브레이크</option>
			<option value="8">벨</option>
			<option value="9">라이트</option>
			<option value="10">페달</option>
		</select>
		<input type='button' id='btnFind' value='검색' onclick="search()">
		<hr>
	</div>
<div id='list'> <!-- 검색결과 타이틀 범위 -->
	<span>자재 코드</span>
	<span>자재 명</span>
	<span>카테고리</span>
	<span>가격</span>
	<span>등록일</span>
	<span>재고</span>
	<span>자재 이미지</span>
</div>
<div id='result'> <!-- 검색결과가 표시되는 범위 -->
	<!-- DB에서 요청서 불러오는 곳 -->
	<c:forEach items="${list }" var="listM">
	<div id='list'>
		<span>${listM.mCode }</span>
		<span>${listM.mName }</span>
		<span>
			<c:choose>
				<c:when test="${listM.mCate == 1}">바퀴</c:when>
				<c:when test="${listM.mCate == 2}">핸들</c:when>
				<c:when test="${listM.mCate == 3}">프레임</c:when>
				<c:when test="${listM.mCate == 4}">바구니</c:when>
				<c:when test="${listM.mCate == 5}">안장</c:when>
				<c:when test="${listM.mCate == 6}">보조바퀴</c:when>
				<c:when test="${listM.mCate == 7}">브레이크</c:when>
				<c:when test="${listM.mCate == 8}">벨</c:when>
				<c:when test="${listM.mCate == 9}">라이트</c:when>
				<c:when test="${listM.mCate == 10}">페달</c:when>
			</c:choose>
		</span>
		<span>${listM.mPrice }</span>
		<span>${listM.mDate }</span>
		<span>${listM.mEa }</span>
		<span><input type='button' value='이미지 보기' name='btnImg' onclick="viewImg(${listM.mCode })"></span>
	</div>
	</c:forEach>
</div>
	<input type='hidden' name='mCode'>
	<input type='hidden' name='mName'>
	<input type='hidden' name='mCate'>
</form>
<form id='f' method='post'>
	<input type='hidden' name='mCode'>
</form>
</body>
</html>