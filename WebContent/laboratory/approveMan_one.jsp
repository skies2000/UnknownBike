<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<html>
   <head>
      <title>Page Title</title>
      <meta charset="UTF-8">
      <meta name="viewport" content="initial-scale=1.0">
      <script>
      function tttest(obj){
    	  
      }
      </script>
   </head>
	
   <body>
결재승인자
<script>
tttest('${obj}');
</script>
<c:forEach var='ob' items='${obj}' >
	<div>${ob.ecode}</div>
	<div>${ob.ename}</div>
</c:forEach>
   </body>
</html>