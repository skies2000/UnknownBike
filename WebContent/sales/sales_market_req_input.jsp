<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Calendar"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../category/sales_market_req_input.css' />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.5.0/jquery.min.js"></script>

<script>
var count = 0;
function cate_func(sel){
		var xhr = new XMLHttpRequest();
		var url = 'sales_req_input2.sung';
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
		var pName = frm.abc.value;
		var pEa = frm.sey_input_ea.value;
		//select박스의 text값 가져오기
		var pCode = $("#pro_Cate option:selected").text();
		frm.codeName.value=pCode;
		frm.pName.value = pName;
		frm.pEa.value=pEa;
		
		var xhr = new XMLHttpRequest();
		var url = 'salse_req_input_add.sung';
		var formData = new FormData(frm);
		xhr.open("post",url,true);
		xhr.send(formData);
		
		xhr.onreadystatechange=function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var hidden_frm  = document.getElementById('pro_content');
				var txt = xhr.responseText;
				var text = JSON.parse(txt);
				
				for(var i=0; i<text.length; i++) {
					count ++;
					var content = document.getElementById("content");
					var str = "";
					str += "<span class='code2' id='code2'>"+text[i].pCate+"</span>";
					str += "<span class='codeName2' id='codeName2'>"+text[i].pName+"</span>";
					hidden_frm.list_code.value += text[i].pName +",";
					str += "<span class='ea2' id='ea2'>"+text[i].pEa+"</span>";
					hidden_frm.list_ea.value += text[i].pEa +",";
					str += "<span class='deadline2' id='deadline2'><input name ='calender' id='calender' type='date'> </span>";
					str += "<span id='del' onclick='list_del("+count+")'>삭제</span>";
					
					var pro_list = document.createElement("div");
					pro_list.id = "pro_list_"+count;
					pro_list.innerHTML = str;
					content.appendChild(pro_list);
					
				}   
					 frm.count.value=count; 
				
			}
		}
		
	}
	
	function list_del(count){
		var content = document.getElementById("content");
		var pro_list = document.getElementById("pro_list_"+count);
		content.removeChild(pro_list);
	}
	
	//작성완료 버튼
	function pro_subject(){
		var xhr = new XMLHttpRequest();
		var url = 'sales_req_input3.sung';
		var frm = document.getElementById("pro_content");
		
		var cate = $('.code2').text();
		var code = $('.codeName2').text();
		var ea = $('.ea2').text();
		var value ="";
		 $('input[name=calender]').each(function(idx){
		      value += $(this).val();
		      value += ",";
		   })
		
		
		//hidden에 저장하기
		frm.list_term.value = value;
		
		var formData = new FormData(frm);
		xhr.open("post",url);
		xhr.send(formData);  
		
		xhr.onreadystatechange=function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				alert("정산적으로 작성되었습니다.");
				window.location.reload();
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
	<div id='SalesResult'>
		<div id='body'>
			<div id='head'>
				<div id='head1'></div>
				<div id='head2'>생산 요청서</div>
				<div id='head3'>
					<div id='head3-1'>
						<div id='head31'>문서분류</div>
						<div id='head32'>
						srl
						</div>
					</div>
					<div id='head3-2'>
						<div id='head31'>작성자</div>
						<div id='head32'>${eList.eName }</div>
					</div>
					<div id='head3-3'>
						<div id='head31'>날짜</div>
						<div id='head32'>
							${today }
						</div>
					</div>
				</div>
			</div>
			<div id='sign'>
				<div id='sign1'>아래와 같이 생산을 요청 합니다.</div>
				<div id='sign2'>
					<div id='appro'>결&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp재</div>
					<div id='writer'>${eList.eName }</div>
					<div id='appro1' onclick = sign_popup1()>결재자1</div>
					<div id='appro2' onclick = sign_popup2()>결재자2</div>
					<div id='stamp1'></div>
					<div id='stamp2'></div>
					<div id='stamp3'></div>
					<div id='date1'>${today }</div>
					<div id='date2'></div>
					<div id='date3'></div>
				</div>
			</div>
			
			<div id='classify'>
			
			
				<div id='sel1'>
					<select id='pro_Cate' name='pro_Cate' onchange="cate_func(this)">
						<option selected>- 카테고리 -</option>
						<option value = '1'>외발자전거</option>	
						<option value = '2'>두발자전거</option>	
						<option value = '3'>세발자전거</option>	
						<option value = '4'>네발자전거</option>	
						<option value = '5'>하이브리드자전거</option>				
					</select>
				</div>
				
					<div id='sel2'>
						<select id='abc' name='abc'>
							 <option selected>- Code -</option> 
						</select>
					</div>
				
					<div id='sey_ea'>
						<input type='text' name = 'sey_input_ea' id='sey_input_ea' placeholder="수량 입력">
					</div>
	
					<div id='add'>
						<input type='button' value='추가' name = 'sl_btnInput' id='sl_btnInput' onclick='pro_add()'>
					</div>
				<input type='hidden' name='pCate'>
				<input type='hidden' name='codeName'>
				<input type='hidden' name='pName'>
				<input type='hidden' name='pEa'>
				<input type='hidden' name='count' value='0'>
				</form>
			</div>
			<div class='aa'></div>
			<div id='subject'>
				<div id='code'>카테고리</div>
				<div id='codeName'>제품코드</div>
				<div id='ea'>수량</div> 
				<div id='deadline'>생산기한</div>
			</div>
		<form name='pro_content' id = 'pro_content' method='post' enctype= "multipart/form-data">
			<div id='content'></div>
			
			
			
			<!-- db에 넣어줄 hidden들 -->
			<input type='hidden' name='list_cate'><!-- ok -->
			<input type='hidden' name='list_code'><!-- ok -->
			<input type='hidden' name='list_ea'><!-- ok -->
			<input type='hidden' name='list_term'><!-- ok -->
			<input type='hidden' name='input_srl' id='input_srl' value='srl'> <!-- ok -->
			<input type='hidden' name='input_date' id='input_date' value='${today }'>
			<input type='hidden' name='input_writer' id='input_writer' value='${eList.eName }'>
			
			<!-- 결재자1 사원번호 -->
			<input type='hidden' name='appr_eCode1' id='appr_eCode1'> 
			<!-- 결재자2 사원번호 -->
			<input type='hidden' name='appr_eCode2' id='appr_eCode2'> 
			
			<div id='sendBtn'>
				<input type='button' value='작성완료' id='sl_btnSend' onclick='pro_subject()'>
			</div>
		</form>
	</div>
</div>
</body>
</html>