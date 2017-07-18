<%@page import="sung.VenderVo"%>
<%@page import="java.util.List"%>
<%@page import="org.json.simple.JSONArray"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart);
function drawChart() {
	<% List<VenderVo> list = (List<VenderVo>)request.getAttribute("list");
	%>
  var data = google.visualization.arrayToDataTable([
    ['거래처명', '거래량'],
    ['(주)뚝닥', <%=list.get(0).getvSum()%>],
    ['LoveBike', <%=list.get(1).getvSum()%>],
    ['B-Material', <%=list.get(2).getvSum()%>],
    ['대박기업(주)', <%=list.get(3).getvSum()%>],
    ['Wadda', <%=list.get(4).getvSum()%>],
    ['편한세상', <%=list.get(5).getvSum()%>],
    ['밝히리', <%=list.get(6).getvSum()%>],
    ['KKU-UK', <%=list.get(7).getvSum()%>],
    ['자전거사랑', <%=list.get(8).getvSum()%>]
  ]);
  var options = {
          title: '거래처별 거래량',
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }


</script>


</head>
<body>

	<div id=category style='margin-bottom: 100px'>
		<jsp:include page="../category/submenuSales.jsp"></jsp:include>
	</div>

	<div id='SalesResult'>
		 <div id="piechart_3d" style="width: 900px; height: 500px;"></div>
	</div>
</body>
</html>