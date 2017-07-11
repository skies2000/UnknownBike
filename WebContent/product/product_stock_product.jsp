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
	var frm = document.getElementById('fff');
	frm.pCode.value = code;
	frm.action = 'viewPimg.hoon';
	frm.target = "winName";
	frm.submit();
}
</script>
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
	</div>
<div id=top_line> <!-- 맨 위 검색범위 선택하는 부분 -->
	<span class='top_main'>제품 검색</span>
	<span class='top_menu'>제품 코드</span>
	<input type='text' name='pcode'>
	<span class='top_menu'>제품명</span>
	<input type='text' name='pname'>
	<span class='top_menu'>카테고리</span>
	<select>
		<option selected>- Category -</option>
		<option>두발자전거</option>
		<option>외발자전거</option>
		<option>세발자전거</option>
		<option>네발자전거</option>
		<option>하이브리드</option>
	</select>
	<input type='button' id='btnFind' value='검색' onclick="search()">
	<hr>
</div>
<div id='list'> <!-- 검색결과 타이틀 범위 -->
	<span>제품 코드</span>
	<span>제품 명</span>
	<span>카테고리</span>
	<span>원가</span>
	<span>등록일</span>
	<span>재고</span>
	<span>제품 이미지</span>
</div>
<div id='result'> <!-- 검색결과가 표시되는 범위 -->
	<!-- DB에서 요청서 불러오는 곳 -->
	<c:forEach items="${list }" var="listP">
	<div id='list'>
		<span>${listP.pCode }</span>
		<span>${listP.pName }</span>
		<span>
			<c:choose>
				<c:when test="${listP.pCate == 1}">
				두발자전거
				</c:when>
				<c:when test="${listP.pCate == 2}">
				외발자전거
				</c:when>
				<c:when test="${listP.pCate == 3}">
				세발자전거
				</c:when>
				<c:when test="${listP.pCate == 4}">
				네발자전거
				</c:when>
				<c:when test="${listP.pCate == 5}">
				하이브리드
				</c:when>
			</c:choose>
		</span>
		<span>${listP.pCost }</span>
		<span>${listP.pDate }</span>
		<span>${listP.pEa }</span>
		<span><input type='button' value='이미지 보기' name='btnImg' onclick="viewImg(${listP.pCode })"></span>
	</div>
	</c:forEach>
</div>
<form name='frm' method='post' id='fff'>
	<input type='hidden' name='pCode'>
</form>
</body>
</html>