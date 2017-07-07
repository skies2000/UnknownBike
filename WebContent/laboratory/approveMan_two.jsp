<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>

<html>
	<head>
		<title>Page Title</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0">
	</head>
	<script>
	
	var xhr = new XMLHttpRequest();
	xhr.open('get','appTwo.hwan');
	xhr.send();
	xhr.onreadystatechange = function(){
		if(xhr.readyState == 4 && xhr.status == 200){
			var txt = xhr.responseText;
			var jt = JSON.parse(txt);
			var re = document.getElementById("apmtResult");
			
			for(var i = 0 ; i< jt.length; i++){
				var div1 =  document.createElement("div");
				var check = document.createElement("input");
				var la = document.createElement("label");
				
				
				check.setAttribute("type", "checkbox");
				check.setAttribute("name",jt[i].ename);
				check.setAttribute("class","memberCk");
				la.appendChild(check);
				la.innerHTML+=jt[i].ename+", "+jt[i].ecode;
				div1.appendChild(la);
				re.appendChild(div1);
				
			}
		}
		
		
	}
	function checkBtn(){
		
		var ck = document.getElementsByClassName("memberCk");
		
		for(var i; i<ck.length;i++){
			alert(ck[i]);
		}
	}
	</script>

	<body>

	
<div id='apmtResult'>
</div>

<a href=# onclick="checkBtn()">선택완료</a>
	</body>
</html>