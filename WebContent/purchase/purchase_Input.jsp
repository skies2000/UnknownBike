<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Calendar"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>
	function amount(){
		var pEa = document.getElementById('peatext').value;
	
	}
	
	function plok(mCode){
		var frm = document.pfrm;
		frm.action = 'purRList.so';
		frm.mCode.value = mCode;
		frm.submit();
		
	}
	
	function plcancle(){
		
		
	}
	
	function sign_popup1(){
		var url = 'sign_popup.so';
		var popOption = "width=500, height=500,top=0, resizable=no, scrollbars=no, status=no";
		window.open(url,"",popOption);
	}
	function sign_popup2(){
		var url = 'sign_popup_2.so';
		var popOption = "width=500, height=500,top=0, resizable=no, scrollbars=no, status=no";
		window.open(url,"",popOption);
	}	
	
</script>
</head>
<body>
<%

String user = (String)session.getAttribute("user");
Calendar cal = Calendar.getInstance(); // 현재 날짜/시간 등의 각종 정보 얻기

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;
int day = cal.get(Calendar.DAY_OF_MONTH);

String monthstr = "";

if (month < 10) {
   monthstr = "0" + month;
} else {
   monthstr = String.valueOf(month);
}

String daystr = "";
if (day < 10) {
   daystr = "0" + day;
} else {
   daystr = String.valueOf(day);
}
String today = year+"."+ monthstr+"."+ daystr;
request.setAttribute("today", today);

%>
<form name='pfrm' method='post'>
 
<div id=category>
		<jsp:include page="../category/submenuPurchase.jsp"></jsp:include>
	</div>


	<div id='purchaseResult'>
	
	</div>
	
	 <div class='pibody'>
      <div class='pihead'>
         <div class='pihead1'></div>
         <div class='pihead2'>구매보고서</div>
         
         <div class='pihead3'>
            <div class='pihead3-1'>
               <div class='pihead31'>문서번호</div>
               <div class='pihead32'></div>
            </div> 
            <div class='pihead3-2'>
               <div class='pihead31'>작성자</div>
               <div class='pihead32'>${user }</div>
            </div>
            <div class='pihead3-3'>
               <div class='pihead31'>날짜</div>
               <div class='pihead32'>${today }</div>
            </div>
         </div>
      </div>
      <div class='pisign'>
         <div class='pisign1'>제목
         <input type='text' id='pisign1-1'>
         </div>
         <div class='pisign2'>
            <div class='piappro'>결&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재</div> 
            <div class='piwriter'>작성자</div>
            <div class='piappro1' id='piappro1' onclick = sign_popup1()>결재자1</div>
            <div class='piappro2' id='piappro2' onclick = sign_popup2()>결재자2</div>
            <div class='pistamp1'></div>
            <div class='pistamp2'></div>
            <div class='pistamp3'></div>
            <div class='pidate1'>${today }</div>
            <div class='pidate2'>2017.06.27</div>
            <div class='pidate3'>2017.06.27</div>
         </div>
      </div>

    <div id='purihead3'>
    	<label for="purselect">제품명(코드)</label>
    <select id="purselect">
    <option selected>제품명(코드)  </option>
<c:forEach items="${list1}" var="obj"> 
    <option>${obj.mName}(${obj.mCode})</option>
</c:forEach>
</select>

        <label>수량&nbsp;&nbsp;&nbsp;</label><input type='text'>
        <a href='#' class='pibutton' onclick="plus()">추가</a>
    </div>

<div id='purihead4'>
    <span class='pcode'>자재코드</span>
    <span class='pmname'>자재명</span>
    <span class='ppur'>거래처</span>
    <span class='pemp'>구매담당자</span>
    <span class='pea'>수량</span>
    <span class='pprice'>단가</span>
    <span class='pamount'>총액</span>
    
</div>


<c:forEach items="${list}" var="vo"> 
<div id='purihead5'>
    <span class='pcode'>${vo.mCode}</span>
    <span class='pmname'>${vo.mName}</span>
    <span class='ppur'>${vo.mPo}</span>
    <span class='pemp'>${user}</span><!-- dWriter로..바꿔야됨 -->
    <span class='pea'><input type='text' id='peatext' name='peatext'></span>
    <span class='pprice'>${vo.mPrice}</span>
    <span class='pamount' onkeyup='amount()'></span>
    <!-- onkeyup=''${peatext.value*vo.mPrice}   -->
    </div>
    </c:forEach>
    <div id='purihead6'>
        <a href='#' id='plok' class='pibutton' onclick='plok()'>작성완료</a>
        <a href='#' id='plcancle' class='pibutton' onclick='plcancle()'>작성취소</a>
		
		
		
	<input type='hidden' name='mCode' value="${vo.mCode }"/>
	
<!-- hidden들 -->

		<input type='hidden' name='input_writer' id='input_writer'>
		<input type='hidden' name='h_piappro1' id='h_piappro1'> <!-- 결재자1 사원번호 -->
		<input type='hidden' name='h_piappro2' id='h_piappro2'> <!-- 결재자2 사원번호 -->
		<input type='hidden' name='input_term' id='input_term'>
		<input type='hidden' name='input_date' id='input_date'>
  
    </div>
	</form>
	</body>
</html>