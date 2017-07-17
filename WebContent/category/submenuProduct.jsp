<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Menu page</title>
<link rel='stylesheet' href='../category/category.css' />
<script src='../jq_lib/common.js'></script>
</head>
<body>
	<div id='uipgMenuWrap'>
		<div class='uipgMenu'>
			<ul>
				<li><a href="productHome.hoon">HOME</a>
				<li><a>생산관리</a>
				<ul>
					<li><a href="reqOdd.hoon">생산 오더 관리</a> 
					<li><a href="reqList.hoon">생산 요청서 조회</a> 
					<li><a href="index.jsp?inc=../product/product_eff.jsp">생산효율관리</a> 
				</ul>
				</li>
				<li><a>재고조회</a>
				<ul>
					<li><a href="listP.hoon">제품 재고 조회</a>
					<li><a href="listM.hoon">자재 재고 조회</a>
				</ul>
				</li>
			</ul>
		</div>
	</div>
</body>
</html>
