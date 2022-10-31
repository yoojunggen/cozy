<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>멤버리스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script>
	function delete_check(url){
	var answer;
	answer = confirm("회원 정보를 삭제하시겠습니까?");
	if(answer == true){
	location = url;
	}
  }
  </script>
  <style>
 .search_bar { border: 0;
      		   background-color: #F5F5F5;      		
      		   border-radius: 10px;
      		   -webkit-appearance: none;
      		   -moz-appearance: none;
      		   -ms-appearance: none;
      		   -o-appearance: none;
      		   appearance: none;
      		   text-align: left;
      		   width: 100%;
      		   height: 32px;    
       	 	 }
       	 	 
 #search-button { float:right;
 				  margin-right:30px; 
 				  margin-top: -10px;
 				  margin-bottom: 10px
 				}
 				
 .form-group 	{ float:right; 
 				  margin-top: -10px;
 				  margin-bottom: 10px
 				}
 				
 th {font-size: 19px;}
 
 
@media (max-width: 600px) {
  .adress {
    display: none;
  }
  .form-group 	{  
  margin-top: 10px;
  	}
  #search-button {
  margin-top: 10px;
  	}
  }

 					
  </style>
  
  
 
</head>

<body>
<ul class="nav nav-tabs">
    <li class="active"><a data-toggle="tab" href="#userList">회원 리스트</a></li>
    <li><a data-toggle="tab" href="#update">장바구니 리스트</a></li>
    <li><a data-toggle="tab" href="#menu3">결제내역</a></li>
    <li><a data-toggle="tab" href="#menu3">회원탈퇴</a></li>
  </ul>
 <div class="tab-content">
  </br></br>
  <div id="userList" class="tab-pane fade in active"><!-- 1탭 -->
  <h2>회원 관리</h2>
  <h4>정보 수정 및 삭제시 한번더 확인 바랍니다.</h4>
  <div>조회된 회원 수 : </div>

	</br>

  <table class="table table-striped">
    <thead>
      <tr>
        <th>아이디</th>
        <th>이름</th>
        <th>전화번호</th>
        <th class="adress">주소</th>
        <th></th>
      </tr>
    </thead>
	<tbody>
   	<c:forEach var = "e" items = "${userList}">
     <tr>
        <td>
		${e.uid}
		</td>
        <td>${e.uname}</td>
        <td>${e.uphone}</td>
        <td class="adress">${e.postcode}&nbsp;&nbsp;${e.roadaddr}<br>${e.detailaddr}${e.extraaddr}</td>
        <td style="white-space: nowrap;"><button type="button">수정</button> 
        <button type="button">삭제</button></td>
        </tr>
		</c:forEach>
    	</tbody>
    </table>
  </div>
  </br></br>
  <div id="update" class="tab-pane fade"> <!-- 2탭 -->
  <p>ㅋㅋ</p>   
  </div>
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>
