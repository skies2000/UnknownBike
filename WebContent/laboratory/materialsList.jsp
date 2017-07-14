<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>

<html>
	<head>
		<title>Page Title</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0">
	
<style>
        #columns{
            column-width: 250px;
            
            column-gap: 15px;
            
        }
        #columns figure{
            display: inline-block;
            border: 1px solid rgba(0, 0, 0, 0.2);
            margin: 0px;
            margin-bottom: 15px;
            padding: 10px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.5);
        }
        #columns figure img{
            width: 100%;
        }
        #columns figure figcaption{
            border-top: 1px solid rgba(0, 0, 0, 0.2);
            margin-top: 10px;
            padding: 11px;
        }
        </style>
</head>

<body>
    <h2>자재리스트</h2>
    <hr/>  
    <div id="columns">
    
    
    <c:forEach items="${list}" var="obj">
    <figure>
            <img src="images/khk_RAMBLE1image.jpg">
            <figcaption><span>자재명 : ${obj.mlmcode}</span><br/>
            <span>수량 : ${obj.mlmea}</span><br/></figcaption>
        </figure>
    </c:forEach>
    </div>
    <hr/>
    
    
</body>
</html> 