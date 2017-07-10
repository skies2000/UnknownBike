<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Menu page</title>
<link rel='stylesheet' href='../category/category.css' />

<script src='../jq_lib/common.js'></script>

<!--  <script>
        $(document).ready(
			function(){
                xhr = new XMLHttpRequest();
	           xhr.open('get','../purchase/purchase_home.html'); // url요청 정보
	           xhr.send(); // 서버에 전송
               var str='';
               xhr.onreadystatechange=function(){
                   if(xhr.readyState == 4 && xhr.status == 200){
                       str = xhr.responseText;
                       $('#purchaseResult').html(str);
                   }
               }
            $(".uipgMenu a").click(function(){
            	
            var url = $(this).next('input').val();
                xhr = new XMLHttpRequest();
	           xhr.open('get',url); // url요청 정보
	           xhr.send(); // 서버에 전송 
               var str='';
               xhr.onreadystatechange=function(){
                   if(xhr.readyState == 4 && xhr.status == 200){
                       str = xhr.responseText;
                       $('#purchaseResult').html(str);
                   }
               }
            });
            });
    </script> -->

</head>
<body>
	<div id='uipgMenuWrap'>
		<div class='uipgMenu'>
			<ul>
				<li><a href="purhome.so">HOME</a> 
					<!-- <input type=hidden value="../purchase/purchase_home.html" /> -->
				</li>

				<li><a href="##">보고서</a>
					<ul>
						<li>
							<a href="purinput.so">보고서 작성</a> 
							<!-- <input type=hidden value="../purchase/purchase_Input.html" /> -->
						</li>

						
						<li>
							<a href="purRList.so">보고서 관리</a> 
							<!-- <input type=hidden value="../purchase/purchase_ReportList.html" /> -->
						
					</ul>
				</li>	

			</ul>
		</div>
	</div>
</body>
</html>
