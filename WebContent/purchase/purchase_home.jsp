
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
	<head>
		<script>	
		
			function gowheel(mCate){
				var frm = document.frm;
				frm.mCate.value = mCate;
				frm.action = 'listcate.so';
				frm.submit();
				}
			function wholewheel(){
				var frm = document.frm;
				frm.action = 'purhome.so';
				frm.submit();
				}
			
			
			
		</script>
		
		
		<title>Page Title</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0">
	<style>
	#pur_home_category {
		border-top: 1px solid white;
		border-bottom: 1px solid white;	
		padding:6px;		
		text-align: center;	
	}
	#pur_home_view {
		margin: 30px;
		display: -webkit-flex;
		display: flex;
		
		/* flex먹이고 싶은 곳의 엄마에 두는 것
			창크기 줄였을때 계속 가운데로 오게함*/
		justify-content: center; 
		flex-wrap:wrap;
		/*(참고:row,column 등)*/
		/*
		border: 1px solid white;		
		*/
	}

	#purchase_home_btn{
		
		text-align: center;
	}
	.phcate {
		display:inline-block;
		width:auto;	
		color:white;	
	}
	.phcate:hover {
		color:#7e8389;
	}
	.phbar{
		width:30px;
		display: inline-block;
		text-align: center;
	}
	.phviewitem{
		/*
		border: 1px solid white;
		*/
		width: 20%;
		min-width: 165px;
		text-align: center;
		margin-bottom: 11px;
	}
	#purimg {
		width: 100px;
		height: 100px;	
	}
	.phviewtxt{
		font-size: 12px;
		width: 130px;
		/* 가운데정렬
		display: table-cell;
		text-align: center;
		*/
	}
	</style>
	</head>
    
	<body>
	<div id=category>
		<jsp:include page="../category/submenuPurchase.jsp"></jsp:include>
	</div>
    <!-- 카테고리 영역 -->
    <div id=pur_home_category>
   		<a href="#" onclick="wholewheel()"><span class='phcate'>전체</span></a>
    	<span class='phbar'>ㅣ</span> 
    	<a href="#" onclick="gowheel(1)"><span class='phcate'>바퀴</span></a>
    	<span class='phbar'>ㅣ</span>    	
    	<a href="#" onclick="gowheel(2)"><span class='phcate'>핸들</span></a>
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="gowheel(3)"><span class='phcate'>프레임</span></a>
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="gowheel(4)"><span class='phcate'>포크</span></a>
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="gowheel(5)"><span class='phcate'>인장</span></a>
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="gowheel(6)"><span class='phcate'>브레이크</span></a>
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="gowheel(7)"><span class='phcate'>라이트</span></a>
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="gowheel(8)"><span class='phcate'>페달</span></a>
    </div>
    
    
    
    
    <!-- 자재 페이지 그리드 형식 조회 -->	
	<div id=pur_home_view>
	
	<!-- for 문 돌아가는거 -->	
		<c:forEach items="${list}" var="vo"> 
		
		<div class='phviewitem'>
			<div id='phcheckbox'>
			<input type="checkbox">
			</div>
			<!-- 이미지부분 -->
			<div class='phviewimg'>
			<img id='purimg' src='../images/purchaseimg/${vo.mImage }'><br/>
			</div>
			<!-- 설명부분 -->
			<span class='phviewtxt'>
				자재코드: ${vo.mCode }<br/>
				자재명: ${vo.mName }	<br/>
				<c:if test="${vo.mState ==0}">	
			상태:<span class='phstatus' style="color:red"> ${vo.mState }</span>	
				</c:if>
				<c:if test="${vo.mState >0}">	
			상태:<span class='phstatus' style="color:white"> ${vo.mState }</span>	
				</c:if>
			
				
			</span>		
		</div>
		
		</c:forEach> 
	</div>

		
	<!-- 버튼 -->
	<div id='purchase_home_btn'>
		<a href='purinput.so' id='plok' class='pibutton'>구매보고서작성</a>
		
	</div>	

		
	<form name='frm' method='post'>
		<input type='hidden' name='mCate'>
	</form>
	</body>
</html>
