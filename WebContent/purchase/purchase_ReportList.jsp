<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
		<div id=category>
		<jsp:include page="../category/submenuPurchase.jsp"></jsp:include>
	</div>
	
<div id=top_line> <!-- 맨 위 -->
	<span class='top_main'>구매보고서 조회</span>
	<input type='text' id='findStr'>
	<input type='button' id='btnFind' value='문서 검색' onclick="search()">
	<hr>
</div>
<div id='prList'> <!-- 요청서 리스트를 뿌려주는 곳 -->
	<span class='list1'>문서 번호</span>
	<span class='list2'>문서 종류</span>
	<span class='list3'>문서 제목</span>
	<span class='list4'>작성일</span>
	<span class='list5'>작성자</span>
	<span class='list6'>상태</span>
</div>
<div id='result'> <!-- DB에서 요청서 불러오는 곳 -->
	<c:forEach items="${list }" var="purList">
	<div id='con'>
		<span class='list1'>${purList.dCode } </span>
		<span class='list2'>${purList.dCate }  </span>
		<span class='list3'>${purList.dName }  </span>
		<span class='list4'>${purList.dDate }  </span>
		<span class='list5'>${purList.dWrite }  </span>
		<span class='list6'>${purList.dStatus }  </span>
	</div>
	</c:forEach>
</div>
	
	<div id='productResult'>
		생상 요청서 조회<br/>
		<a href='#' id='index.jsp?inc=../product/product_request_view.jsp'>상세 보기</a>
	</div>	
</body>
</html>