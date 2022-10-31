<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page import="java.util.*" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>멤버리스트</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
  
  
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
  


<style>
div.row{margin:30px 10px;}
div.col-md-6{margin:10px 0px;}

div.col-xl-3.col-md-3.mb-3{
	border: 5px #000000 solid;
	font-size:30px;
	border-radius:15px;
}

div.cardValue{
	font-size:30px;
}
div.panel{border: 1px solid rgb(0 0 0 / 10%);}
.panel{box-shadow: 0 3px 3px rgb(0 0 0 / 50%);}
.pl{
    width: 150px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 4px;
    padding: 5px 5px;
    font-style: normal;
    font-weight: 400;
    font-size: 14px;
    line-height: 16px;
}
</style>
</head>
<body>
<div class="row">
      <div class="col-lg-3 col-md-6">
        <div class="panel">
          <div class="panel-heading">
            <div class="row">
              <div class="col-xs-3">
                <i class="fa fa-male fa-5x"></i>
              </div>
              <div class="col-xs-9 text-right">
              	<div>오늘의 가입자</div>
                <div class="huge"><div id="userToday2" class="cardValue"><span id="userToday"></span></div></div>
              </div>
            </div>
          </div>
          <a href="/userList">
            <div class="panel-footer">
              <span class="pull-left">회원관리</span>
              <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
              <div class="clearfix"></div>
            </div>
          </a>
        </div>
      </div>
      
      
      <div class="col-lg-3 col-md-6">
        <div class="panel">
          <div class="panel-heading">
            <div class="row">
              <div class="col-xs-3">
                <i class="fa fa-krw fa-5x"></i>
              </div>
              <div class="col-xs-9 text-right">
             	 <div>매출액</div>
               	 <div class="huge"><div id="totalToday2" class="cardValue"><span id="totalToday"></span></div></div>
                
              </div>
            </div>
          </div>
          <a href="/pay/admin/list">
            <div class="panel-footer">
              <span class="pull-left">결제관리</span>
              <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
              <div class="clearfix"></div>
            </div>
          </a>
        </div>
      </div>
      
      
      <div class="col-lg-3 col-md-6">
        <div class="panel">
          <div class="panel-heading">
            <div class="row">
              <div class="col-xs-3">
                <i class="fa fa-shopping-cart fa-5x"></i>
              </div>
              <div class="col-xs-9 text-right">
             	 <div>주문건수</div>
               	 <div class="huge"><div id="orderCount2" class="cardValue"><span id="orderCount"></span></div></div>
                
              </div>
            </div>
          </div>
          <a href="/pay/admin/list">
            <div class="panel-footer">
              <span class="pull-left">주문관리</span>
              <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
              <div class="clearfix"></div>
            </div>
          </a>
        </div>
      </div>
      
      
      <div class="col-lg-3 col-md-6">
        <div class="panel">
          <div class="panel-heading">
            <div class="row">
              <div class="col-xs-3">
                <i class="fa fa-paw fa-5x"></i>
              </div>
              <div class="col-xs-9 text-right">
              	<div>오늘 등록된 상품</div>
                <div class="huge"><div id="productCount2" class="cardValue"><span id="productCount"></span></div></div>
                
              </div>
            </div>
          </div>
          <a href="#">
            <div class="panel-footer">
              <span class="pull-left">상품관리</span>
              <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
              <div class="clearfix"></div>
            </div>
          </a>
        </div>
      </div>
      
</div>
    
<div class="row">
<div class="col-md-6">
	<div class="panel panel-default">
          <div class="panel-heading">
            <i class="fa fa-bar-chart-o fa-fw"></i> 월별 매출 통계
         	 	<div style="float:right">
				<select id="year2" class="pl" onchange="selectYear()">
				<option value="2022">2022년</option>
				<option value="2021">2021년</option>
				<option value="2020">2020년</option>
				<option value="2019">2019년</option>
				<option value="2018">2018년</option>
				</select>
				</div>
				
				<canvas id="Bar" width="530" height="400"></canvas>
								
			</div>
		</div>
	</div>



	<div class="col-md-6">
  		<div class="panel panel-default">
          <div class="panel-heading">
            <i class="fa fa-line-chart fa-fw"></i> 분류별 상품 판매갯수
				<div style="float:right">
				<select id="year" class="pl" onchange="selectCategory()">
				<option value="2022">2022년</option>
				<option value="2021">2021년</option>
				<option value="2020">2020년</option>
				<option value="2019">2019년</option>
				<option value="2018">2018년</option>
				</select>
				<label> &nbsp;&nbsp;&nbsp;&nbsp;카테고리 : </label>
				<select id="category" class="pl" onchange="selectCategory()">
				<option>사료</option>
				<option>간식</option>
				<option>건강식품</option>
				<option>위생용품</option>
				<option>생활용품</option>
				</select>
				</div>
				<canvas id="Bar2" width="530" height="400"></canvas>

		</div>
		</div>
	</div>	
