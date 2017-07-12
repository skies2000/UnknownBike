<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>


#headereff {
   width: 100%;
}

#titleeff {
   width: 20%;
   font-size: 35px;
}

#searcheff1 {
   margin-top:2%;
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
   height: 20px;
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

.pcode{width: 15%; font-size: 9pt; display: inline-block; }
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
}

</style>


<body>
<form name='frm' method='post'>
   <div id=category>
      <jsp:include page="../category/submenuProduct.jsp"></jsp:include>
   </div>

   <div id=content_eff>
      
         <div id='headereff'>
            <span id="titleeff"> 생산효율조회 </span>
            <span id='searcheff1'>
               <span>조회기간</span> 
               <input type='date' id='startDate' name='startDate' /> ~ 
               <input type='date' id='endDate' name='endDate' /> 
            </span>
            <div id='searcheff2'>
               <span>검색어</span> <input type='text' name='product' /> 
               <input type='button' id='btnSearch'value='제품검색' /> 
               <input type='button' id='btnSearch' value='출력' />
         </div>
      <div id='underlineeff'></div>   
   
      <div id= product_prn>
         
         <div id='eff_left1'>
            <div id='title_left1'>제품</div>
            <div id='line1'>
               <span class='pcode'>자재코드</span>
                <span class='pname'>자재명</span>
                <span class='pdev'>개발자</span>
                <span class='pea'>재고</span>
                <span class='pdate'>등록일</span>
                <span class='pqty'>총생산</span>
            </div>
            <div id='line2'>
               <span class='pcode'>자재코드</span>
                <span class='pname'>자재명</span>
                <span class='pdev'>개발자</span>
                <span class='pea'>재고</span>
                <span class='pdate'>등록일</span>
                <span class='pqty'>총생산</span>
            </div>
         </div>
         <div id='eff_right'>
            <div id='title_right'>기간</div>
         </div>
         <div id='eff_left2'>
            <div id='title_left2'>라인</div>
         </div>
      </div>
   
   </div>
         
         
      
      
      
      
   </div>
</form>
</body>
</html>