<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../category/sales_market_sale_input.css' />

<style>
#aaa{
	border-bottom : 1px solid white;
	height : 50px;
	width : 100%;
}

</style>

<script>
var count = 0;
function cate_func(sel){
	var xhr = new XMLHttpRequest();
	var url = 'sales_sale_input2.sung';
	var frm = document.getElementById("frmId");
	//select값을 this로 가져옴
	var cate = sel.options[sel.options.selectedIndex].value;
	//hidden에 저장
	frm.pCate.value=cate;
	//순서중요~!@~@~@먼저 넣어주기
	var formData = new FormData(frm);
			
	xhr.open("post",url);
	xhr.send(formData);
	
	xhr.onreadystatechange=function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var txt = xhr.responseText;
			var jData = JSON.parse(txt);
			
			var sel2 = document.getElementById("abc");
			for(i=sel2.length; i>=1; i--){
				sel2.options[i]=null;
			  }
			for(var i=0; i<jData.length;i++){
				var op = document.createElement("option");
				op.text=jData[i].pName;
				op.value=jData[i].pCode;
				sel2.options.add(op);
			}
		}
	}
}

function pro_add(){
	var frm  = document.getElementById('frmId');
	var pCate = frm.pro_Cate.value;
	var pCode = frm.abc.value;
	var pCodeName = $("#abc option:selected").text();
	var vender = frm.sel_vender.value;
	var pEa = frm.sey_input_ea.value;
	/* -----------여기까지 다넘어옴~!@~!@ */
	
}


</script>


</head>
<body>
<%
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
		String today = year + "-" + monthstr + "-" + daystr;
		request.setAttribute("today", today);
		String userID = (String)session.getAttribute("user");
		
	%>
	<div id=category>
		<jsp:include page="../category/submenuSales.jsp"></jsp:include>
	</div>
	
	<form name='frm' method='post' id='frmId' enctype= "multipart/form-data">
	<div id='sey_SalesResult'>

		<div id='sey_body'>
			<div id='sey_head'>
				<div id='sey_head1'></div>
				<div id='sey_head2'>판매 품의서</div>
				<div id='sey_head3'>
					<div id='sey_head3-1'>
						<div id='sey_head31'>문서분류</div>
						<div id='sey_head32'>spl</div>
					</div>
					<div id='sey_head3-2'>
						<div id='sey_head31'>작성자</div>
						<div id='sey_head32'>${eList.eName }</div>
					</div>
					<div id='sey_head3-3'>
						<div id='sey_head31'>날짜</div>
						<div id='sey_head32'>${today }</div>
					</div>
				</div>
			</div>
			<div id='sey_sign'>
				<div id='sey_sign1'>아래와 같이 판매품의 합니다.</div>
				<div id='sey_sign2'>
					<div id='sey_appro'>결&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp재</div>
					<div id='sey_writer'>작성자</div>
					<div id='sey_appro1' onclick = sign_popup1()>결재자1</div>
					<div id='sey_appro2' onclick = sign_popup2()>결재자2</div>
					<div id='sey_stamp1'></div>
					<div id='sey_stamp2'></div>
					<div id='sey_stamp3'></div>
					<div id='sey_date1'>${today }</div>
					<div id='sey_date2'>2017.06.27</div>
					<div id='sey_date3'>2017.06.27</div>
				</div>
			</div>
			<div id='sey_classify'>
				<div id='sey_sel1'>
					<select id='pro_Cate' name='pro_Cate' onchange="cate_func(this)">
						<option selected>- 카테고리 -</option>
						<option value = '1'>외발자전거</option>	
						<option value = '2'>두발자전거</option>	
						<option value = '3'>세발자전거</option>	
						<option value = '4'>네발자전거</option>	
						<option value = '5'>하이브리드자전거</option>			
					</select>
				</div>
				<div id='sey_sel2'>
					<select id='abc' name='abc'>
						<option selected>- Code -</option>
						
					</select>
				</div>
				<div id='sey_sel3' name='sey_sel3'>
					<select id='sel_vender' name='sel_vender'>
						<option selected>- 거래처 -</option>
						<c:forEach items="${list }" var="list">
						<option value='${list.vCode }'>${list.vName }</option>
						</c:forEach>
						
					</select>
				</div>	
				<div id='ea_div'>
					<input type='text' name = 'sey_input_ea' id='sey_input_ea' placeholder="수량 입력">
				</div>

				<div id='sey_add'>
					<input type='button' value='추가' id='sey_sl_btnInput' name='sey_sl_btnInput' onclick='pro_add()'>
				</div>
				</div>
				
				<input type='hidden' name='pCate'>
				
			</form>
			<div class='aa'></div>
			
			<div id='sey_subject'>
				<span id='sey_code'>제품코드</span>
				<span id='sey_codeName'>제품명</span> 
				<span id='sey_custom'>거래처</span>
				<span id='sey_ea'>수량</span>
				<span id='sey_unit'>단가</span>
				<span id='sey_total'>총액</span> 
				<span id='sey_saledate'>판매일자</span>
			</div>
			<div id='sey_sl_content'>
				<div class='sey_content_list'>
				</div>


			</div>

		</div>
		<div id='sey_sendBtn'>
			<input type='button' value='작성완료' id='sey_sl_btnSend'>
		</div>

	</div>
</body>
</html>