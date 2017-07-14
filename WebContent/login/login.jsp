<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!doctype html>

<html>

<head>
    <title>Login</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,700">
    <script src="../jq_lib/jquery-3.2.1.min.js"></script>
    <script>
    $(document).ready(function(){
    	$("#loginSubmit").click(loginResult);
    	$('#pass').keypress(function(ev){	
    		if(ev.which==13){
    			loginResult();
    		}
    	});
    });
    function loginResult(){
    	$("*").css("cursor","wait");
    	var xhr = new XMLHttpRequest();
		var url = "../login.hwan";
		var frm = document.getElementById("fromId"); //���̵��� �̿��� ���� ���ҿ´�.
		var formData = new FormData(frm); //������ �������� �̿��� FormData�� �����. ajax�� submit�ϱ� ���ؼ� �ʿ��� ��ü
		var userid = frm.userid.value;
		var userpwd = frm.userpwd.value;
		xhr.open("post",url); // post��İ� submit�� ��θ� ����
		xhr.send(formData);   // ������ �������� ��� �ִ� formData ����. form�� input �������� �ش� url�� �Ѱ�����.
		
		xhr.onreadystatechange=function(){ //ȭ����ȯ ���� ��׶���� ����� ������ �����ü� �ִ�.
			if(xhr.readyState == 4 && xhr.status == 200){//login.hwan�� ��� ����(����)�� ��ġ�� �̺κ��� ����ȴ�.  
				var txt = xhr.responseText; //HwanController>login.hwan���� print.out��(ȭ�鿡 ��µ�) ������ �����´�.
				
				var jData = JSON.parse(txt); //������ �ؽ�Ʈ�� ���̽� Ÿ������ ����.
				
				var testStr = "��ϵ� ���\n";
				for(var i = 0; i<jData.length;i++){ 
					testStr += "�����ȣ : "+jData[i].ecode+", ��й�ȣ : "+jData[i].epwd+"\n";
				}
				alert(testStr);
				$("*").css("cursor","default");
				for(var i = 0; i<jData.length;i++){
					 if(jData[i].ecode == userid){
						if(jData[i].epwd == userpwd){
							frm.action = "../main/mainIndex.hwan";
							frm.submit();
							return;
						}else{
							alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
							return;
						}
					} 
    				}
				alert("��ϵ� ������ �����ϴ�.");
				return;
			}
		}
    }
    </script>
    <style>
        @charset "utf-8";
        @import url(http://weloveiconfonts.com/api/?family=fontawesome);
        [class*="fontawesome-"]:before {
            font-family: 'FontAwesome', sans-serif;
        }
         
        #loginBody {
            background: #2c3338;
            color: #606468;
            font: 87.5%/1.5em 'Open Sans', sans-serif;
            margin: 0;
            
        }
        
        #login input, #login #loginSubmit {
            border: none;
            font-family: 'Open Sans', Arial, sans-serif;
            font-size: 16px;
            line-height: 1.5em;
            padding: 0;
            -webkit-appearance: none;
        }
        
        #loginBody p {
            line-height: 1.5em;
        }
        
        after {
            clear: both;
        }
        
        #login { /*loginâ ��ġ ���� ����  */
            margin: 50px auto;
            width: 320px;
        }
        
        #login form {
            margin: auto;
            padding: 22px 22px 22px 22px;
            width: 100%;
            border-radius: 5px;
            background: #282e33;
            border-top: 3px solid #434a52;
            border-bottom: 3px solid #434a52;
        }
        
        #login form span {
            background-color: #363b41;
            border-radius: 3px 0px 0px 3px;
            border-right: 3px solid #434a52;
            color: #606468;
            display: block;
            float: left;
            line-height: 50px;
            text-align: center;
            width: 50px;
            height: 50px;
        }
        
        #login form input[type="text"] {
            background-color: #3b4148;
            border-radius: 0px 3px 3px 0px;
            color: #a9a9a9;
            margin-bottom: 1em;
            padding: 0 16px;
            width: 235px;
            height: 50px;
        }
        
        #login form input[type="password"] {
            background-color: #3b4148;
            border-radius: 0px 3px 3px 0px;
            color: #a9a9a9;
            margin-bottom: 1em;
            padding: 0 16px;
            width: 235px;
            height: 50px;
        }
        
        #login form #loginSubmit {
            background: #b5cd60;
            border: 0;
            width: 100%;
            text-align: center;
            text-decoration: none;
            line-height : 40px;
            height: 40px;
            border-radius: 3px;
            color: white;
            cursor: pointer;
            transition: background 0.3s ease-in-out;
            display: inline-block;
        }
        
        #login form #loginSubmit:hover {
            background: #16aa56;
            display: inline-block;
            
        }
    </style>
</head>

<body id="loginBody">
    <div id="login"> <!--css�� Loginâ �̵���ų�� #Login�� ��ġ ���� �ϸ� ��.  -->
        <form name="form-login" method="post" enctype="multipart/form-data" id="fromId">
            <span class="fontawesome-user"></span>
            <input type="text" id="user" placeholder="Username" name="userid" value="30001">

            <span class="fontawesome-lock"></span>
            <input type="password" id="pass" placeholder="Password" name="userpwd" value="1111">

            <a href="#" id="loginSubmit">Login</a>
        </form>
    </div>
</body>

</html>