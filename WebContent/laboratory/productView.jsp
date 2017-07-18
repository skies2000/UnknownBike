<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>


<head>
    <title>Page Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0">
	<script>
		
	$('#proView #mListFunc').click(function(){
		window.open("","mList","height=1000px, width=1000px");
		var frm = document.getElementById("pviewFrm");
		frm.action = "../mList.hwan";
		frm.target = "mList";
		frm.submit();
		
	});
	
	$('#proView #backBtn').click(function(){
		var xhr = new XMLHttpRequest();
		xhr.open("get","../laboratory/productDetails.html");
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var txt = xhr.responseText;
				$("#laboratorResult").html(txt);
			}
		}
	});
	
	function delBtnFunc(pcode){
		if(!confirm("삭제 하시겠습니까?")) return;
		
		xhr.open("get","../productDel.hwan?pcode="+pcode);
		xhr.send();
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var txt = xhr.responseText;
				$("#laboratorResult").html(txt);
			}
		}
		
	}
	/* $('#proView #delBtn').click(function(){
		var xhr = new XMLHttpRequest();
		var frm = document.getElementById("proViewFrm");
		alert(frm.pcode.value);
		var fd = new FormData(frm);
		
		xhr.open("post","../productDel.hwan");
		xhr.send(fd);
		xhr.onreadystatechange = function(){
			if(xhr.readyState == 4 && xhr.status == 200){
				var txt = xhr.responseText;
				$("#laboratorResult").html(txt);
			}
		} 
	}); */
	</script>

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
     
        #proView {
        position: relative;
            width: 300px;
            margin: auto;
        }
        #proView table{
            border: 1px solid #aaa;
            border-spacing: 0px; 
        }
        #proView table td{
            border: 1px solid #aaa;
            
        }
        #proView table td a{
        display: inline-block;
        
        text-align: center;
        width: 200px;
        display: inline-block;
        
        
        }
        #proView #backBtn, #proView #delBtn{
        border: 1px solid white;
        margin-left: 70%; 
         } 
         
        
    </style>
</head>


<body>
    <div id=proView>
        <div id="pvTitle">제품뷰</div>
        <hr/>
        <form method="post" id="pviewFrm">
	        <input type="hidden" name="mlpcode" value='${vo.pcode}'>
        </form>
    
        <img src="../images/${vo.pimage}" width="300px" height="200px">
        
        <table> 
            <tr>
                <td>작성자</td>
                <td>제품명</td>
                <td>결재승인자1</td>
            </tr>
            <tr>
                <td>${vo.pdev}</td>
                <td>${vo.pname}</td>
                <td>${vo.appOne}</td>
            </tr>
            
            <tr>
                <td>단가</td>
                <td>원가</td>
                <td>결재승인자2</td>
            </tr>
            <tr>
                <td>${vo.pprice}</td>
                <td>${vo.pcost}</td>
                <td>${vo.appTwo}</td>
            </tr>
            
            
            <tr>
                <td>작성일</td>
                <td>제품생산기간</td>
                <td>결재승인상태</td>
            </tr>
            <tr>
                <td>${vo.pdate}</td>
                <td>${vo.pmanhour}</td>
                <td>${vo.pstatus}</td>
            </tr>
            <tr>
                <td>${vo.pcate}</td>
                <td colspan="2"><a class="myButton" id="mListFunc">자재리스트</a></td>        
            </tr>
        </table>
        <a href=# id = "backBtn" class = "myButton" >뒤로</a>
        <a href=# id = "delBtn" class = "myButton" onclick="delBtnFunc('${vo.pcode}')">삭제</a>
        
        <form method = 'post' id = "proViewFrm"enctype="multipart/form-data">
        <input type="hidden" name = "pcode" value = '${vo.pcode}'>
        	
        </form>
    </div>

</body>

</html>