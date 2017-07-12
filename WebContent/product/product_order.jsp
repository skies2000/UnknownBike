<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산 오더 관리</title>
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
	</div>
	<div id=top_line>
		<!-- 맨 위 -->
		<span class='top_main'>생산 요청서 조회</span> 
			<input type='text' 	id='findStr'> 
			<input type='button' id='btnFind' value='문서 검색'	onclick="search()">
		<hr>
	</div>
	
	<div id='list'>
		<!-- 요청서 리스트를 뿌려주는 곳 -->
		<span class='list1'>문서 번호</span>
		<span class='list1'>제품 코드</span> 
		<span class='list1'>제품명</span> 
		<span	class='list3'>수량</span> 
		<span class='list2'>작업 시간</span> 
		<span class='list1'>작성자</span> 
		<span class='list1'>상태</span>
	</div>
	
	<div id='result'>
		<!-- DB에서 요청서 불러오는 곳 -->
		<c:forEach items="${list }" var="purList">
			<div id='list'>
				<span class='list1'>${purList.dCode } </span> 
				<span class='list1'>${purList.dCate }	</span> 
				<span class='list3'><a href='#' onclick="purView(${purList.dCode })">${purList.dName } </a></span> 
				<span class='list2'>${purList.dDate } </span> 
				<span class='list1'>${purList.eName } </span> 
				<span class='list1'>${purList.dStatus }</span>
			</div>
		</c:forEach>
	</div>
	<form name='frm' method='post' id='fff'>
		<input type='hidden' name='dCode'>
	</form>
</body>
</html>