<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산 메인</title>
<link rel='stylesheet' href='../category/product_request_list.css' />
<script>
// 제목을 누르면 PK(문서번호??)를 가지고 가야대
function purView(code) {
	var frm = document.getElementById('f1');
	frm.dCode.value = code;
	frm.action = 'reqView.hoon';
	frm.submit();
}
// 제품 이미지 보기
function viewImg1(code) {
	var gsWin = window.open("", "winName", 'width=800, height=600');
	var frm = document.getElementById('f2');
	frm.pCode.value = code;
	frm.action = 'viewPimg.hoon';
	frm.target = "winName";
	frm.submit();
}
// 자재 이미지 보기
function viewImg2(code) {
	var gsWin = window.open("", "winName", 'width=800, height=600');
	var frm = document.getElementById('f3');
	frm.mCode.value = code;
	frm.action = 'viewMimg.hoon';
    frm.target = "winName";
	frm.submit();
}
</script>
</head>
<body>
	
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
	</div>
	
<form>

	<!-- 생산 오더 최근거 3개 -->
	<div>
		<h1 id='home_title'><label>생산 오더 관리</label></h1>
		<span class='list8'><a href="reqOdd.hoon" id="all">전체 보기</a></span><br><br>
		<div id='list'>
			<!-- 오더 리스트를 뿌려주는 곳 -->
			<span class='list9'>문서번호</span>
			<span class='list9'>제품코드</span>
			<span class='list9'>제품명</span> 
			<span class='list9'>수량</span> 
			<span class='list9'>작업라인</span> 
			<span class='list9'>작업인원</span> 
			<span class='list9'>소요시간</span> 
			<span class='list9'>시작일</span> 
			<span class='list9'>완료일</span>
		</div>
		<div id='result'>
			<c:forEach items="${list1 }" var="home_odd">
				<div id='list'>
					<span class='list9'>${home_odd.srlCode }</span> 
					<span class='list9'>${home_odd.srlMCode }</span> 
					<span class='list9'>${home_odd.pName }</span> 
					<span class='list9'>${home_odd.srlEa }</span> 
					<span class='list9'>${home_odd.workLine }</span> 
					<span class='list9'>${home_odd.workPeople }</span> 
					<span class='list9'>${home_odd.workTime }</span>
					<span class='list9'>${home_odd.workStartDate }</span>
					<span class='list9'>${home_odd.workEndDate }</span>
				</div>
			</c:forEach>
		</div>
	</div>
	<br><br>
	
	<!-- 생산 요청서 최근거 3개 -->
	<div>
		<h1 id='home_title'><label>생산 요청서 조회</label></h1>
		<span class='list8'><a href="reqList.hoon" id="all">전체 보기</a></span><br><br>
		<div id='list'>
			<span class='list1'>문서 번호</span> 
			<span class='list1'>문서 종류</span> 
			<span	class='list3'>문서 제목</span> 
			<span class='list2'>작성일</span> 
			<span class='list1'>작성자</span> 
			<span class='list1'>상태</span>
		</div>
		<div id='result'>
			<c:forEach items="${list2 }" var="home_list">
				<div id='list'>
					<span class='list1'>${home_list.dCode } </span> 
					<span class='list1'>${home_list.dCate }	</span> 
					<span class='list3'><a href='#' onclick="purView(${home_list.dCode })">${home_list.dName } </a></span> 
					<span class='list2'>${home_list.dDate } </span> 
					<span class='list1'>${home_list.eName } </span> 
					<span class='list1'>
						<c:choose>
							<c:when test="${home_list.dStatus == 0}">승인 완료</c:when>
						</c:choose>
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
	<br><br>
	
	<!-- 제품 이름/카테고리/재고/이미지 -->
	<div id='homeStock' style="float:left;">
		<h1 id='home_title'><label>제품 재고 조회</label></h1>
		<span class='list8'><a href="listP.hoon" id="all">전체 보기</a></span><br><br>
		<div id='list'>
			<span class='list1'>제품 명</span>
			<span class='list1'>카테고리</span>
			<span class='list1'>재고</span>
			<span class='list1'>제품 이미지</span>
		</div>
		<div id='result'>
			<c:forEach items="${list3 }" var="home_pro">
				<div id='list'>
					<span class='list1'>${home_pro.pName }</span>
					<span class='list1'>
						<c:choose>
							<c:when test="${home_pro.pCate == 1}">두발자전거</c:when>
							<c:when test="${home_pro.pCate == 2}">외발자전거</c:when>
							<c:when test="${home_pro.pCate == 3}">세발자전거</c:when>
							<c:when test="${home_pro.pCate == 4}">네발자전거</c:when>
							<c:when test="${home_pro.pCate == 5}">하이브리드</c:when>
						</c:choose>
					</span>
					<span class='list1'>${home_pro.pEa }</span> 
					<span class="list0 wrap">
						<input type='button' value='이미지 보기' id='btnImg' onclick="viewImg1(${home_pro.pCode })">
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<!-- 자재 이름/카테고리/재고/이미지 -->
	<div id='homeStock' style="float:right;">
		<h1 id='home_title'><label>자재 재고 조회</label></h1>
		<span class='list8'><a href="listM.hoon" id="all">전체 보기</a></span><br><br>
		<div id='list'>
			<span class='list1'>자재 명</span>
			<span class='list1'>카테고리</span>
			<span class='list1'>재고</span>
			<span class='list1'>자재 이미지</span>
		</div>
		<div id='result'>
			<c:forEach items="${list4 }" var="home_mtr">
				<div id='list'>
					<span class='list1'>${home_mtr.mName }</span>
					<span class='list1'>
						<c:choose>
							<c:when test="${home_mtr.mCate == 1}">바퀴</c:when>
							<c:when test="${home_mtr.mCate == 2}">핸들</c:when>
							<c:when test="${home_mtr.mCate == 3}">프레임</c:when>
							<c:when test="${home_mtr.mCate == 4}">바구니</c:when>
							<c:when test="${home_mtr.mCate == 5}">안장</c:when>
							<c:when test="${home_mtr.mCate == 6}">보조바퀴</c:when>
							<c:when test="${home_mtr.mCate == 7}">브레이크</c:when>
							<c:when test="${home_mtr.mCate == 8}">벨</c:when>
							<c:when test="${home_mtr.mCate == 9}">라이트</c:when>
							<c:when test="${home_mtr.mCate == 10}">페달</c:when>
						</c:choose>
					</span>
					<span class='list1'>${home_mtr.mEa }</span> 
					<span class="list0 wrap">
						<input type='button' value='이미지 보기' id='btnImg' onclick="viewImg2(${home_mtr.mCode })">
					</span>
				</div>
			</c:forEach>
		</div>
	</div>
</form>
<form method='post' id='f1'><input type='hidden' name='dCode'></form>
<form method='post' id='f2'><input type='hidden' name='pCode'></form>
<form method='post' id='f3'><input type='hidden' name='mCode'></form>
</body>
</html>