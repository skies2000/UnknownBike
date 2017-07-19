
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--Files creaded by http://www.uiplayground.in/responsive-menu-navigation/menu.php website-->
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Menu page</title>
<link rel='stylesheet' href='../category/category.css' />
     
    <script src='../jq_lib/common.js'></script>
    <script>
    
        $(document).ready(
			function(){
                xhr = new XMLHttpRequest();
	           xhr.open('get','../laboratory/productDetails.html'); // url요청 정보
	           xhr.send(); // 서버에 전송
               var str='';
               xhr.onreadystatechange=function(){
                   if(xhr.readyState == 4 && xhr.status == 200){
                       str = xhr.responseText;
                       $('#laboratorResult').html(str);
                   }
               }
            $(".uipgMenu a").click(function(){
            var url = $(this).next('input').val();
            //a태그를 클릭한 넥스트 인풋 태그의 value(url)값을 얻어서 에이작스를 통해 해당 파일을
            //로드해서 #laboratorResult태그에 출력한다.
                xhr = new XMLHttpRequest();
	           xhr.open('get',url); // url요청 정보
	           xhr.send(); // 서버에 전송
               var str='';
               xhr.onreadystatechange=function(){
                   if(xhr.readyState == 4 && xhr.status == 200){
                       str = xhr.responseText;
                       
                       $('#laboratorResult').html(str);
                   } 
               }
            });
            });
        </script>
</head>
<body>

	<div id='uipgMenuWrap'>
		<div class='uipgMenu'>
		  <ul>
    
		  
		  <!--제이쿼리를 통해 클릭한 a 태그 다음에 있는 히든태그의 value값을 얻어온다. -->
    <li><a href="#">Home</a>
    <input type =hidden value="../laboratory/laboratoryHome.html"/>
    </li>
    
    <li><a href="##">제품</a>
      <ul>
        <li><a href="#">등록</a>
        <input type=hidden value="../laboratory/productInput.html"/>
        </li>
        
        <li><a href="#">상세</a>
        <input type=hidden value="../laboratory/productDetails.html"/>
        </li>
      </ul>
    </li>
    <li><a href="##">자재</a>
      <ul>
        <li><a href="#">등록</a>
        <input type=hidden value="../laboratory/materialsInput.html"/>
        </li>
        <li><a href="#">상세</a>
        <input type=hidden value="../laboratory/materialsDetails.html"/>
        </li>
         
      </ul>
    </li>
   
    
  </ul>
		</div>
	</div>
</body>
</html>
