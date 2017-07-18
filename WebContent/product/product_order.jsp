<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산 오더 관리</title>
<link rel='stylesheet' href='../category/product_request_list.css' />
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
	</div>
	<div id=top_line>
		<!-- 맨 위 -->
		<span class='top_main'>생산 오더 관리</span> 
	</div>
	
	<div id='list'>
		<!-- 오더 리스트를 뿌려주는 곳 -->
		<span class='list9'>문서번호</span>
		<span class='list9'>제품코드</span>
		<span class='list9'>제품명</span> 
		<span class='list9'>수량</span> 
		<span class='list9'>작업라인</span> 
		<span class='list9'>작업인원</span> 
		<span class='list9'>소요시간</span> 
		<span class='list9'>시작일</span> 
		<span class='list9'>완료일</span>
	</div>
	
	<div id='result'>
		<!-- DB에서 리스트 불러오는 곳 -->
		<c:forEach items="${list }" var="odd">
			<div id='list'>
				<span class='list9'>${odd.srlCode }</span> 
				<span class='list9'>${odd.srlMCode }</span> 
				<span class='list9'>${odd.pName }</span> 
				<span class='list9'>${odd.srlEa }</span> 
				<span class='list9'>${odd.workLine }</span> 
				<span class='list9'>${odd.workPeople }</span> 
				<span class='list9'>${odd.workTime }</span>
				<span class='list9'>${odd.workStartDate }</span>
				<span class='list9'>${odd.workEndDate }</span>
			</div>
		</c:forEach>
	</div>
</body>
</html>