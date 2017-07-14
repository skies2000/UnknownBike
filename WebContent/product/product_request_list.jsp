<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산 요청서 조회</title>
<link rel='stylesheet' href='../category/product_request_list.css' />
<script>
// 제목을 누르면 PK(문서번호??)를 가지고 가야대
function purView(code) {
	var frm = document.getElementById('fff');
	frm.dCode.value = code;
	frm.action = 'reqView.hoon';
	frm.submit();
}
function search() {
	var frm = document.getElementById('find');
	
	// 검색어 불러와서 히든에 처넣는다
	var find = document.getElementById('findStr').value;
	frm.findStr.value = find;
	
	frm.action = 'search.hoon';
	frm.submit();
}
</script>
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
	</div>
	<div id=top_line>
		<!-- 맨 위 -->
		<span class='top_main'>생산 요청서 조회</span> 
			<input type='text' id='findStr' placeholder="문서제목이나 작성자로 검색"> 
			<input type='button' id='btnFind' value='문서 검색'	onclick="search()">
		<hr>
	</div>
	
	<div id='list'>
		<!-- 요청서 리스트를 뿌려주는 곳 -->
		<span class='list1'>문서 번호</span> 
		<span class='list1'>문서 종류</span> 
		<span	class='list3'>문서 제목</span> 
		<span class='list2'>작성일</span> 
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
				<span class='list1'>
					<c:choose>
						<c:when test="${purList.dStatus == 0}">승인 완료</c:when>
					</c:choose>
				</span>
			</div>
		</c:forEach>
	</div>
	<form name='frm' method='post' id='fff'>
		<input type='hidden' name='dCode'>
	</form>
	<form name='f' method='post' id='find'>
		<input type='hidden' name='findStr'>
	</form>
</body>
</html>