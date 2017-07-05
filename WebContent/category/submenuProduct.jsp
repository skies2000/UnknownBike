<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv='Content-Type' content='text/html; charset=utf-8' />
<title>Menu page</title>
<link rel='stylesheet' href='../category/category.css' />
     
    <script src='../jq_lib/common.js'></script>
<script>
function purList() {
	var frm = document.frm;
	frm.dCate.value = 'srl';
	frm.action = 'reqList.hoon';
	frm.submit();
}
</script>
</head>
<body>
	<div id='uipgMenuWrap'> 
		<div class='uipgMenu'>
			<ul>
    <li><a href="index.jsp?inc=../product/product_home.jsp">HOME</a>
    <!-- <input type=hidden value="../product/product_home.jsp"/> -->
    </li>
    <li><a href="index.jsp?inc=../product/product_management.jsp">생산관리</a>
    <!-- <input type=hidden value="../product/product_management.jsp"/> -->
      <ul>
      <li><a href="index.jsp?inc=../product/product_order.jsp">생산오더 관리</a>
        <!-- <input type=hidden value="../product/product_order.jsp"/></li> -->
        <li><a href="#" onclick="purList()">생산요청서 조회</a>
        <!-- <input type=hidden value="../product/product_request_list.jsp"/></li> -->
        
        <li><a href="index.jsp?inc=../product/product_eff.jsp">생산효율 관리</a>
        <!-- <input type=hidden value="../product/product_eff.jsp"/> -->
            <ul>
                <li><a href="index.jsp?inc=../product/product_eff_result.jsp">라인별 생산현황</a>
                <!-- <input type=hidden value="../product/product_eff_result.jsp"/></li> -->
                <li><a href="index.jsp?inc=../product/product_eff_result.jsp">기간별 생산현황</a>
                <!-- <input type=hidden value="../product/product_eff_result.jsp"/></li> -->
                <li><a href="index.jsp?inc=../product/product_eff_result.jsp">제품별 생산현황</a>
                <!-- <input type=hidden value="../product/product_eff_result.jsp"/></li> -->
            </ul>       
        </li>
      </ul> 
    </li>
    <li><a href="index.jsp?inc=../product/product_stock.jsp">재고조회</a>
    <!-- <input type=hidden value="../product/product_stock.jsp"/> -->
      <ul>
        <li><a href="index.jsp?inc=../product/product_stock_product.jsp">제품 재고 조회</a>
        <!-- <input type=hidden value="../product/product_stock_product.jsp"/> -->
        <li><a href="index.jsp?inc=../product/product_stock_material.jsp">자재 재고 조회</a>
        <!-- <input type=hidden value="../product/product_stock_material.jsp"/></li> -->
      </ul>
    </li>
    
  </ul>
		</div>
	</div>
	<form name='frm' method='post'>
		<input type='hidden' name='dCate'>
	</form>
</body>
</html>
