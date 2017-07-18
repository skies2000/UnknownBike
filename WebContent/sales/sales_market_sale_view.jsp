<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='../category/sales_market_sale_view.css' />
<title>Insert title here</title>
</head>
<body>
   <div id=category>
      <jsp:include page="../category/submenuSales.jsp"></jsp:include>
   </div>

   <div id='SalesResult'>
      <div id='body'>
         <!--  ------------------상단타이틀--------------------  -->
         <div id='title'>판매품의요청서</div>
         <!--  ------------------헤더--------------------  -->
         <div class='head'>
            <div id='sign1'>
               <label>문서번호</label><br /> <label>spl-${vo.dCode }</label>
            </div>
            <div id='sign2'>
               <div id='appro'>결&nbsp재&nbsp내&nbsp역</div>
               <div id='writer'>${writer.eName }</div>
               <div id='appro1'>${app1.eName }</div>
               <div id='appro2'>${app2.eName }</div>
               <div id='stamp1'>
                  <div id='status'>작성</div>
                  <div id='app_date'>${vo.dDate }</div>
               </div>
               <div id='stamp2'>
                  <div id='status'>${vo.msg1 }</div>
                  <div id='app_date'></div>
               </div>
               <div id='stamp3'>
                  <div id='status'>${vo.msg2 }</div>
                  <div id='app_date'></div>
               </div>
            </div>
         </div>
         <!--  ------------------제목--------------------  -->
         <div id='subject'>
            <span id='labeltitle'> <label>제목</label>
            </span> <span id='subcontent'>${vo.dName } </span>
         </div>
         <!--  ------------------내용--------------------  -->
         <div id='content'>
            <span id='labeltitle'> <label>내용</label>
            </span> <span id='concontent'> 
               ${vo.dCont }
            </span>
         </div>
         <!--  ------------------판매품의 타이틀--------------------  -->
         <div id='list_header'>판매 리스트</div>
         <!--  ------------------판매목록--------------------  -->
         <div id='sale_list'>
            <div id='list_title'>
               <span id='code'>제품코드</span> <span id='codeName'>제품명</span> <span
                  id='custom'>거래처</span> <span id='ea'>수량</span> <span id='unit'>단가</span>
               <span id='total'>총액</span> <span id='saledate'>판매일자</span>
            </div>
            <div id='list_content'>
            <c:forEach items="${list}" var="list">
               <span id='code'>${list.pCode }</span> 
               <span id='codeName'>${list.pName }</span> 
               <span id='custom'>${list.vName }</span> 
               <span id='ea'>${list.splpEa }</span> 
               <span id='unit'>${list.splCost }</span> 
               <span id='total'>${list.pPrice}</span> 
               <span id='saledate'>${list.splDate }</span> 
            </c:forEach>
            </div>
         </div>

      </div>
   </div>
</body>
</html>