<%@page import="sung.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
    	  <%
    	  List<ProductVo> list = (List<ProductVo>)request.getAttribute("list");
    	  %>
    	  
        var data = google.visualization.arrayToDataTable([
         ['사원명',   '외발',   '두발',      '세발',   '네발', '하이브리드'],
         ['성은영',  <%=list.get(0).getTotal()%>, <%=list.get(1).getTotal()%>,<%=list.get(2).getTotal()%>,<%=list.get(3).getTotal()%>,<%=list.get(4).getTotal()%>],
         ['은영성', <%=list.get(5).getTotal()%>, <%=list.get(6).getTotal()%>,<%=list.get(7).getTotal()%>,<%=list.get(8).getTotal()%>,<%=list.get(9).getTotal()%>],
         ['김지원',  <%=list.get(10).getTotal()%>, <%=list.get(11).getTotal()%>,<%=list.get(12).getTotal()%>,<%=list.get(13).getTotal()%>,<%=list.get(14).getTotal()%>],
         ['허경환',  <%=list.get(15).getTotal()%>, <%=list.get(16).getTotal()%>,<%=list.get(17).getTotal()%>,<%=list.get(18).getTotal()%>,<%=list.get(19).getTotal()%>],
         ['지이디',  <%=list.get(20).getTotal()%>, <%=list.get(21).getTotal()%>,<%=list.get(22).getTotal()%>,<%=list.get(23).getTotal()%>,<%=list.get(24).getTotal()%>]
      ]);

    var options = {
      title : '사원별 제품 판매량',
      vAxis: {title: '판매량'},
      hAxis: {title: '사원명'},
      seriesType: 'bars',
      series: {5: {type: 'line'}}
    };

    var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
    </script>

</head>
<body>

	<div id=category style='margin-bottom: 100px'>
		<jsp:include page="../category/submenuSales.jsp"></jsp:include>
	</div>
	
	<div id='SalesResult'>
	   <div id="chart_div" style="width: 900px; height: 500px; "></div>
	</div>


</body>
</html>