<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>

<html>
	<head>
		<title>Page Title</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0">
		<style>
            body *{
                
                  box-sizing:border-box;
            }
            #myhead{
                
                text-align:center;
                margin-bottom:3%;
                margin-top:3%;
            }
            #mytitle{
                width:100%;
                padding:10px;
                border-bottom:1px solid;
                
            }
            #mycenter{
                display: inline-block;
                width:45%;
                border:3px solid #b2b2b2;
                text-align:center;
                margin-bottom:13px;
                padding:15px;
                margin-left:26%;
                

            }
            #mypic{
              /*  display: inline-block;
                float:left;
                width:30%;
                
                box-sizing:border-box;
                padding-bottom:15px;*/
                margin-right:14%;
                padding-bottom:20px;
                
                
            }
            #mycon{
               /* display: inline-block;
                float:left;
                width:53%;
                
                box-sizing:border-box;
                text-align:left;
                margin-left:30%;*/
                margin-right:10%;
            }
            .mycon1>span{
                display: inline-block;
                width:100px;
                text-align:center;
                padding-bottom: 10px;
                margin-right:10px;
               
            }
            #pic{
                width:100px;
            }
            #mytitle{
                display:inline-block;
                margin:auto; 
                font-size:15pt;
                font-weight: bold;
            }
            #buttons{
                text-align:center;
            }
        </style>
	</head>

	<body>
	<div id=category>
      <jsp:include page="../category/submenuMyPage.jsp"></jsp:include>
   </div>
    <form name='frm' method="post">
       <div id='myhead'>
        <span id='mytitle'>회원정보수정</span>
        </div>
        
        
        <div id='mycenter'>
         
         <div id=mypic>
             <div class='mycon1'><span></span>
             <img src ='../images/yyh_empImage30001.jpg' id="pic">
             </div>
         </div>
          <div id='mycon'>
        <div class='mycon1'><span>사번</span><input type='text' id='ecode' name='ecode'></div>
         <div class='mycon1'><span>이름</span><input type='text' id='ename' name='ename'></div>
          <div class='mycon1'><span>연락처</span><input type='text' id='etel' name='etel'></div>
           <div class='mycon1'><span>주소</span><input type='text' id='eadd' name='eadd'></div>
            <div class='mycon1'><span>이메일</span><input type='text' id='eemail' name='eemail'></div>
             <div class='mycon1'><span>신규비밀번호</span><input type='text' id='epwd' name='epwd'></div>
             </div>
            
             </div>
             <div id='buttons'>
                 <input type="button" id='mymod' value="수정">
                 <input type="button" id='mycancle' value="취소">
             </div>
    </form>
	</body>
</html>