<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<title>Insert title here</title>
<script>

function goView(dCode){
	var frm = document.getElementById("frm");
	frm.dCode.value=dCode;
	frm.action = 'sales_req_view.so';
	frm.submit();
}


function search(){
	var frm = document.getElementById("frm2");
	var findStr1 = document.getElementById("txtFind").value;
	alert(findStr1);
	frm.findStr.value=findStr1; //hidden값 = find_Str;
	frm.action = 'pfindStr.so';
	frm.submit();
	
}

</script>
</head> 
<body>
<%-- <%
if(request.getParameter("find")==null){
	String find = "";
}
%> --%>

		<div id=category>
		<jsp:include page="../category/submenuPurchase.jsp"></jsp:include>
	</div>
	
<div id=top_line> <!-- 맨 위 -->
	<span class='top_main'>구매보고서 조회</span>
	
	<input type='text' id='txtFind'>
	<!-- <input type='button' id='btnFind' value='문서 검색' onclick='search()'> -->
	<a href='#' class='pibutton' id='pibutton' name='pibutton' onclick='search()'>검색</a>
	
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
<div id='line'></div>
<!-- DB에서 요청서 불러오는 곳 -->
<div id='result'>
	<c:forEach items="${list}" var="purList">
		<span class='list7'>${purList.dCode }</span>
		<span class='list8'><%-- ${purList.dCate } --%>구매요청서 </span>
		<span class='list9'>${purList.dName }</span>
		<span class='list10'>${purList.dDate }</span>
		<span class='list11'>${purList.eName }</span>
		<span class='list12'>
					  <c:choose>
        	    <c:when test="${purList.dStatus == 0 }">결재완료</c:when>
          		<c:when test="${purList.dStatus > 0 }">결재대기중</c:when>
         	</c:choose> 
		</span>
	</c:forEach>
</div>
	 
	 <input type='hidden' name='findStr'>
	 
	<!-- <div id='productResult'>
		생상 요청서 조회<br/>
		<a href='#' id='index.jsp?inc=../product/product_request_view.jsp'>상세 보기</a>
	</div>	 -->


<form name='frm' id='frm' method='post'>
		<input type='hidden' id='dCode' name='dCode'>
	</form>
	
		<form name='frm2' id='frm2' method='post'>
		<input type='hidden'  name='findStr'>
	</form>
<script></script>
</body>
</html>