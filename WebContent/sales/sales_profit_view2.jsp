<%@page import="sung.ProductVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {
    	  <% List<ProductVo> list = (List<ProductVo>)request.getAttribute("list");
    		%>
        var data = google.visualization.arrayToDataTable([
          ['Year', 'Sales'],
          ['2013',   <%=list.get(0).getTotal()%>],
          ['2014',   <%=list.get(1).getTotal()%>],
          ['2015',  <%=list.get(2).getTotal()%>],
          ['2016',   <%=list.get(3).getTotal()%>],
          ['2017',  <%=list.get(4).getTotal()%>]
        ]);

        var options = {
          title: '최근 5개년 총 판매액',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('curve_chart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
  <div id=category style='margin-bottom: 100px'>
		<jsp:include page="../category/submenuSales.jsp"></jsp:include>
	</div>
	  <div id="curve_chart" style="width: 900px; height: 500px"></div>
  </body>
</html>