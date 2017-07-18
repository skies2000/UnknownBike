<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>Page Title</title>
		<meta charset="UTF-8">
		<meta name="viewport" content="initial-scale=1.0">
		
		<style>
            #docListMainDiv{
                text-align: center;
                width: 100%;
                background-color: #aaa;
                
            }
            #docListMainDiv * {
                font-size: 0;
                box-sizing: border-box;
                
            }
            #docListMainDiv span {
                font-size: 15px;
                display: inline-block;
                
            }
            #docListMainDiv #docTitle{
                background-color: #000;
                color: #fff;
                padding: 10px 0;
            }
            #docListMainDiv .docNum{
                width:10%;
            }
            #docListMainDiv .docCate{
                width:15%;
            }
            #docListMainDiv .docSubject{
                width:40%;
            }
            #docListMainDiv .docDate{
                width:15%;
            }
            #docListMainDiv .docWriter{
                width:10%;
            }
            #docListMainDiv .docState{
                width:10%;
            }
            #docListMainDiv div{
                margin-bottom: 5px;
            }
            #docListMainDiv .docList a:LINK{
            	color:yellow;
            }
            #docListMainDiv .docList a:VISITED{
            	color:yellow;
            }
            #docListMainDiv .docList a:HOVER{
            	color:maroon;
            }
        </style>
        <script>
        function myPageDocViewFunc(code){
        	location.href="myPageDocView.hwan?dcode="+code;
        }
        </script>
	</head>

	<body>
	<div id=category>
      <jsp:include page="../category/submenuMyPage.jsp"></jsp:include>
   </div>
	<div id="docListMainDiv">
        <div id="docTitle">
            <span class="docNum">문서번호</span>
            <span class="docCate">문서종류</span>
            <span class="docSubject">제목</span>
            <span class="docDate">작성일</span>
            <span class="docWriter">작성자</span>
            <span class="docState">상태</span>
        </div>
        
        
       <c:forEach items="${list}" var="obj" >
       	<div class="docList">
       	<span class="docNum">${obj.dcode}</span>
            <span class="docCate">${obj.dcateName}</span>
            <a href=# onclick="myPageDocViewFunc('${obj.dcode}')">
            	<span class="docSubject">${obj.dname}</span>
            </a>
            <span class="docDate">${obj.ddate}</span>
            <span class="docWriter">${obj.ename}</span>
            <span class="docState">${obj.dstatudName}</span>
       	</div>
       
       </c:forEach>
       

        
        
        
        
	</div>
	</body>
</html>