</div>
<script>
$( document ).ready(function() {	  
	selectYear();
});

var myBarChart;
var ctx = document.getElementById("Bar").getContext('2d');    

function destroy1(){
	if (myBarChart !== undefined) {
		myBarChart.destroy();
	  }
}

function selectYear(){
var year = $('#year2').val();
console.log(category);

destroy1()

$.ajax({
    url: "/selectYear/{year}",
    type: "GET",
    data : {
        'year' : year,
    },
     dataType:"json",
     success : function(data) { 
    	 
       var yearList = data.yearList;
       console.log(yearList);
       
       let yearMonthList;		
       yearMonthList = yearList.split(",");
       console.log(yearMonthList);
        
                                       
       myBarChart = new Chart(ctx, {
           type: 'bar',
           data: {
               labels: [
                   "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
                   
               ],
               datasets: [
                   {
                       label: '월별 매출',
                       data: yearMonthList,
                       backgroundColor: [
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)',
                           'rgba(255, 99, 132, 0.2)'
                          
                       ],
                       borderColor: [
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)',
                           'rgba(255,99,132,1)'
                           
                       ],
                       borderWidth: 1
                   }
               ]
           },
           options: {
               animation: {
                   animateScale: true
               },
               responsive: true,
               scales: {
                   yAxes: [
                       {
                           ticks: {
                               beginAtZero: true                                                                    
                           }
                       }
                   ]
               }
           }
       });      
   }    
});
}
</script>
<script>
$( document ).ready(function() {	  
	selectCategory();
});

var myChart;
var chartArea = document.getElementById("Bar2").getContext('2d');    

function destroy2(){
if (myChart !== undefined) {
	myChart.destroy();
  }
}

function selectCategory(){
var category = $('#category').val();
var year = $('#year').val();

destroy2()

$.ajax({
    url: "/selectCategory/{category}/{year}",
    type: "GET",
    data : {
        'category' : category,
        'year' : year,
    },
     dataType:"json",
     success : function(data) {
        
        var catMonth = data.catMonth;
        var dogMonth = data.dogMonth;
        var otherMonth = data.otherMonth;

       let catMonthList;
       let dogMonthList;
       let otherMonthList;
       catMonthList = catMonth.split(",");
       dogMonthList = dogMonth.split(",");
       otherMonthList = otherMonth.split(",");
        
       // 수신한 json 타입 데이터를 이용하여 차트를 새로 그린다. 
        myChart = new Chart(chartArea, {   
              // ①차트의 종류(String) u 
              type: 'line',
              // ②차트의 데이터(Object)
              data: {
                  // ③x축에 들어갈 이름들(Array)
                  labels: [
                      "1월","2월","3월","4월","5월","6월","7월","8월","9월","10월","11월","12월"
                      
                      ],
                  // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                  datasets: [{
                      // ⑤dataset의 이지름(String)
                      label: '# 강아지',
                      // ⑥dataset값(Array)
                      data: dogMonthList,
                      // ⑦dataset의 배경색(rgba값을 String으로 표현)
                      backgroundColor: "rgba(255,255,255,0.1)",
                      borderColor: "#CC99FF"
                  },
                  {
                      // ⑤dataset의 이지름(String)
                      label: '# 고양이',
                      // ⑥dataset값(Array)
                      data: catMonthList,
                      // ⑦dataset의 배경색(rgba값을 String으로 표현)
                      backgroundColor: "rgba(255,255,255,0.1)",
                      borderColor: "#FF99FF"
                  },
                  {
                      // ⑤dataset의 이지름(String)
                      label: '# 다른 친구들',
                      // ⑥dataset값(Array)
                      data: otherMonthList,
                      // ⑦dataset의 배경색(rgba값을 String으로 표현)
                      backgroundColor: "rgba(255,255,255,0.1)",
                      borderColor: "#99CCFF"
                  }                  
                  ]
              },
              // ⑩차트의 설정(Object)
              options : {
            	  responsive: true,
                  scales: {
                    yAxes: [{
                    	ticks: {
                            beginAtZero: true                                                                    
                        },
                      scaleLabel: {
                        display: false,
                        labelString: '판매갯수'
                      }
                    }]
                  }
                }   
          });
       var join = '<span id="userToday">'+data.joinToday+'명</span>';       
       $('#userToday').remove();       
       $('#userToday2').append(join);
       
       var totalToday = data.totalToday.toLocaleString();
       var total = '<span id="totalToday">'+totalToday+'원</span>';
       $('#totalToday').remove();
       $('#totalToday2').append(total);
       
       var orderCount = '<span id="orderCount">'+data.orderCount+'건</span>';
       $('#orderCount').remove();
       $('#orderCount2').append(orderCount);
       
       var productCount = '<span id="productCount">'+data.productCount+'개</span>';
       $('#productCount').remove();
       $('#productCount2').append(productCount);
   }    
});
}

</script>
  
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>