<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Menu page</title>
<link rel='stylesheet' href='../category/category.css' />

<script src='../jq_lib/common.js'></script>
<script>
// 생산 오더 관리
function purOdd() {
	var frm = document.frm2;
	frm.action = 'reqOdd.hoon';
	frm.submit();
}
// 생산 요청서 조회
function purList() {
	var frm = document.frm;
	frm.dCate.value = 'srl';
	frm.action = 'reqList.hoon';
	frm.submit();
}
// 제품 재고 조회
function stockP() {
	var frm = document.frm2;
	frm.action = 'listP.hoon';
	frm.submit();
}
// 자재 재고 조회
function stockM() {
	var frm = document.frm2;
	frm.action = 'listM.hoon';
	frm.submit();
}
</script>
</head>
<body>
	<div id='uipgMenuWrap'>
		<div class='uipgMenu'>
			<ul>
				<li><a href="index.jsp?inc=../product/product_home.jsp">HOME</a>
				<li><a href="index.jsp?inc=../product/product_management.jsp">생산관리</a>
				<ul>
					<li><a href="#" onclick="purOdd()">생산 오더 관리</a> 
					<li><a href="#" onclick="purList()">생산 요청서 조회</a> 
					<li><a href="index.jsp?inc=../product/product_eff.jsp">생산효율관리</a> 
				</ul>
				</li>
				<li><a href="index.jsp?inc=../product/product_stock.jsp">재고조회</a>
				<ul>
					<li><a href="#" onclick="stockP()">제품 재고 조회</a>
					<li><a href="#" onclick="stockM()">자재 재고 조회</a>
				</ul>
				</li>
			</ul>
		</div>
	</div>
	<form name='frm' method='post'>
		<input type='hidden' name='dCate'>
	</form>
	<!-- hidden에 값을 넘겨야되는 메뉴는 frm으로, 넘길 필요 없는 메뉴는 frm2로 -->
	<form name='frm2' method='post'></form>
</body>
</html>
