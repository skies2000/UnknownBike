<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel='stylesheet' href='../category/sales_market_sale_input.css' />

<style>
#aaa{
	border-bottom : 1px solid white;
	height : 50px;
	width : 100%;
}

</style>


</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuSales.jsp"></jsp:include>
	</div>

	<div id='sey_SalesResult'>


		<div id='sey_body'>
			<div id='sey_head'>
				<div id='sey_head1'></div>
				<div id='sey_head2'>판매 품의서</div>
				<div id='sey_head3'>
					<div id='sey_head3-1'>
						<div id='sey_head31'>문서번호</div>
						<div id='sey_head32'></div>
					</div>
					<div id='sey_head3-2'>
						<div id='sey_head31'>작성자</div>
						<div id='sey_head32'></div>
					</div>
					<div id='sey_head3-3'>
						<div id='sey_head31'>날짜</div>
						<div id='sey_head32'></div>
					</div>
				</div>
			</div>
			<div id='sey_sign'>
				<div id='sey_sign1'>아래와 같이 판매품의 합니다.</div>
				<div id='sey_sign2'>
					<div id='sey_appro'>결&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp재</div>
					<div id='sey_writer'>작성자</div>
					<div id='sey_appro1'>결재자1</div>
					<div id='sey_appro2'>결재자2</div>
					<div id='sey_stamp1'></div>
					<div id='sey_stamp2'></div>
					<div id='sey_stamp3'></div>
					<div id='sey_date1'>2017.06.27</div>
					<div id='sey_date2'>2017.06.27</div>
					<div id='sey_date3'>2017.06.27</div>
				</div>
			</div>
			<div id='sey_classify'>
				<div id='sey_sel1'>
					<select>
						<option selected>- 카테고리 -</option>
						<option value = '1'>외발자전거</option>	
						<option value = '2'>두발자전거</option>	
						<option value = '3'>세발자전거</option>	
						<option value = '4'>네발자전거</option>	
						<option value = '5'>하이브리드자전거</option>			
					</select>
				</div>
				<div id='sey_sel2'>
					<select>
						<option selected>- Code -</option>
						
					</select>
				</div>
				<div id='sey_sel3'>
					<select>
						<option selected>- 거래처 -</option>
						
					</select>
				</div>	


				<div id='sey_add'>
					<input type='button' value='추가' id='sey_sl_btnInput'>
				</div>
			</div>
			<div class='aa'></div>
			
			<div id='sey_subject'>
				<span id='sey_code'>제품코드</span>
				<span id='sey_codeName'>제품명</span> 
				<span id='sey_custom'>거래처</span>
				<span id='sey_ea'>수량</span>
				<span id='sey_unit'>단가</span>
				<span id='sey_total'>총액</span> 
				<span id='sey_saledate'>판매일자</span>
			</div>
			<div id='sey_sl_content'>
				<div class='sey_content_list'>
					<span id='sey_code'>a001</span>
					<span id='sey_codeName'>외발자전거-red</span> 
					<span id='sey_custom'>삼성생명</span> 
					<span id='sey_ea'>500</span> 
					<span id='sey_unit'>500,000</span>
					<span id='sey_total'>250,000,000</span> 
					<span id='sey_saledate'>2017-06-28</span>
					<span id='sey_del'>삭제</span>
				</div>


			</div>

		</div>
		<div id='sey_sendBtn'>
			<input type='button' value='작성완료' id='sey_sl_btnSend'>
		</div>

	</div>
</body>
</html>