<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype htm                                                                                                             l>
<html>
<head>
<title>Page Title</title>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0">
<style>
#maView {
	margin-bottom: 10%;
}

#maViewDiv {
	width: 60%;
	margin-left: auto;
	margin-right: auto;
}

#maViewDiv table {
	border: 1px solid #aaa;
	border-spacing: 0px;
	margin-top: 5%;
	text-align: center;
}

#maViewDiv table td {
	border: 1px solid #aaa;
}

.myButton {
	-moz-box-shadow: inset 0px 1px 0px 0px #000000;
	-webkit-box-shadow: inset 0px 1px 0px 0px #000000;
	box-shadow: inset 0px 1px 0px 0px #000000;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #000000
		), color-stop(1, #000000));
	background: -moz-linear-gradient(top, #000000 5%, #000000 100%);
	background: -webkit-linear-gradient(top, #000000 5%, #000000 100%);
	background: -o-linear-gradient(top, #000000 5%, #000000 100%);
	background: -ms-linear-gradient(top, #000000 5%, #000000 100%);
	background: linear-gradient(to bottom, #000000 5%, #000000 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000',
		endColorstr='#000000', GradientType=0);
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
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #000000
		), color-stop(1, #000000));
	background: -moz-linear-gradient(top, #000000 5%, #000000 100%);
	background: -webkit-linear-gradient(top, #000000 5%, #000000 100%);
	background: -o-linear-gradient(top, #000000 5%, #000000 100%);
	background: -ms-linear-gradient(top, #000000 5%, #000000 100%);
	background: linear-gradient(to bottom, #000000 5%, #000000 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#000000',
		endColorstr='#000000', GradientType=0);
	background-color: #000000;
}

.myButton:active {
	position: relative;
	top: 1px;
}

#maViewDiv {
	position: relative;
	width: 700px;
}

#maViewDiv #myButton {
	margin-left: 460px;
}

/* #maViewDiv #backBtn {
	margin-left: 600px;
}

#maViewDiv #modifyBtn {
	margin-left: 400px;
} */

/*    #mViewDiv td span{
        	text-align: center;
        	display: inline-block;
        	margin-left: auto;
        	margin-right: auto;
        } */
</style>

<script>
	$('#maViewDiv #backBtn').click(function() {
		var xhr = new XMLHttpRequest();
		xhr.open("get", "../laboratory/materialsDetails.html");
		xhr.send();
		xhr.onreadystatechange = function() {

			if (xhr.readyState == 4 && xhr.status == 200) {
				var str = xhr.responseText;
				$("#laboratorResult").html(str);
			}
		}

	});

	//삭제
	function mDelete(mcode) {
		//alert(mcode);
		var xhr = new XMLHttpRequest();
		var str = "";
		var frm1 = document.getElementById('frm1');
		frm1.mcode.value = mcode;
		/* 	
			frm1.action = "../kimDel.kimHa";
			frm1.submit();
 */
		var fd = new FormData(frm1);

		xhr.open("post", "../kimDel.kimHa");
		xhr.send(fd);
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				str = xhr.responseText;

				if (str == 1) {
					alert("정상적으로 삭제되었습니다.");

				} else {
					alert("삭제중 오류발생.");
					return;
				}

				xhr = new XMLHttpRequest();
				xhr.open('get', '../laboratory/materialsDetails.html'); // url요청 정보
				xhr.send(); // 서버에 전송
				var str = '';
				xhr.onreadystatechange = function() {
					if (xhr.readyState == 4 && xhr.status == 200) {
						str = xhr.responseText;
						$('#laboratorResult').html(str);
					}

				//$("#matListResult").html(str);
				}
			}
		}
	}
</script>
</head>

<body>
	<div id="maViewDiv">


		<div id="maView">자재뷰</div>
		<hr />

		<form>
			<div>
				<img src="../images/purchaseimg/${vo.mimage}" width="700px"
					height="300px" id='viewImg'>
				<table width="700px">
					<tr>
						<td><span>작성자</span></td>
						<td>자재명</td>
						<td>결재승인자1</td>
						<td>결재승인자2</td>
						<td>단가</td>
						<td>자재종류</td>
						<td colspan="2">작성일</td>
						<td>결재승인상태</td>
					</tr>
					<tr>
						<td>${vo.mdev}</td>
						<td>${vo.mname}</td>
						<td>${vo.appOne }</td>
						<td>${vo.appTwo}</td>
						<td>${vo.mprice}</td>
						<td>${vo.mcateStr}</td>
						<td colspan="2">${vo.mdate}</td>
						<td>${vo.mstateStr}</td>

					</tr>
				</table>
				<div id="myButton">
					<a href="#"
						id='delBtn' class="myButton" onclick="mDelete('${vo.mcode}')">삭제</a>
					<a href="#" id='backBtn' class="myButton">뒤로</a>
				</div>
			</div>
		</form>
	</div>
	<form name='frm1' id='frm1' method='post' enctype="multipart/form-data">
		<input type="hidden" name="mcode" id="mc1" />
	</form>
</body>

</html>
