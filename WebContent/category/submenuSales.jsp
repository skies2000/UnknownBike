<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Menu page</title>
<link rel='stylesheet' href='../category/category.css' />
     
    <script src='../jq_lib/common.js'></script>


</head>
<body>
<%
	String userId = (String)session.getAttribute("user");
%>

	<div id='uipgMenuWrap'>
		<div class='uipgMenu'>
		  <ul>
    
    
    <li><a href="index.jsp?inc=../sales/sales_home.jsp">HOME</a>
    </li>
    
    
    <li><a href="##">생산관리</a>
      <ul>
        	<li><a href="sales_req_list.sung">생산요청서 조회</a>
        </li>
        
        <li><a href="sales_req_input.sung">생산요청서 작성</a>
        </li> 
      </ul>
    </li>
    
    <li><a href="##">판매관리</a>
      <ul>
        <li><a href="sales_sale_list.sung">판매품의서 조회</a>
        </li>
        <li><a href="sales_sale_input.sung">판매품의서 작성</a>
        </li>
       
      </ul>
    </li>
    
    <li><a href="##">손익관리</a>
      <ul>
        <li><a href="sales_profit_view.sung">거래처별</a>
        </li>
      
      </ul>
    </li>
   
    
  </ul>
		</div>
	</div>
	
	<form name = 'frm' method = 'post'>
		<input type='hidden' name='dCate'>
		<input type='hidden' name='userId'>
	</form>
	
	
</body>
</html>
