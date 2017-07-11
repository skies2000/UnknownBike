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
	var frm = document.getElementById('fff');
	frm.mCode.value = code;
	frm.action = 'viewMimg.hoon';
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
	<span class='top_main'>자재 검색</span>
	<span class='top_menu'>자재 코드</span>
	<input type='text' name='mcode'>
	<span class='top_menu'>자재명</span>
	<input type='text' name='mname'>
	<span class='top_menu'>카테고리</span>
	<select>
		<option selected>- Category -</option>
		<option>바퀴</option>
		<option>핸들</option>
		<option>프레임</option>
		<option>바구니</option>
		<option>안장</option>
		<option>보조바퀴</option>
		<option>브레이크</option>
		<option>벨</option>
		<option>라이트</option>
		<option>페달</option>
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
				<c:when test="${listM.mCate == 1}">
				바퀴	
				</c:when>
				<c:when test="${listM.mCate == 2}">
				핸들
				</c:when>
				<c:when test="${listM.mCate == 3}">
				프레임
				</c:when>
				<c:when test="${listM.mCate == 4}">
				바구니
				</c:when>
				<c:when test="${listM.mCate == 5}">
				안장
				</c:when>
				<c:when test="${listM.mCate == 6}">
				보조바퀴
				</c:when>
				<c:when test="${listM.mCate == 7}">
				브레이크
				</c:when>
				<c:when test="${listM.mCate == 8}">
				벨
				</c:when>
				<c:when test="${listM.mCate == 9}">
				라이트
				</c:when>
				<c:when test="${listM.mCate == 10}">
				페달
				</c:when>
			</c:choose>
		</span>
		<span>${listM.mPrice }</span>
		<span>${listM.mDate }</span>
		<span>${listM.mEa }</span>
		<span><input type='button' value='이미지 보기' name='btnImg' onclick="viewImg(${listM.mCode })"></span>
	</div>
	</c:forEach>
</div>
<form name='frm' method='post' id='fff'>
	<input type='hidden' name='mCode'>
</form>
</body>
</html>