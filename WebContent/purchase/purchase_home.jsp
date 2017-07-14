
<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

	
<html>
	<head>
	<link rel='stylesheet' href='../purchase/purchase_modal.css' />
	<script src='../jq_lib/jquery-3.2.1.min.js'></script>
		<script>	
		
			function gowheel(mCate){

				var frm = document.frm;
				frm.mCate.value = mCate;
				frm.action = 'listcate.so';
				alert("ggg");
				frm.submit();
				}
			function wholewheel(){
				var frm = document.frm;	
				frm.action = 'purhome.so';
				frm.submit();
				}
			function needwheel(){
				var frm = document.frm;		
				frm.action = 'needcate.so';
				frm.submit();
				}
			function pursearch(){
				var frm1= document.frm1;
				frm1.action = 'pursearch.so';
				frm1.submit();					
				}				
			//여러개일때...		
			function purch_img(abc){
				var modal = document.getElementById('myModal');
				modal.style.display = "block";
				var purfrm = document.getElementById("purhome_form");
				purfrm.mCode.value = abc;
				var abcabc = new FormData(purfrm);
				var abcxml = new XMLHttpRequest();
				abcxml.open("post","../detailinfo.so");
				abcxml.send(abcabc);
				abcxml.onreadystatechange = function(){
					if(abcxml.readyState == 4 && abcxml.status == 200){
							var deff = abcxml.responseText;
							var deff2 = JSON.parse(deff);

							var productDetailInfoDiv = document.getElementById("productDetailInfoDiv");

							var phviewitemDiv = document.createElement("div");

							var phcheckboxDiv = document.createElement("div");
							var phcheckbox = document.createElement("input");

							var imgDiv = document.createElement("div");
							var img = document.createElement("img");
							
							var phviewtxtSpab = document.createElement("span");

							var phstatusSpan = document.createElement("span");

							
							phviewitemDiv.setAttribute("class", "phviewitem");
							
							imgDiv.setAttribute("class", "phviewimg");
							img.setAttribute("src", "../images/purchaseimg/"+deff2[0].mImage);
							img.setAttribute("id", "purimg");
							
							phcheckboxDiv.setAttribute("class", "phcheckbox");
							phcheckbox.setAttribute("type", "checkbox");
							
							
							phviewtxtSpab.setAttribute("class", "phviewtxt");


							
							phviewtxtSpab.innerHTML="자재코드:"+deff2[0].mCode;
							phviewtxtSpab.appendChild(document.createElement("br"));
							phviewtxtSpab.innerHTML+="자재명:"+deff2[0].mName;
							phviewtxtSpab.appendChild(document.createElement("br"));


							
							phstatusSpan.innerHTML=deff2[0].mEa+"개";
							phstatusSpan.setAttribute("class", "phstatus");
							if(deff2[0].mEa<=50){
								phstatusSpan.setAttribute("style","color:#a6827e");
							}else{
								phstatusSpan.setAttribute("style","color:white");
							}


							phcheckboxDiv.appendChild(phcheckbox);
							imgDiv.appendChild(img);

							phviewitemDiv.appendChild(phcheckboxDiv);
							phviewitemDiv.appendChild(imgDiv);
							phviewitemDiv.appendChild(phviewtxtSpab);
							phviewitemDiv.appendChild(phstatusSpan);

							productDetailInfoDiv.appendChild(phviewitemDiv);
							
						}
					}
				}
			
			window.onclick = function(event) {
				var modal = document.getElementById('myModal');
			    if (event.target == modal) {
			        modal.style.display = "none";
			    }
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
	.phcate_need{
		display:inline-block;
		width:auto;	
		color:#a6827e;
	}
	.phcate_need:hover{
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
	
	#pur_search{
		text-align: right;
		margin-bottom: 15px;
	}
	
	
	/*상세 제품 정보에 추가되는 내용이 새로로 추가가 되서 가로로 추가 되게 css 먹여봄  */
	#productDetailInfoDiv .phviewitem{
		display: inline-block;
		width: 100px;
		border: 1px solid red;
		float: left;
		
	}
	
	
	
	</style>
	</head>
    
	<body>
	

	<div id=category>
		<jsp:include page="../category/submenuPurchase.jsp"></jsp:include>
	</div>
	<form name='frm1' method='post'>
	<div id=pur_search>
	<input type="text" style="height:25px;" size="25" name="findStr"><span id='purchase_src_btn'>
		<a href='#' id='plok' class='pibutton' onclick="pursearch()">검색 </a>		
		</span>		
	</div>
	</form>
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
    	<span class='phbar'>ㅣ</span>   
    	<a href="#" onclick="needwheel()"><span class='phcate_need'>구매필요</span></a>
    </div>
    
    
    
    
    <!-- 자재 페이지 그리드 형식 조회 -->	
	
	<!-- for 문 돌아가는거 -->	
		<form name='frm2' method='post'>
			<div id=pur_home_view>
		<c:forEach items="${list}" var="vo"> 
		
		<div class='phviewitem'>
		
		
			<div id='phcheckbox'>
			<input type="checkbox" name='checkmaterial' value='${vo.mCode }'>
			</div>
			<!-- 이미지부분 -->
			<div class='phviewimg'>
			
			<img id='purimg' src='../images/purchaseimg/${vo.mImage }' onclick="purch_img(${vo.mCode })"><br/>
			</div>			
			
			<!-- 설명부분 -->
			<span class='phviewtxt'>
				자재코드: ${vo.mCode }<br/>
				자재명: ${vo.mName }	<br/>
			<c:if test="${vo.mEa <=50}">	
			<span class='phstatus' style="color:#a6827e"> ${vo.mEa } 개</span>	
			</c:if>
			<c:if test="${vo.mEa >50}">	
			<span class='phstatus' style="color:white"> ${vo.mEa } 개</span>	
			</c:if>
			
				
			</span>
		
		</div>
		
		</c:forEach> 
				</div>
		</form>

		
	<!-- 버튼 -->
	<div id='purchase_home_btn'>
		<a href='#' id='plok' class='pibutton' onclick='goinput()'>구매보고서작성</a>
	</div>	

		
	<form name='frm' method='post' id=purhome_form enctype="multipart/form-data">
		<input type='hidden' name='mCate'>
		<input type='hidden' name='mCode'>
	</form>
	
	<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <div class="modal-header">
      
      <h2>상세 제품 정보</h2>
    </div >
    <div class="modal-body" id = "productDetailInfoDiv">
		
		
		
    </div>

  </div>

</div>		
	
	
	

	</body>
</html>
