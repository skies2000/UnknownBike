<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel='stylesheet' href='../category/sales_market_sale_view.css' />
<title>Insert title here</title>
<style>
#list_title {
	text-align: center;
}

#plist_header{
	font-size: 14px;
	width : 20%;
	margin-left: 85px;
}

#plist_content{
	border : 1px solid white;
	margin: auto;
	width: 700px;
	height: 87%;
	padding : 5px;
}
#pdview_btn{
	text-align: center;
}

</style>
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuPurchase.jsp"></jsp:include>
	</div>

	<div id='SalesResult'>
		<div id='body'>
			<!--  ------------------상단타이틀--------------------  -->
			<div id='title'>구매요청서</div>
			<!--  ------------------헤더--------------------  -->
			<div class='head'>
				<div id='sign1'>
					<label>문서번호</label><br /> <label>DC-01234</label>
				</div>
				<div id='sign2'>
					<div id='appro'>결&nbsp재&nbsp내&nbsp역</div>				
					<div id='writer'>${vo.dWrite }</div>
					<div id='appro1'>${vo.app1 }</div>
					<div id='appro2'>${vo.app2 }</div>
					<div id='stamp1'>
						<div id='status'>작성</div>
						<div id='app_date'>2017-06-28</div>
					</div>
					<div id='stamp2'>
						<div id='status'>승인</div>
						<div id='app_date'>2017-06-28</div>
					</div>
					<div id='stamp3'>
						<div id='status'>대기</div>
						<div id='app_date'>2017-06-28</div>
					</div>
				</div>
			</div>
			<!--  ------------------제목--------------------  -->
			<div id='subject'>
				<span id='labeltitle'> <label>제목</label>
				</span> <span id='subcontent'> 빨리 결재해주세여 빨리여빨리 다 팔게 </span>
			</div>

			<br/>
			<div id='plist_header'>요청제품 리스트</div>
			<!--  ------------------판매목록--------------------  -->
			<br/><br/>
			<div id='sale_list'>
				<div id='list_title'>
					<span id='code'>자재코드</span> 
					<span id='codeName'>자재명</span> 
					<span id='custom'>거래처</span> <span id='ea'>수량</span> 
					<span id='unit'>단가</span>
					<span id='total'>총액</span>
				</div>
				<div id='plist_content'>
					<c:forEach items="${list}" var="vo">
					<span id='code'>${vo.plMCode }</span> 
					<span id='codeName'>${vo.plMCode }</span> 
					<span id='custom'>거래처</span> <span id='ea'>수량</span> 
					<span id='unit'>단가</span>
					<span id='total'>총액</span>
					
					</c:forEach> 				
					
				</div>
			</div>
		<br/><br/>
	<form name='frm1' method='post'>
	<div id=pdview_btn>
	<span id='purchase_dview_btn'>
		<a href='#' id='plok' class='pibutton' onclick="pursearch()">확인</a>		
	</span>		
	</div>
	</form>

		</div>
	</div>
</body>
</html>