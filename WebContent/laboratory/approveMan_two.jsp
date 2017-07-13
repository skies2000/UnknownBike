<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>Page Title</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0">
		<style>
		
		.myButton {
            -moz-box-shadow: inset 0px 1px 0px 0px #000000;
            -webkit-box-shadow: inset 0px 1px 0px 0px #000000;
            box-shadow: inset 0px 1px 0px 0px #000000;
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #000000));
            background: -moz-linear-gradient(top, #000000 5%, #000000 100%);
            background: -webkit-linear-gradient(top, #000000 5%, #000000 100%);
            background: -o-linear-gradient(top, #000000 5%, #000000 100%);
            background: -ms-linear-gradient(top, #000000 5%, #000000 100%);
            background: linear-gradient(to bottom, #000000 5%, #000000 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000', endColorstr='#000000', GradientType=0);
            background-color: #000000;
            -moz-border-radius: 6px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
            border: 1px solid #000000;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 15px;
            font-weight: bold;
            padding: 6px 24px;
            text-decoration: none;
            text-shadow: 0px 1px 0px #000000;
        }
        
        .myButton:hover {
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #000000), color-stop(1, #000000));
            background: -moz-linear-gradient(top, #000000 5%, #000000 100%);
            background: -webkit-linear-gradient(top, #000000 5%, #000000 100%);
            background: -o-linear-gradient(top, #000000 5%, #000000 100%);
            background: -ms-linear-gradient(top, #000000 5%, #000000 100%);
            background: linear-gradient(to bottom, #000000 5%, #000000 100%);
            filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000', endColorstr='#000000', GradientType=0);
            background-color: #000000;
        }
        
        .myButton:active {
            position: relative;
            top: 1px;
            
       
        }
        
        #apmtResult .imgHoverSize:HOVER {
			display: inline-block;
			width: 100px;
		}
		#apmtResult .memMberListLabel:HOVER{
			cursor: pointer;
		}
		
		#apmtResult *{
			transition: all 0.5s;
		}
		#apBtnPosition{
			float:left;
			position: fixed;
			margin-left: 220px;
		}
		#fieldWidth{
			width: 200px;
		}
		</style>
		<script>
	var jt;
	var xhr = new XMLHttpRequest();
	xhr.open('get','../appTwo.hwan');
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var txt = xhr.responseText;
			jt = JSON.parse(txt);
			var re = document.getElementById("apmtResult");
			
			for(var i = 0 ; i< jt.length; i++){
				var div1 =  document.createElement("div");
				var check = document.createElement("input");
				var la = document.createElement("label");
				var img = document.createElement("img");
				
				img.setAttribute("src", "../images/"+jt[i].eimage);
				img.setAttribute("width", "40px");
				img.setAttribute("class", "imgHoverSize")
				
				check.setAttribute("type", "checkbox");
				check.setAttribute("value",jt[i].ecode);
				check.setAttribute("class","memberCk");
				la.appendChild(check);
				la.appendChild(img);
				la.innerHTML+=jt[i].ename;
				la.setAttribute("class", "memMberListLabel");
				
				div1.appendChild(la);
				re.appendChild(div1);
				
			}
		}
	}
	function checkBtn(){
		if(!confirm("선택하시겠습니까?")) return;
		var ck = document.getElementsByClassName("memberCk");
		var opele = window.opener.document.getElementById("appResult");
		opele.innerHTML = "";
		var checkFlag = false;
		var resultStr = "선택된 사원\n";
		for(var i=0; i<ck.length;i++){
			if(ck[i].checked==true)
				{
					var la = document.createElement("input");
					alert(ck[i].value);
					la.setAttribute("type", "hidden")
					la.setAttribute("name", "appMember")
					la.setAttribute("value", ck[i].value);
					opele.appendChild(la);
					checkFlag = true;
					resultStr += jt[i].ename+"\n";
					
				}
		}
		if(checkFlag){
			alert(resultStr);
			window.opener.document.getElementById("appMemberId").innerHTML="결재자 등록완료(수정)"; //opener = materials input에서 열어준다!
			self.close();
		}else{
			alert("선택된 사원이 없습니다.");
		}
		
	}
	</script>
	</head>
	

	<body>

	<fieldset id="fieldWidth">
		<legend>
		<label>
		사원 목록
		</label>		
		</legend>
<div id="apBtnPosition">
<a href=# onclick="checkBtn()" class="myButton">선택완료</a>
</div>
		
<div id='apmtResult'>
</div>
	</fieldset>
	</body>
</html>