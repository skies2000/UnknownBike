<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품 재고 조회</title>
<link rel='stylesheet' href='../category/product_stock.css' />
<script>
function viewImg(code) {
	var gsWin = window.open("", "winName", 'width=800, height=600');
	var frm = document.getElementById('f');
	frm.pCode.value = code;
	frm.action = 'viewPimg.hoon';
	frm.target = "winName";
	frm.submit();
}
function search() {
	var frm = document.getElementById('frm');
	
	// 검색어로 사용할 변수들
	var pco = frm.txtCode.value;
	var pna = frm.txtName.value;
	var pca = frm.txtCate.value;
	
	// 히든에 꾸겨담는다
	frm.pCode.value = pco;
	frm.pName.value = pna;
	frm.pCate.value = pca;
	
	// 검색어에 아무것도 설정하지 않고 검색할 경우 리턴
	if (pco=='' && pna=='' && pca==0) {
		alert("검색 조건을 최소 1개 이상 입력해주씨오!");
		return;
	} 
	
	frm.action = 'searchP.sung';
	frm.submit();
}
</script>
</head>
<body>
   <div id=category>
      <jsp:include page="../category/submenuSales.jsp"></jsp:include>
   </div>
<form id='frm' method='post'>
	<div id=top_line> <!-- 맨 위 검색범위 선택하는 부분 -->
		<span class='top_main'>제품 검색</span>
		<span class='top_menu'>제품 코드</span>
		<input type='text' name='txtCode' value='0'>
		<span class='top_menu'>제품명</span>
		<input type='text' name='txtName'>
		<span class='top_menu'>카테고리</span>
		<select name="txtCate">
			<option selected value="0">- Category -</option>
			<option value="1">두발자전거</option>
			<option value="2">외발자전거</option>
			<option value="3">세발자전거</option>
			<option value="4">네발자전거</option>
			<option value="5">하이브리드</option>
		</select>
		<input type='button' id='btnFind' value='검색' onclick="search()">
	</div>
<div id='list'> <!-- 검색결과 타이틀 범위 -->
	<span class='css'>제품 코드</span>
	<span>제품 명</span>
	<span>카테고리</span>
	<span>가격</span>
	<span>등록일</span>
	<span>재고</span>
	<span>제품 이미지</span>
</div>
<div id='result'> <!-- 검색결과가 표시되는 범위 -->
	<!-- DB에서 요청서 불러오는 곳 -->
	<c:forEach items="${list }" var="listP">
	<div id='list'>
		<span class='css'>${listP.pCode }</span>
		<span>${listP.pName }</span>
		<span>
			<c:choose>
				<c:when test="${listP.pCate == 1}">두발자전거</c:when>
				<c:when test="${listP.pCate == 2}">외발자전거</c:when>
				<c:when test="${listP.pCate == 3}">세발자전거</c:when>
				<c:when test="${listP.pCate == 4}">네발자전거</c:when>
				<c:when test="${listP.pCate == 5}">하이브리드</c:when>
			</c:choose>
		</span>
		<span>${listP.pPrice }</span>
		<span>${listP.pDate }</span>
		<span>${listP.pEa }</span>
		<span class="wrap">
			<input type='button' value='이미지 보기' id='btnImg' onclick="viewImg(${listP.pCode })">
		</span>
	</div>
	</c:forEach>
</div>
	<input type='hidden' name='pCode'>
	<input type='hidden' name='pName'>
	<input type='hidden' name='pCate'>
</form>
<form id='f' method='post'>
	<input type='hidden' name='pCode'>
</form>
</body>
</html>