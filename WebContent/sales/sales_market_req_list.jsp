<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='../category/sales_market_req_list.css' />
<title>Insert title here</title>
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuSales.jsp"></jsp:include>
	</div>

	<div id='SalesResult'>
		<div id='head'>
			<div id='title'>생산요청서 조회</div>
			<div id='finStr'>
				<input type='text' id='txtFind'>
			</div>
			<div id='findBtn'>
				<input type='button' id='btnFind' value='문서 검색'>
			</div>
		</div>
		<div id='list_title'>
		 <span id='docNum'>문서번호</span>
		 <span id='doctype'>문서종류</span> 
		 <span id='docsub'>문서제목</span>
		 <span id='docdate'>작성일</span>
		 <span id='docwriter'>작성자</span> 
		 <span id='docstatus'>상태</span>
		</div>
		
		<c:forEach items="${docuList}" var="docuList">
		
		<div id='list'>
		<span id='docNum'>${docuList.dCode }</span>
		 <span id='doctype'>${docuList.dCate }</span> 
		 <span id='docsub'>${docuList.dCont }</span>
		 <span id='docdate'>${docuList.dDate }</span>
		 <span id='docwriter'>${docuList.dWrite }</span> 
		 <span id='docstatus'>${docuList.dStatus }</span>
		</div>
		</c:forEach>
		
	</div>
</body>

</html>