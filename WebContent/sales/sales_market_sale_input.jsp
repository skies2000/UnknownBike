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

//삭제 버튼
	function list_del(count){
		var content = document.getElementById("sey_sl_content");
		var pro_list = document.getElementById("pro_list_"+count);
		content.removeChild(pro_list);
	}

function pro_add(){
	var xhr = new XMLHttpRequest();
	var url = 'sales_sale_input_add.sung';
	
	var frm  = document.getElementById('frmId');
	var pCate = frm.pro_Cate.value;
	var pCode = frm.abc.value;
	var pCodeName = $("#abc option:selected").text();
	var vender = frm.sel_vender.value;
	var vName =  $("#sel_vender option:selected").text();
	var pEa = frm.sey_input_ea.value;
	
	//히든에 저장
	frm.add_pCode.value=pCode;
	frm.add_pName.value=pCodeName;
	frm.add_vCode.value=vender;
	frm.add_vName.value=vName;
	frm.add_pEa.value=pEa;
	
	var formData = new FormData(frm);
	xhr.open("post",url);
	xhr.send(formData);  
	
	xhr.onreadystatechange=function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			 var txt = xhr.responseText;
			var text = JSON.parse(txt);
			
			for(var i=0; i<text.length; i++) {
				count ++;
				var content = document.getElementById("sey_sl_content");
				var str = "";
				
				str += "<span class='list_pCode' id='list_pCode'>"+text[i].pCode+"</span>";
					frm.pCode.value += text[i].pCode +",";
				str += "<span class='list_pName' id='list_pName'>"+text[i].pName+"</span>";
				str += "<span class='list_vName' id='list_vName'>"+text[i].vName+"</span>";
					frm.vCode.value += text[i].vCode +",";
				str += "<span class='list_pEa' id='list_pEa'>"+text[i].pEa+"</span>";
					frm.pEa.value += text[i].pEa +",";
				str += "<span class='list_pCost' id='list_pCost'>"+text[i].pPrice+"</span>";
					frm.pPrice.value += text[i].pPrice +",";
				str += "<span class='list_pPrice' id='list_pPrice'>"+text[i].pTotal+"</span>";
					frm.pTotal.value += text[i].pTotal +",";
				str += "<span class='deadline2' id='deadline2'><input name ='calender' id='calender' type='date'> </span>";
				str += "<span id='sey_del' onclick='list_del("+count+")'>삭제</span>";
				
				var pro_list = document.createElement("div");
				pro_list.id = "pro_list_"+count;
				pro_list.innerHTML = str;
				content.appendChild(pro_list);
				
			}
			frm.count.value=count;  
		}
	}
}


//결재자1
	function sign_popup1(){
		var url = 'sign_popup.sung';
		var popOption = "width=440, height=500,top=0, resizable=no, scrollbars=no, status=no";
		window.open(url,"",popOption);
	}
	
//결재자 2
	function sign_popup2(){
		var url = 'sign_popup_2.sung';
		var popOption = "width=440, height=500,top=0, resizable=no, scrollbars=no, status=no";
		window.open(url,"",popOption);
	}	


//작성완료 버튼
function pro_subject(){
	var xhr = new XMLHttpRequest();
	var url = 'sales_req_input_save.sung';
	var frm = document.getElementById("frmId");
	
	var dateValue ="";
	 $('input[name=calender]').each(function(idx){
		 dateValue += $(this).val();
		 dateValue += ",";
	   })
	 frm.sDate.value = dateValue;
	 
	 var formData = new FormData(frm);
		xhr.open("post",url);
		xhr.send(formData);  
		

	 
	  xhr.onreadystatechange=function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				alert("정상적으로 작성되었습니다.");
				window.location.reload();
				}
			} 
	 
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
					<div id='sey_writer'>${eList.eName }</div>
					<div id='appro1' onclick = sign_popup1()>결재자1</div>
					<div id='appro2' onclick = sign_popup2()>결재자2</div>
					<div id='sey_stamp1'></div>
					<div id='sey_stamp2'></div>
					<div id='sey_stamp3'></div>
					<div id='sey_date1'>${today }</div>
					<div id='sey_date2'></div>
					<div id='sey_date3'></div>
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
				<input type='hidden' name='add_pName'>
				<input type='hidden' name='add_vCode'>
				<input type='hidden' name='add_vName'>
				<input type='hidden' name='add_pEa'>
				<input type='hidden' name='add_pCode'>
				
				<input type='hidden' name='pCate'>
				<input type='hidden' name='pCode'>  <!-- 제품코드 -->
				<input type='hidden' name='pName'>  <!-- 제품네임 -->
				<input type='hidden' name='vName'>  <!-- 거래처이름 -->
				<input type='hidden' name='vCode'>  <!-- 거래처코드 -->
				<input type='hidden' name='pEa'>    <!-- 제품수량 -->
				<input type='hidden' name='sDate'>  <!-- 판매일자 -->
				<input type='hidden' name='pTotal'> <!-- 총액 -->
				<input type='hidden' name='pPrice'> <!-- 판매단가 -->
				<input type='hidden' name='writer' value='${eList.eCode }'> <!-- 작성자 -->
				<input type='hidden' name='dDate' value='${today }'>  <!-- 작성일 -->
				<input type='hidden' name='count' id='count'>
				<!-- 결재자1 사원번호 -->
				<input type='hidden' name='appr_eCode1' id='appr_eCode1'> 
				<!-- 결재자2 사원번호 -->
				<input type='hidden' name='appr_eCode2' id='appr_eCode2'> 
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
				</div>


			</div>

		</div>
		<div id='sey_sendBtn'>
			<input type='button' value='작성완료' id='sey_sl_btnSend' onclick='pro_subject()'>
		</div>
		</div>
	</form>
</body>
</html>