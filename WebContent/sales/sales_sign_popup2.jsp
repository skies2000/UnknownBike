<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel='stylesheet' href='../category/sales_sign_popup.css' />

<script>
function cate_func(sel){
	
	var xhr = new XMLHttpRequest();
	var url = 'sign_popup2.sung';
	var frm = document.getElementById("frm");
	//select���� this�� ������
	var cate = sel.options[sel.options.selectedIndex].value;
	
	//hidden�� ����
	frm.em_cate.value=cate;
	
	
	//�����߿�~!@~@~@���� �־��ֱ�
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
				op.text=jData[i].eName;
				op.value=jData[i].eCode;
				sel2.options.add(op);
			}
		}
	}
}

function cate_func2(sel){
	var xhr = new XMLHttpRequest();
	var url = 'sign_popup3.sung';
	var frm = document.getElementById("frm");
	//select���� this�� ������
	var code = sel.options[sel.options.selectedIndex].value;
	
	//hidden�� ����
	frm.eCode.value=code;
	
	//�����߿�~!@~@~@���� �־��ֱ�
	var formData = new FormData(frm);
	
	xhr.open("post",url);
	xhr.send(formData);
	
	xhr.onreadystatechange=function(){
		 if(xhr.readyState == 4 && xhr.status == 200){
			var txt = xhr.responseText;
			var jData = JSON.parse(txt);
			
			var str = "";
			var ePosition = jData[0].ePosition;
	         var eDepart = jData[0].eDepart;
	         
	         if(ePosition==1) ePosition="���";
	         if(ePosition==2) ePosition="����";
	         if(ePosition==3) ePosition="����";
	      
	         if(eDepart==1) eDepart="������";
	         if(eDepart==2) eDepart="������";
	         if(eDepart==3) eDepart="������";
	         if(eDepart==4) eDepart="������";
	         if(eDepart==5) eDepart="����";
	         
	         str += "<div class='eName' id='eName'>����� : " + jData[0].eName + "</div>";
	         str += "<div class='eCode' id='eCode'>����ڵ� : " + jData[0].eCode + "</div>";
	         str += "<div class='eDepart' id='eDepart'>�μ��� :  " + eDepart + "</div>";
	         str += "<div class='ePosition' id='ePosition'>���� : " + ePosition + " </div>";
			var divAdd = document.createElement("div");
			divAdd.innerHTML = str;
			content.appendChild(divAdd);
			
			frm.eName.value = jData[0].eName;
			frm.eCode.value = jData[0].eCode;
			frm.eDepart.value = jData[0].eDepart;
			frm.ePosition.value = jData[0].ePosition;
		
		} 
	}
}

function Sendfunc(){
	var frm = document.getElementById("frm");
	window.opener.document.getElementById("appro2").innerHTML = frm.eName.value;
	window.opener.document.getElementById("appr_eCode2").value = frm.eCode.value;
	self.close();
}

</script>	
	
	
</head>
<body>
<form name='frm'  method='post' id='frm' enctype= "multipart/form-data">
	<div id='head'>��� ã��</div>
	<div class='select'>
	<div id='sel1'>
		<select id='em_cate' name='em_cate' onchange="cate_func(this)">
			<option selected>- ���� -</option>
			<option value = '3'>����</option>	
			<option value = '2'>����</option>	
			<option value = '1'>���</option>	
		</select>
	</div>
	<div id='sel2'>
		<select id='abc' name='abc' onchange="cate_func2(this)">
			 <option selected>- ����� -</option> 
		</select>
	</div>
	</div>
	
	<div id='content'>
		
	</div>
	<div id='button'>
		<input type='button' value="Ȯ��" id='btnSend' onclick='Sendfunc()'>
	</div>
	
	<input type='hidden'  id='em_cate'>
	<input type='hidden' name='eName' id='eName'>
	<input type='hidden' name='eCode' id='eCode'>
	<input type='hidden' name='eDepart' id='eDepart'>
	<input type='hidden' name='ePosition' id='ePosition'>
</form>
</body>
</html>