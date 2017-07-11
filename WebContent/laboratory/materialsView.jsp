<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
    <title>Page Title</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="initial-scale=1.0">
    <style>
        #maViewDiv {
            width: 60%;
            margin: auto;
        }

        #maViewDiv table{
            border: 1px solid #aaa;
            border-spacing: 0px;
        }
        #maViewDiv table td{
            border: 1px solid #aaa;
             
        }
     /*    #mViewDiv td span{
        	text-align: center;
        	display: inline-block;
        	margin-left: auto;
        	margin-right: auto;
        } */
        

    </style>
</head>

<body>
   <div id="maViewDiv">
       
   
    <div id="maView">자재뷰</div>
    <hr/>

    <form>
        <div>
            <img src="../images/purchaseimg/${vo.mimage}" width="300px" height="200px">
            <table>
            <tr>
                <td><span>작성자</span></td>
                <td>자재명</td>
                <td>결재승인자</td>
            </tr>
            <tr>
                <td>${vo.mdev}</td>
                <td>${vo.mname}</td>
                <td>유재석</td>
            </tr>
            
            <tr>
                <td>단가</td>
                <td>자재종류</td>
                <td>결재승인자2</td>
            </tr>
            <tr>
                <td>${vo.mprice}</td>
                <td>${vo.mcate}</td>
                <td>강호동</td>
            </tr>
            <tr>
                <td colspan="2">작성일</td>
               <td>결재승인상태</td>
            </tr>
            <tr>
                <td colspan="2">${vo.mdate}</td>
                <td>${vo.mstate}</td>
            </tr>
        </table>
            
        </div>
    </form>
    </div>
</body>

</html>
