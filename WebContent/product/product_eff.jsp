<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="beanhoon.PurListVo"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>생산 효율 관리</title>
<link rel='stylesheet' href='../category/product_eff.css' />
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load("current", {packages:['corechart']});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "생산량", { role: "style" } ],
        ["1분기", ${v1.qnsrl1 }, "#b87333"],
        ["2분기", ${v2.qnsrl2 }, "silver"],
        ["3분기", ${v3.qnsrl3 }, "gold"],
        ["4분기", ${v4.qnsrl4 }, "color: #e5e4e2"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "분기별 총 생산량 집계",
        width: 432,
        height: 592,
        bar: {groupWidth: "80%"},
        legend: { position: "none" },
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);
  }
</script>
</head>

<script type="text/javascript">
function start() {
	var btnS = document.getElementById("btnSearch");
	btnS.onclick = function () {
		var frm = document.getElementById("frmid");
		var frm1 = document.frmname;
		var test = frm.pCode.value;
		var test1 = frm.workStartDate.value;
		var test2 = frm.workEndDate.value;
		
		frm1.action = 'eff.hoon';
		frm1.submit();
	}
}
</script>

<body>
<div id=category>
	<jsp:include page="../category/submenuProduct.jsp"></jsp:include>
</div>

<div id=content_eff>
	<div id='headereff'>
		<span id="titleeff"> 생산효율조회 </span>
		<form name='frmname' id='frmid' method='post'>
			<div id='searcheff2'>
				<span>검색어</span> 
				<input type='text' id='ttt' name='pCode'>
				<input type='button' id='btnSearch' value='출력'>
			</div>
			<div id='searcheff1'>
				<span>조회기간</span> 
				<input type='date' id='workStartDate' name='workStartDate' /> ~ 
				<input type='date' id='workEndDate' name='workEndDate' /> 
			</div>
		</form>
		
		<div id='underlineeff'></div>   
   
		<div id= product_prn>
			<div id='eff_left1'>
				<div id='title_left1'>제품</div>
				<div id='line1'>
					<span class='ppcode'>자재코드</span>
					<span class='pname'>자재명</span>
					<span class='pdev'>개발자</span>
					<span class='pea'>재고</span>
					<span class='pdate'>등록일</span>
					<span class='pqty'>총생산</span>
				</div>
				<% String pd ="";
				if(request.getAttribute("voa") != null) {
					PurListVo aa = (PurListVo) request.getAttribute("voa");
					pd = aa.getpDate().substring(0,10);
				}
				%>
	            
				<div id='line2'>
					<span class='ppcode'>${voa.pCode }</span>
					<span class='pname'>${voa.pName }</span>
					<span class='pdev'>${voa.pDev }</span>
					<span class='pea'>${voa.pEa }</span>
					<span class='pdate'><%=pd %></span>
					<span class='pqty'>${voa.totalEa }</span>
				</div>
			</div>
			<div id='eff_right'>
				<div id='title_right'>기간</div>
				<div id='columnchart_values'></div>
			</div>
	
			<div id='eff_left2'>
				<div id='title_left2'>라인</div>
				<div id='efr_title'>
					<span class='line'>라인</span>
					<span class='totalEa'>총생산량</span>
					<span class='pdys'>불량률</span>
					<span class='peff'>평균효율</span>
				</div>
				<div id='lineeff'></div>
	             
				<div id='efr_title1'>
					<span class='line'>라인1</span>
					<span class='totalEa'>${vo1.totalEa }</span>
					<span class='pdys'>${vo1.dys }</span>
					<span class='peff'>${vo1.totaleff }</span>
				</div>
				<div id='efr_title2'>
					<span class='line'>라인2</span>
					<span class='totalEa'>${vo2.totalEa }</span>
					<span class='pdys'>${vo2.dys }</span>
					<span class='peff'>${vo2.totaleff }</span>
				</div>
				<div id='efr_title3'>
					<span class='line'>라인3</span>
					<span class='totalEa'>${vo3.totalEa }</span>
					<span class='pdys'>${vo3.dys }</span>
					<span class='peff'>${vo3.totaleff }</span>
				</div>
				<div id='efr_title4'>
					<span class='line'>라인4</span>
					<span class='totalEa'>${vo4.totalEa }</span>
					<span class='pdys'>${vo4.dys }</span>
					<span class='peff'>${vo4.totaleff }</span>
				</div>
				<div id='efr_title5'>
					<span class='line'>라인5</span>
					<span class='totalEa'>${vo5.totalEa }</span>
					<span class='pdys'>${vo5.dys }</span>
					<span class='peff'>${vo5.totaleff }</span>
				</div>
	            
			</div>
		</div>
	</div>
</div>

<form id='qnsrl' method='post'>
	<input type='hidden' name='qnsrl1'>
	<input type='hidden' name='qnsrl2'>
	<input type='hidden' name='qnsrl3'>
	<input type='hidden' name='qnsrl4'>
</form>

<script type="text/javascript">start()</script>	

</body>
</html>