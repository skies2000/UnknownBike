<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<style>

/*★☆★☆★☆★구매보고서조회☆★☆★☆★☆★  */


#top_line {
   border-bottom: 1px solid #ffffff;
   margin-bottom: 40px;
}

.top_main {
   display: inline-block;
   width: 300px;
   font-size: 25pt;
   margin: 10px;
   margin-right: 300px;
}

#findStr {
   height: 25px;
}

#btnFind {
   width: 100px;
   color: black;
   height: 25px; 
}

#list {
   text-align: center;
}

/* .list1, .list2, .list3 {
   display: inline-block;
   text-align: center;
   margin-bottom: 20px;
}

.list1 {
   width: 90px;
}

.list2 {
   width: 120px;
}

.list3 {
   width: 240px;
} */

#line{
   border-bottom:2px solid #7c7c7c;
}
.list1 {
    display:inline-block;
    width:15%;
    
}

.list2 {
    display: inline-block;
    width: 15%;
   
}
.list3 {
    display: inline-block;
    width: 27%;
   
}

.list4 {
    display: inline-block;
    width: 15%;
   
}

.list5 {
    display: inline-block;
    width: 13%;
  
}

.list6 {
    display: inline-block;
    width: 12%;
    
}

.list7 {
    display:inline-block;
    width:15%;
    padding-top:10px;
   padding-bottom:15px;
}

.list8 {
    display: inline-block;
    width: 15%;
   padding-bottom:15px;
}
.list9 {
    display: inline-block;
    width: 27%;
   padding-bottom:15px;
}

.list10 {
    display: inline-block;
    width: 15%;
   padding-bottom:15px;
}

.list11 {
    display: inline-block;
    width: 13%;
  padding-bottom:15px;
}

.list12 {
    display: inline-block;
    width: 12%;
    padding-bottom:15px;
}



#result {
   display: inline-block;
   width: 100%;
   height: 100%;
   background-color: #999999;
   color: #000000;
   text-align: center;
  

}

#prList{
   text-align: center;
   margin-bottom:10px;
   
}
</style>
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

 function godetailpur(dCode1){
	 var frm3 = document.getElementById("frm");
	   frm3.dCode.value=dCode1; //hidden값 = find_Str;
	   frm3.action = 'gopur_detail.so';
	   frm3.submit();
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
   <input type='button' id='btnFind' value='문서 검색' onclick='search()'>
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
      <a href="#" onclick="godetailpur(${purList.dCode })"><span class='list9'>${purList.dName }</span></a>
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
   </div>    -->


<form name='frm' id='frm' method='post'>
      <input type='hidden' id='dCode' name='dCode'>
   </form>
   
      <form name='frm2' id='frm2' method='post'>
      <input type='hidden'  name='findStr'>
   </form>
   

   
   
<script></script>
</body>
</html>