 <%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>멤버리스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
 
    
  <style>
 .search_bar { border: 0;    
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
               
 div.search_bar{ text-align:center;             
 }
               
 #search-button { float:right;
               margin-right:30px; 
               margin-top: -10px;
               margin-bottom: 10px
             }
div#count{margin:30px 30px;}
             
 .form-group    { float:right; 
               margin-top: -10px;
               margin-bottom: 10px
             }
div#pageBox{ text-align:center;}             
            
div#p{margin:0px 30px;}             
.table {
  border: 1px #ff8000 solid;
  font-size: 18px;
  box-shadow: 0 2px 5px rgba(0,0,0,.25);
  width: 100%;
  border-collapse: collapse;
  border-radius: 5px;
  overflow: hidden;
}

th {
  text-align: left;
}
  
thead {
  font-weight: bold;
  color: #fff;
  background: #fcaa06;
}
  
 td, th {
  padding: 5px;
  vertical-align: middle;
  border: 1px solid rgba(0,0,0,.2);
}
  
 td {
  border-bottom: 1px solid rgba(0,0,0,.1);
  background: #fff;
}

.pl{
    width: 100px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 4px;
    padding: 5px 5px;
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}

 .btn.btn-default{margin:0px 5px;}
 #userCount2{font-size:30px;}
                
  </style>

  

</head><body>
  <div id="count">
  <h2>회원 관리</h2>

  <div id="userCount2">조회된 회원 수 : <span id="userCount"></span></div>
  </div>
   <!-- List -->
  <div id="p">
  <table id="table" class="table table-striped">   
  </table>
  </div>
   <!-- search -->  
  <div class="search_bar">
        <select id="search1" class="pl" name="ch1">
              <option value="uid">아이디</option>
            <option value="uname">이름</option>
            <option value="roadaddr">주소</option>
         </select>   
   <input id="search2" type="text" name="ch2" onkeyup="enterkey()">
   <input id="searchButton" class="btn btn-default" type="button" value="검색하기" onclick="test1()">   
   </div>
   
   <!-- paging -->

   <div id="pageBox">   
   <ul class="pagination">
   </ul>   
   </div>   
   
    <script>    
function delete_check(url){
   if(url==="/aduserDelete/admin"){
      alert("관리자는 삭제할 수 없습니다");
      return false;
   } 
   var answer;
   answer = confirm("회원 정보를 삭제하시겠습니까?");
   if(answer == true){
   location = url;
   }
  };

  $( document ).ready(function() {
    var a = "default";
     var b = "default";
     
    userListPage(1,a,b);
     
  });     
  
  function enterkey() {
      if (window.event.keyCode == 13) {
          // 엔터키가 눌렸을 때
          test1();
       }
   }
  
  function getToday(a){
       var date = new Date(a);
       var year = date.getFullYear();
       var month = ("0" + (1 + date.getMonth())).slice(-2);
       var day = ("0" + date.getDate()).slice(-2);

       return year + "년" + month + "월" + day + "일";
   }
  
  
  
function userListPage(pageNum, ch1, ch2) {
   var ch1 = "'" + ch1 + "'";
   var ch2 = "'" + ch2 + "'";
   
   
   var curpage = pageNum;
   console.log("hi");
      $.ajax({
         url : '/userList/{page}/{ch1}/{ch2}',
         type : 'GET',
         data : {
            'page' : pageNum,
            'ch1' : ch1,
              'ch2' : ch2
        },
         dataType:"json",
         success : function(data) {
            var a = '';
            var b = '<table id="table" class="table table-striped"></table>';
            var c = '';
            var d = '<ul class="pagination"></ul>';
            var page = data.page;
            var startpage = data.startpage;
            var endpage = data.endpage;
            var userList = data.userList;
            var maxpage = data.maxpage;
            var limit = data.limit;            
            
            var nextpage = endpage + 1;
            console.log(userList);
            
            
            console.log("data : " + userList);
            console.log(userList);
            console.log(page + "," + startpage + "," + endpage);
            console.log("start : " + startpage);
            console.log("end : " + endpage);
            console.log("max : " + maxpage);
                        
            a += '<thead>';
            a += '<tr><th>아이디</th><th>이름</th><th>전화번호</th><th>가입일자</th>';
            a += '<th>주소</th><th></th></tr>';
            a += '</thead>';
            a += '<tbody>';     
            
            $.each(userList, function(key, value) {
               
               a += '<tr>';
               a += '<td style="width:200px">'+value.uid+'</td><td style="width:200px">'+value.uname+'</td><td style="width:200px">'+value.uphone+'</td><td style="width:200px">'+getToday(value.udate)+'</td>';
               a += '<td class="adress">'+value.postcode+'&nbsp;&nbsp;'+value.roadaddr+'&nbsp;&nbsp;'+value.detailaddr+value.extraaddr+'</td>';
               a += '<td style="width:150px"><button type="button" class="btn btn-default"' +  ' onclick="' + "location.href='/adupdateForm/"+ value.uid + "'" + '">수정</button>';
               a += '<button id="del" type="button" class="btn btn-default" onclick="delete_check(' + "'/aduserDelete/" + value.uid + "')"+'">삭제</button></td>';
               a += '</tr>';
                              
            }); 
            a += '</tbody>';
         
          //맨 첫 페이지
           if (curpage > 1 && limit < curpage) {
               c += '<li id=""><a id="fisrtPage" onclick="userListPage(1,'+ch1+','+ch2+')">&lt;&lt;</a></li>';
           }
         if (curpage > limit) {
             c += '<li id=""><a id="fisrtPage" onclick="userListPage('+ (startpage == 1 ? 1 : startpage - 1) +','+ch1+','+ch2+')">&lt;</a></li>';
         }      
         /*
         
         페이지구간 = (curpage - 1) // 5 
         페이지구간이 0 일 때 왼쪽 큰 화살표 비활성화
         페이지구간이 endpage
         */         
         for (var num = startpage; num <= endpage; num++) {
             if (num == curpage) {                
                 c += '<li><a href="#" class="numberPage"><strong>' + num + '</strong></a></li>';
             } else {
                 c += '<li><a onclick="userListPage(' + num + ','+ch1+','+ch2+')" class="numberPage">' + num + '</a></li>';
             }
         }
             //다음 페이지
           if (nextpage <= maxpage) {
              c += '<li><a id="lastPage" onclick="userListPage('+ (nextpage < maxpage ? nextpage : maxpage) +','+ch1+','+ch2+')">&gt;</a></li>';                   
           }
           //맨 마지막 페이지
           if (curpage < maxpage && nextpage < maxpage) {
              c += '<li><a id="lastPage" onclick="userListPage('+ maxpage +','+ch1+','+ch2+')">&gt;&gt;</a></li>';
           }
           
            //리스트 업데이트            
            $("#table").remove();
            $("#p").append(b);
            $("#table").append(a);
            
            //페이징 바꾸기
            $(".pagination").remove();
            $("#pageBox").append(d);
            $(".pagination").append(c);
            
            //조회된 회원수
            var ListCount = '<span id="userCount">'+data.ListCount+'명</span>';
            
            $('#userCount').remove();
            $('#userCount2').append(ListCount);
            
       }
    });
 }

 
function test1() {
   var search1 = $('#search1').val();
   var search2 = $('#search2').val();
   
   userListPage(1, search1, search2);
   $('#search2').val("");
}

</script>
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>