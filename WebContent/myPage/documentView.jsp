<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='../category/sales_market_sale_view.css' />
<title>Insert title here</title>
<style>
#list_title {
   text-align: center;
}
#plist_header{
   font-size: 14px;
   width : 20%;
   margin-left: 85px;
}
#plist_content{
   border : 1px solid white;
   margin: auto;
   width: 700px;
   height: 87%;
   padding : 5px;
}
#pdview_btn{
   text-align: center;
}
</style>
<script>
function approveFunc(code){
	if(!confirm("승인 하시겠습니까?")) return;
	location.href="myPageDocApp.hwan?dcode="+code;
}
function denyFunc(code){
	if(!confirm("거절 하시겠습니까?")) return;
	location.href="myPageDocDeny.hwan?dcode="+code;
}
</script>
</head>
<body>
   <div id=category>
      <jsp:include page="../category/submenuMyPage.jsp"></jsp:include>
   </div>

   <div id='SalesResult'>
      <div id='body'>
         <!--  ------------------상단타이틀--------------------  -->
         <div id='title'>${obj.dcateName}</div>
         <!--  ------------------헤더--------------------  -->
         <div class='head'>
            <div id='sign1'>
               <label>문서번호</label><br /> <label>${obj.dcode}</label>
            </div>
            <div id='sign2'>
               <div id='appro'>결&nbsp재&nbsp내&nbsp역</div>
               <div id='writer'>${obj.ename}</div>
               <div id='appro1'>${obj.appOne}</div>
               <div id='appro2'>${obj.appTwo}</div>
               <div id='stamp1'>
                  <div id='status'>작성</div>
                  <div id='app_date'>${obj.ddate}</div>
               </div>
               <div id='stamp2'>
                  <div id='status'>
                  <c:if test="${obj.dStatus==0}">완료</c:if>
                  <c:if test="${obj.dStatus==1}">완료</c:if>
                  <c:if test="${obj.dStatus==2}">대기</c:if>
                  <c:if test="${obj.dStatus==-1}">거절</c:if>
                  </div>
                  <div id='app_date'>${obj.ddate}</div>
               </div>
               <div id='stamp3'>
                  <div id='status'>
                  <c:if test="${obj.dStatus==0}">완료</c:if>
                  <c:if test="${obj.dStatus==1}">대기</c:if>
                  <c:if test="${obj.dStatus==2}">대기</c:if>
                  <c:if test="${obj.dStatus==-1}">거절</c:if>
                  </div>
                  <div id='app_date'>${obj.ddate}</div>
               </div>
            </div>
         </div>
         <!--  ------------------제목--------------------  -->
         <div id='subject'>
            <span id='labeltitle'> <label>제목</label>
            </span> <span id='subcontent'>${obj.dname}</span>
         </div>
         <!--  ------------------내용--------------------  -->
         <div id='content'>
            <span id='labeltitle'> <label>내용</label>
            </span> <span id='concontent'>${obj.dcont}
            </span>
         </div>
         <!--  ------------------판매품의 타이틀--------------------  -->
         <br/>
         <div id='plist_header'>${obj.dcateName} 리스트</div>
         <!--  ------------------판매목록--------------------  -->
         <br/><br/>
         <div id='sale_list'>
            <div id='list_title'>
               <span id='code'>제품코드</span> 
               <span id='codeName'>제품명</span> 
               <span id='custom'>거래처</span> <span id='ea'>수량</span> 
               <span id='unit'>단가</span>
               <span id='total'>총액</span>
            </div>
            <div id='plist_content'>
               문서 종류마다 컬럼이 제각각이라 일단 보류..
            </div>
         </div>
      <br/><br/>
   <form name='frm1' method='post'>
   <div id=pdview_btn>
   <span id='purchase_dview_btn'>
   		<c:if test="${obj.dStatus==1 && obj.appTwo==obj.userid ||obj.dStatus==2 && obj.appOne==obj.userid}">
      <a href='#' id='plok' class='pibutton' onclick="approveFunc('${obj.dcode}')">승인</a>      
   		</c:if>
   </span>
   
   <span>
   <c:if test="${obj.dStatus==1 && obj.appTwo==obj.userid ||obj.dStatus==2 && obj.appOne==obj.userid}">
      <a href='#' id='plok' class='pibutton' onclick="denyFunc('${obj.dcode}')" >거절</a>      
      </c:if>
      
      <c:if test="${obj.dStatus==2 && obj.appTwo==obj.userid}">
      결재 대기중..
      </c:if>
       <c:if test="${obj.dStatus==0 || obj.dStatus==1 && obj.appOne==obj.userid}">
       결재가 완료된 상태 입니다.
       </c:if>
       <c:if test="${obj.dStatus==-1}">
       결재가 거절된 상태 입니다.
       </c:if>
   </span>
   </div>
   </form>

      </div>
   </div>
</body>
</html>