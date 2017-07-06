<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#purihead6 {
	text-align: center;
}
</style>
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
         <div class='pisign1'>아래와 같이 판매품의 합니다.</div>
         <div class='pisign2'>
            <div class='piappro'>결&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재</div> 
            <div class='piwriter'>작성자</div>
            <div class='piappro1'>결재자1</div>
            <div class='piappro2'>결재자2</div>
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
        <select id="purselect" title="제품명(코드)">
    <option selected>제품명(코드)</option>
    <option>바퀴(a001)</option>
    <option>바퀴(a002)</option>
    <option>바퀴(a003)</option>
    <option>안장(a004)</option>
    <option>안장(a005)</option>
    <option>핸들(a006)</option>
    <option>핸들(a007)</option>
    <option>라이트(a008)</option>
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


<div id='purihead5'>
    <span class='pcode'>20001</span>
    <span class='pmname'>바퀴</span>
    <span class='ppur'>abc</span>
    <span class='pemp'>황주희</span>
    <span class='pea'>입력값</span>
    <span class='pprice'>100</span>
    <span class='pamount'>1000000</span>
    
    </div>
    
    <div id='purihead6'>
        <a href='#' id='plok' class='pibutton'>작성완료</a>
        <a href='#' id='plcancle' class='pibutton'>작성취소</a>
    </div>
	
	<form name='frm_pinput' method='post'>
		<input type='hidden'>
	</form>
</body>
</html>