
<%@page import="beanhoon.PurListVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript">
<%

%>
google.load("visualization","1",{packages:["corechart"]});
google.setOnLoadCallback(drawChart);
function drawChart(){
	var data = google.visualization.arrayToDataTable([
		['Year','1Line','2Line','3Line','4Line','5Line'],
		['17년1분기',1100,250,1250,1150,50],
		['17년2분기',1250,250,1300,1100,100],
		['17년3분기',1580,600,1500,1200,50],
		['17년4분기',1300,1000,1600,1500,200]
	]);

var options={
	title:'Company Performance'
};

var chart = new google.visualization.LineChart(document.getElementById('chart_div'));
chart.draw(data,options);
}
</script>
</head>
<style>
#headereff {
   width: 100%;
}

#titleeff {
   /* width: 20%; */
   font-size: 35px;
}

#searcheff1 {
 /*   margin-t;op:2%; */
 margin-bottom :2%;
   float: right;
}
#searcheff2 {
   text-align: right;
   margin-bottom: 10px;
}

#product_prn{
   width: 100%;
    margin: 0 auto;
    max-width: 1000px;
    height: 650px;
}
#eff_left1{
   width : 49%;
   height: 20%;
   float: left;
   text-align: center;
   
}
#eff_left2{
   border : 5px solid #A8A9A6;
   width : 49%;
   height: 78%;
   float: left;
}
#eff_right{
   border : 5px solid #A8A9A6;
   width : 49%;
   height: 98%;
   float: right;
}
#underlineeff{
   border-bottom: 1px solid #ffffff;
   height: 35px;
   margin-bottom: 3%;
}

#line1  {
   border-bottom: 1px solid #A8A9A6;
   padding-bottom: 5px;
   width: 100%;
   text-align: center;
}
#line2  {
   width: 100%;
   text-align: center;
}

.ppcode{width: 15%; font-size: 9pt; display: inline-block; }
.pname{width: 20%;font-size: 9pt;display: inline-block;}
.pdev{width: 15%;font-size: 9pt;display: inline-block;}
.pea{width: 7%;font-size: 9pt;display: inline-block;}
.pdate{width: 27%;font-size: 9pt;display: inline-block;}
.pqty{width: 10%;font-size: 9pt;display: inline-block;}

#line1{
   margin-top: 3%; 
   margin-bottom: 1%;
}

#title_left1, #title_right, #title_left2{
   font-size: 15pt;
   text-align: left;
   margin-left:2%;
   margin-top:2%;
}

div > span {
	display: inline-block;
} 


.line, .totalEa, .pdys, .peff{
display: inline-block;
	background-color: white;
	color:black;
	height:30px;
	text-align:center;
	box-sizing: border-box;
	}
	.line{
	width:22%;
	float:left;
	}
	.totalEa{
	 width:22%;
	 margin-left:2%;
	}
	.pdys{
	width: 22%;
	margin-left:1%;
	}
	.peff{
	width:22%;
	margin-left:1%;
	}
	
#lineeff {
  border-bottom: 1px solid #ffffff;
   height: 20px;
   margin-bottom: 3%;
}
#efr_title {
	margin-top : 30px;
	margin-left: 20px;
}

#efr_title1, #efr_title2, #efr_title3, #efr_title4, #efr_title5 {
	margin-top: 30px;
	margin-left: 20px;
} 
#chart_div{

width:420px;
height:570px;
box-sizing: border-box;
margin-left:6px;
margin-top:10px;
}
</style>
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
				<input type='text' name='pCode' /> 
				<input type='button' id='btnSearch' value='출력' />
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
				<div id='chart_div'></div>
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

<script type="text/javascript">start()</script>	

</body>
</html>