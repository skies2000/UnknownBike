<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='../category/sales_market_req_view.css' />
<title>Insert title here</title>
</head>
<body>

   <div id=category>
      <jsp:include page="../category/submenuSales.jsp"></jsp:include>
   </div>

   <div id='SalesResult'>
      <div id='body'>
         <!--  ------------------상단타이틀--------------------  -->
         <div id='title'>생산 요청서</div>
         <!--  ------------------헤더--------------------  -->
         <div class='head'>
            <div id='sign1'>
               <label>문서번호</label><br /> <label> ${vo.dCate }-${vo.dCode } </label>
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
            </span> <span id='subcontent'> ${vo.dName }</div>
               </div> </span>
         </div>
         <!--  ------------------내용--------------------  -->
         <div id='content'>
            <span id='labeltitle'> <label>내용</label>
            </span> <span id='concontent'> 
               ${vo.dCont }
            </span>
         </div>
         <!--  ------------------생산요청목록 타이틀--------------------  -->
         <div id='list_header'>요청 제품 리스트</div>
         <!--  ------------------생산요청목록--------------------  -->
         <div id='sale_list'>
            <div id='list_title'>
               <div id='code'>제품코드</div>
               <div id='codename'>제품명</div>
               <div id='ea'>수량</div>
               <div id='deadline'>생산기한</div>
            </div>
            <div id='list_content'>
            <c:forEach items="${list}" var="list">
               <span id='code'>${list.srlMcode }</span> 
               <span id='codename'>${list.pName }</span> 
               <span id='ea'>${list.srlEa }</span> 
               <span id='deadline'>${list.srlTerm }</span> 
            </c:forEach>
            </div>
         </div>

      </div>
   </div>
</body>
</html>