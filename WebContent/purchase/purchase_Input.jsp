<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.Calendar"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script>

/* $(document).ready(function(){ */
	


function keyup(kk){
	
	
		var ea = $(kk).val();
		var price = $(kk).parent().next().children("input").val();
		
		var sum = ea*price;
		
		var amount=$(kk).parent().next().next();
		amount.html(sum);
		
	
	
}
//추가버튼 눌렀을 때 들어가는 내용.. 
function plus(){
	var xhr = new XMLHttpRequest();
	var url = '../purchase_req_input2.so';
	var frm = document.getElementById("pfrm");//hidden이 들어있는 form을 가져온다.
	//select값을 this로 가져옴
	var sel = document.getElementById("purselect");
	var cate = sel.options[sel.options.selectedIndex].value;
	
	var ea = document.getElementById("eatext").value;
	
	if(cate=='0'){
		alert("제품을 선택해주세요.");
		return;
	}
	if(ea=="" || ea<=0){
		alert("수량을 입력해주세요");
		return;
	}
	
	frm.mEa.value=ea;
	alert(frm.mEa.value);
	var purlist = cate.split(",");
	frm.mCode.value=purlist[1];
	
	
	
	//순서중요~!@~@~@먼저 넣어주기
	var formData = new FormData(frm);
	xhr.open('post',url);//(get방식/post방식,url);
	xhr.send(formData);//submit할떄는 formData를 넘겨준다. input태그들이 다 넘어간다 .so로
	
	xhr.onreadystatechange=function(){
		if(xhr.readyState == 4 && xhr.status == 200){//완료되면
			var txt = xhr.responseText;//화면에 출력되는 값을 가져올 수 있음. controller에서 void -> out.print;
			var jData = JSON.parse(txt);//txt가 문자열 그 자체니까..=> json타입으로 바꿔줌.
		
			
			var content = document.getElementById("content");
			var divpurihead5 = document.createElement("div");
			var spanpcode1 = document.createElement("span");
			var spanpcode2 = document.createElement("span");
			var spanpcode3 = document.createElement("span");
			var spanpcode4 = document.createElement("span");
			var spanpcode5 = document.createElement("span");
			var spanpcode6 = document.createElement("span");
			var spanpcode7 = document.createElement("span");
			var spanpcode8 = document.createElement("span");
			var input1 = document.createElement("input");
			var input2 = document.createElement("input");
			var a = document.createElement("a");
			
			divpurihead5.setAttribute("class","purihead5");
			divpurihead5.setAttribute("id","purihead5");
			spanpcode1.setAttribute("class","pcode");
			spanpcode2.setAttribute("class","pmname");
			spanpcode3.setAttribute("class","ppur");
			spanpcode4.setAttribute("class","pemp");
			spanpcode5.setAttribute("class","pea");
			spanpcode6.setAttribute("class","pprice");
			spanpcode7.setAttribute("class","pamount");
			/* spanpcode8.setAttribute("class","pdel"); */
			
			input1.setAttribute("type","number");
			input1.setAttribute("id","peatext");
			input1.setAttribute("name","peatext");
			input1.setAttribute("value",jData[0].mEa);
			input1.setAttribute("onkeyup","keyup(this)");
			
			input2.setAttribute("type","hidden");
			input2.setAttribute("id","pprice");
			input2.setAttribute("value",jData[0].mPrice);
			/* a.setAttribute("href","#");
			a.setAttribute("onclick","pdel()"); */
			
			
			spanpcode1.innerHTML=jData[0].mCode;
			frm.mCode.value = jData[0].mCode+",";//,를 넣어야 split으로 짤라서 담을수 있따.
			spanpcode2.innerHTML=jData[0].mName;
			frm.mName.value = jData[0].mName+",";
			spanpcode3.innerHTML=jData[0].mPo;
			frm.mPo.value=jData[0].mPo+",";
			spanpcode4.innerHTML=jData[0].user;
			
			spanpcode5.appendChild(input1);
			spanpcode6.appendChild(input2);//span태그안에 input1이 붙는다.
			spanpcode6.innerHTML+=jData[0].mPrice;
			frm.mPrice.value=jData[0].mPrice+",";
			spanpcode7.innerHTML=jData[0].mEa*jData[0].mPrice;
			
			
			
			divpurihead5.appendChild(spanpcode1);
			divpurihead5.appendChild(spanpcode2);
			divpurihead5.appendChild(spanpcode3);
			divpurihead5.appendChild(spanpcode4);
			divpurihead5.appendChild(spanpcode5);
			divpurihead5.appendChild(spanpcode6);
			divpurihead5.appendChild(spanpcode7);
			
			content.appendChild(divpurihead5);
			
			
		}
			
	}
	
	alert(cate);
	
	
	
	
	/* <div id='content'>
	<c:forEach items="${list}" var="vo"> 
	<div class='purihead5' id='purihead5'>
	    <span class='pcode'>${vo.mCode}</span>
	    <span class='pmname'>${vo.mName}</span>
	    <span class='ppur'>${vo.mPo}</span>
	    <span class='pemp'>${user}</span><!-- dWriter로..바꿔야됨 -->
	    <span class='pea'><input type='number' id='peatext' name='peatext'></span>
	    <span class='pprice'><input type='hidden' id='pprice' value='${vo.mPrice}'>${vo.mPrice}</span>
	    <span class='pamount'></span><a href='#' onclick='pdel(count)'>[X]</a></span>
	  
	    </div>
	    
	    </c:forEach>
	    </div> */
	    
	    
	    
	    
	//hidden에 저장
	/* frm.pCate.value=cate;
	
	
	//순서중요~!@~@~@먼저 넣어주기
	var formData = new FormData(frm);
	
	xhr.open("post",url);
	xhr.send(formData);
	
	xhr.onreadystatechange=function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var txt = xhr.responseText;
			var jData = JSON.parse(txt);
			
			var str = "";
			var sel2 = document.getElementById("abc");
			for(i=sel2.length; i>=1; i--){
				sel2.options[i]=null;
			  }
			for(var i=0; i<jData.length;i++){
				var op = document.createElement("option");
				op.text=jData[i].pName;
				op.value=jData[i].pName;
				sel2.options.add(op);
			}
		}
	} */
} 
	

	function amount(){
		var Ea = document.getElementById('peatext').value;
		var price = document.getElementById('pprice').value;
		var amount = Ea*price;
	}
	
	//작성완료
	function plok(mCode){
		var xhr = new XMLHttpRequest();
		if(!confirm("등록하시겠습니까?")) return;
	
		var frm = document.pfrm;
		var url = 'purRList.so';
		var mcode = $('.pcode').text();//그냥 넘기는게 아니라 값이 hidden에 들어가있어야함.. .. 
		var mname = $('.pmname').text();
		var mpur = $('.ppur').text();
		var mea = $('.pea').text();
		var mprice = $('.pprice').text();
	
		
		
		
		var fd = new FormData(frm);
		xhr.open("POST",url);
		xhr.send(fd);
		
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var txt = xhr.responseText;
				if(txt=="1"){
					alert("정상적으로 등록됐습니다.");
				
				}
			}	
		 }
	}
		
	//작성취소
	function plcancle(){
	var frm = document.pfrm2;
	frm.action = 'purhome.so';
	frm.submit();
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

<form name='pfrm' id='pfrm' method='post'>

				<input type='hidden' name='mCode'>
				<input type='hidden' name='mName'>
				<input type='hidden' name='mPo'>
				<input type='hidden' name='mEa'>
				<input type='hidden' name='mPrice'>
				<input type='hidden' name='count' value='0'>
				
				<input type='hidden' name='input_writer' id='input_writer'>
				
		 <input type='hidden' name='h_piappro1' id='h_piappro1'> <!-- 결재자1 사원번호 -->
		 <input type='hidden' name='h_piappro2' id='h_piappro2'> <!-- 결재자2 사원번호 -->
		 <input type='hidden' name='input_pur' id='input_pur' value='pur'>
		 <input type='hidden' name='input_date' id='input_date' value='${today }'>
 
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
               <div class='pihead32'>pur</div>
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
      </div>
      <div class='pisign'>
         <div class='pisign1'>제목
         <input type='text' id='pisign1-1' name='pising1-1'>
         </div>
         <div class='pisign2'>
            <div class='piappro'>결&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;재</div> 
            <div class='piwriter'>작성자</div>
            <div class='piappro1' id='piappro1' onclick = 'sign_popup1()'><a href='#'>결재자1</a></div>
            <div class='piappro2' id='piappro2' onclick = 'sign_popup2()'><a href='#'>결재자2</a></div>
            <div class='pistamp1'></div>
            <div class='pistamp2'></div>
            <div class='pistamp3'></div>
            <div class='pidate1'>${today }</div>
            <div class='pidate2'></div>
            <div class='pidate3'></div>
         </div>
      </div>

    <div id='purihead3'>
    	<label for="purselect">제품명(코드)</label>
    <select id="purselect">
    <option selected value=0>제품명(코드)  </option>
<c:forEach items="${list1}" var="obj"> 
    <option value='${obj.mName},${obj.mCode}'>${obj.mName}(${obj.mCode})</option>
</c:forEach>
</select>

        <label>수량&nbsp;&nbsp;&nbsp;</label>
        <input type='text' name='eatext' id='eatext'>
        <a href='#' class='pibutton' id='pibutton' name='pibutton' onclick="plus()">추가</a>
    </div>
    
    	
    		    
    		    
    
</form>



<form name='pfrm2' method='post'>
<div id='purihead4'><span class='pcode'>자재코드</span><span class='pmname'>자재명</span><span class='ppur'>거래처</span><span class='pemp'>구매담당자</span><span class='pea'>수량</span><span class='pprice'>단가</span><span class='pamount'>총액</span><!-- <span class='pdel' style='color: black'>[X]</span> -->
    
</div>


<div id='content'>
<c:forEach items="${list}" var="vo"> 
<div class='purihead5' id='purihead5'><span class='pcode'>${vo.mCode}</span><span class='pmname'>${vo.mName}</span><span class='ppur'>${vo.mPo}</span><span class='pemp'>${user}</span><span class='pea'><input type='number' id='peatext' name='peatext' onkeyup='keyup(this)'></span><span class='pprice'><input type='hidden' id='pprice' value='${vo.mPrice}'>${vo.mPrice}</span><span class='pamount'></span><!--<span class='pdel'> <a href='#' onclick='pdel(count)'>[X]</a></span> -->
</div>
    
    </c:forEach>
    </div>
    
    
    
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