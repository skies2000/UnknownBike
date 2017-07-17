<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산 요청서 상세 페이지</title>
<link rel='stylesheet' href='../category/product_request_view.css' />
<script>
function onSetting(srlCode, srlMCode) {
	var gsWin = window.open("", "winName", 'width=410, height=550, resizable=no');
    var frm = document.getElementById('fff');
    frm.srlCode.value = srlCode;
    frm.srlMCode.value = srlMCode;
    frm.action = "reqSet.hoon";
    frm.target = "winName";
    frm.submit();
}
</script>
</head>
<body>
	<div id=category>
		<jsp:include page="../category/submenuProduct.jsp"/>
	</div>

	<div id='body'><!--  상단타이틀  -->
		<div id='title'>생산 요청서</div><!--  헤더  -->
		<div class='head'>
			<div id='sign1'>
				<label>문서번호</label><br/>
				<label>${vo.dCode }</label>
			</div>
			<div id='sign2'>
				<div id='appro'>결&nbsp재&nbsp내&nbsp역</div> 
				<div id='writer'>${vo.eName }</div>
				<div id='appro1'>${vo.eName1 }</div>
				<div id='appro2'>${vo.eName2 }</div>
				
				<div id='stamp1'>
					<div id='status'>작성</div>
					<div id='app_date'>${vo.dDate }</div>
				</div>
				<div id='stamp2'>
					<div id='status'>승인</div>
					<div id='app_date'>${vo.dDate }</div>
				</div>
				<div id='stamp3'>
					<div id='status'>대기</div>
					<div id='app_date'>${vo.dDate }</div>
				</div>
			</div>
		</div>
	
		<div id='subject'> <!--  제목  -->
			<span id='labeltitle'><label>제목</label></span>
			<span id='subcontent'>	${vo.dName }</span>
		</div>
	
		<div id='content'> <!--  내용  -->
			<span id='labeltitle'><label>내용</label></span>
			<span id='concontent'>${vo.dCont }</span>
		</div>
	
		<div id='list_header'> <!--  생산요청목록 타이틀  -->
			요청 제품 리스트
		</div> 
	
		<div id='sale_list'><!--  생산요청목록  -->
			<div id='list_title'>
				<span id='code'>제품코드</span>
				<span id='codename'>제품명</span>
				<span id='ea'>요청 수량</span>
				<span id='deadline'>요청 기한일</span>
				<span id='set'>작업 설정</span>
			</div>
			<div id='list_content'>
			
			<%int cnt =0; %>
			
			<c:forEach items="${list }" var="workList">
			<%cnt++; %>
				<span id='code'>${workList.srlMCode }</span>
				<span id='codename'>${workList.pName }</span>
				<span id='ea'>${workList.srlEa }</span>
				<span id='deadline'>${workList.srlTerm }</span>
				<span id='set'>
					<c:choose>
						<c:when test="${workList.srlStatus == 0}">
							<div id='setOK<%=cnt %>' onclick="onSetting(${workList.srlCode }, ${workList.srlMCode })"><font color='yellow'>설정 필요</font></div>
						</c:when>
						<c:when test="${workList.srlStatus == 9}">
							<div id='setOK<%=cnt %>'><font color='green'>설정 완료</font></div>
						</c:when>
					</c:choose>
				</span>
			</c:forEach>
			</div>
		</div>
	</div>
	
	<form name='frm' method='post' id='fff'>
		<input type='hidden' name='srlCode'>
		<input type='hidden' name='srlMCode'>
	</form>
</body>
</html>