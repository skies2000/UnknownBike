<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<link href="https://fonts.googleapis.com/css?family=Patrick+Hand+SC|Roboto+Condensed|Shadows+Into+Light" rel="stylesheet">
<head>
    <title>메인</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0">
    <link rel='stylesheet' href='../category/category.css' />
    <link rel='stylesheet' href='../purchase/purchase.css' />
    <script src='../jq_lib/jquery-3.2.1.min.js'></script>
    <script src='../jq_lib/common.js'></script>
    <script>
    $(document).ready(function(){
    	/*로그아웃  */
    	$('#indexLogoutId').click(function(){
    		if(!confirm("로그아웃 하시겠습니까?")) return;
    		location.href="../login/logout.hwan";
    		
    	});
    	
    });
    
    	/*로그인 체크 */
    	function loginCheck(){
	    	var xhr = new XMLHttpRequest();
	    	xhr.open("get","../loginCheck.hwan");
	    	xhr.send();
	    	xhr.onreadystatechange = function(){
	    		if(xhr.readyState == 4 && xhr.status ==200){
	    			var txt = xhr.responseText;
	    			if(txt=="null"){
	    				alert("로그인 정보가 없습니다.");
	    				location.href="../login/login.jsp";
	    			}
	    			
	    		}
	    	}
    	} // end loginCheck()
    
    </script>
  

    <style>
        #indexbody{
            background-color: black;
        }
        #indexbody {
            box-sizing: border-box;
            color:white;
            text-decoration: none;            
            
        }
        #loginSessionTemp{
        	
        	
        }
        
        #allBody {
        }
        
        #indexHeader {
        text-align: right;
            height: 30px;  
            padding-top:10px;
            margin-right: 20px;           
        }
        #indexSection {
        }
        
        #indexFooter { 
            height: 100px;
            /*
            background-color: #222;
            */
        }
        
        #indexNav {
            padding-top: 45px;
            position: fixed;
            width: 60px;
            height: 98%;
            background-color: #222;
            text-align: center;
            line-height: 50px;
            
        }
        /*
        #indexNav a{
            display: inline-block;
            width: 90%;           
            background-color: #222;    
        }
        */
        #indeximage{
        transition: .5s ease;
        backface-visibility: hidden;
        }
        #indeximg:hover {
        opacity:0.5;
        filter:alpha(opacity=80); /* For IE8 and earlier */
            }
        
        #indexContent {
            width: 90%;
            margin: 0 auto;
            max-width: 900px;

        }
        
        /* 이거 왜 먹여놓으신거지...(수정: 2017 06 26 /황주희)*/
         /*이게 없으면 왼쪽 메뉴 속으로 컨텐츠들이 들어가 버림*/
        #mainBody{
        margin-right:0;
        margin-left: 65px;
        }
        
        
        #category{
            margin-top: 20px;
            height: 70px;
            /* background-color: aquamarine;  나중에 배경색 지우기*/
        }
    </style>
    
    
    <%
    
    
    	request.setCharacterEncoding("utf-8");
    	response.setContentType("text/html;charset=utf-8");
    	String inc = "home.html";
    	if(request.getParameter("inc")!=null){
    		inc = request.getParameter("inc");
    }
    %> 
<script >loginCheck();</script><!--로그인 체크 메소드  -->
</head>


<body id=indexbody>

    <div id=allBody>
 
        <nav id='indexNav'>
            <a href="../main/index.jsp?inc=home.html" ><img id='indeximg' src="../images/home.png"></a>
            <!-- <input type=hidden value="home.html"> --> 
            
            <a href="../main/index.jsp?inc=../laboratory/laboratoryIndex.jsp" ><img id='indeximg' src="../images/rnd.png"></a>
            <!-- <input type='hidden' value="../laboratory/laboratoryIndex.html"> -->
            
            <a href="purhome.so"><img id='indeximg' src="../images/purchase.png"></a>
            <!-- <input type=hidden value="../purchase/purchase_Index.html"> -->
            
            <a href="../main/index.jsp?inc=../product/product_index.jsp" ><img id='indeximg' src="../images/product.png"></a>

            <!-- <input type=hidden value="../product/product_index.jsp"> -->
            
            <a href="../main/index.jsp?inc=../sales/sales_home.jsp"><img id='indeximg' src="../images/sales.png"></a>
            <!-- <input type=hidden value="../sales/sales_index.html"> -->
            
            <a href=#><img id='indeximg' src="../images/mypage.png"></a>
        </nav>
    <div id='mainBody'>

            <header id='indexHeader'>
            <div id="loginSessionTemp">
            <%out.print(session.getAttribute("user")); %>님 로그인(임시 session키값은 user)
            </div> 
                <a href="#" id="indexLogoutId"><img id='indeximg' src="../images/logout.png"></a> <!--로그아웃 이벤트 적용시키기 위하여 indexLogoutId 아이디 만듦  -->
            </header>
       
            <!--각 팀들 카테고리 들어갈 부분(수정:2017 06 26 / 황주희)-->
            <!-- <div id='category'></div> -->

            <section id='indexSection'>
                <div id='indexContent'>

<%-- <%out.print(inc); %> --%>
			<jsp:include page="<%=inc%>"/>

                   <!-- <input type="hidden" id='pathCheck' value="testFile.html"> --> 

                </div>

            </section>

            <footer id=indexFooter></footer>
        </div>
    </div>
    
    
</body>

</html>