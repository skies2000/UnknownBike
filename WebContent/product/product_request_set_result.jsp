<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function start() {
	var frm = document.getElementById('f');
	var msg = frm.msg.value;
	alert(msg);
	
	// product_request_view에서 setOK값을 가져온다
	window.opener.document.getElementById('setOK').innerHTML = "<font color='green'>설정 완료</font>";
	window.close();
}
</script>
</head>
<body>
<form id='f'>
	<input type='hidden' value='${msg }' name='msg'>
</form>
<script>start()</script>
</body>
</html>