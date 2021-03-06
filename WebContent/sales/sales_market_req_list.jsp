<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='../category/sales_market_req_list.css' />
<title>Insert title here</title>
<script>
	function goView(dCode){
		var frm = document.getElementById("frm");
		frm.dCode.value=dCode;
		frm.action = 'sales_req_view.sung';
		frm.submit();
	}
	
	function search() {
		var frm = document.getElementById("frm2");
		var find_Str = document.getElementById("txtFind").value;
		alert(find_Str);
		frm.findStr.value=find_Str;
		frm.action = 'search_list.sung';
		frm.submit();	
			
		}
</script>
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
				<input type='button' id='btnFind' value='문서 검색' onclick=search()>
			</div>
		</div>
		<div id='list_title'>
		 <span id='docNum'>문서번호</span>
		 <span id='docsub'>문서제목</span>
		 <span id='docpro'>요청품목</span> 
		 <span id='docea'>요청갯수</span> 
		 <span id='docdate'>작성일</span>
		 <span id='docwriter'>작성자</span> 
		 <span id='docstatus'>상태</span>
		</div>
		
		<div id='content_list'>
		
			<c:forEach items="${docuList}" var="docuList">
			<div id='list'>
			<span id='docNum'>srl-${docuList.dCode }</span>
			 <span id='docsub' onclick='goView(${docuList.dCode })'>${docuList.dName }</span>
			 <span id='docpro'>${docuList.pName }</span> 
			 <span id='docea'>${docuList.srlEa }</span> 
			 <span id='docdate'>${docuList.dDate }</span>
			 <span id='docwriter'>${docuList.eName }</span> 
			 <span id='docstatus'>
			  <c:choose>
        	    <c:when test="${docuList.dStatus == 0 }">결재완료</c:when>
          		<c:when test="${docuList.dStatus > 0 }">결재대기중</c:when>
         	</c:choose> 
			 </span>
			</div>
			</c:forEach>
			
		</div>
		
	</div>
	<form name='frm' id='frm' method='post'>
		<input type='hidden' id='dCode' name='dCode'>
	</form>
	<form name='frm2' id='frm2' method='post'>
		<input type='hidden'  name='findStr'>
	</form>
	
</body>

</html>