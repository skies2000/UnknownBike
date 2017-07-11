<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">

function start() {
	var frm = document.frm;
	var btnS = frm.getElementById("btnSearch");
	alert("1");
	btnS.onclick = function () {
		alert("2");
	}
	
}

</script>



<body>
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
	</div>

	<form name='frm' method='post'>
	<input type='text' name='startDate'/>~
	<input type='text' name='endDate'/><br/>
	<input type='text' name='product'/><br/>
	<input type='button' id='btnSearch' value='제품검색'/><br/>
	<input type='button' id='btnSearch' value='출력'/>
	</form>

<script type="text/javascript">start()</script>	
</body>
</html>