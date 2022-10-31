<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<style>
.listToChange img {width:120px; height:120px; border-radius: 15%}
th {text-align: auto;}
td {text-align : left; align-items: center;}
.count-wrap {position: relative;padding: 0 38px;border: 1px solid #ddd;overflow: hidden; width: 130px;}
.count-wrap > button {border: 0; background: #ddd; color: #000; width: 38px; height: 38px; position: absolute; top: 0; font-size: 12px;}
.count-wrap > button.plus {right: 0;}
.count-wrap > button.minus {left: 0;}
.count-wrap .inp {border: 0; height: 38px; text-align: center; display: block; width: 100%;}
.clear{clear:both;}
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src='http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.5/jquery-ui.min.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container {
  margin-top:30px;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Source Sans Pro';
  
}

.fancyTab {
	text-align: center;
  padding:15px 0;
  background-color: #eee;
	box-shadow: 0 0 0 1px #ddd;
	top:15px;	
  transition: top .2s;
}


.fancyTab.active {
  top:0;
  transition:top .2s;
}

.whiteBlock {
  display:none;
}

.fancyTab.active .whiteBlock {
  display:block;
  height:2px;
  bottom:-2px;
  background-color:#fff;
  width:99%;
  position:absolute;
  z-index:1;
}

.fancyTab a {
  font-family: 'Source Sans Pro';
  color:#333;
}

/*.fancyTab .hidden-xs {
  white-space:nowrap;
}*/

.fancyTabs {
  border-bottom:2px solid #ddd;
  margin: 15px 0 0;
  display : flex;
}

li.fancyTab a {
  padding-top: 15px;
  top:-15px;
  padding-bottom:0;
}

li.fancyTab.active a {
  padding-top: inherit;
}

.fancyTab .fa {
  font-size: 40px;
	width:100%;
	padding: 15px 0 5px;
  color:#666;
}

.fancyTab.active .fa {
  color: #cfb87c;
}

.fancyTab a:focus {
	outline:none;
}

.fancyTabContent {
  border-color: transparent;
  box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
  padding: 30px 15px 15px;
  position:relative;
  background-color:#fff;
}

.nav-tabs > li.fancyTab.active > a, 
.nav-tabs > li.fancyTab.active > a:focus,
.nav-tabs > li.fancyTab.active > a:hover {
	border-width:0;
}

.nav-tabs > li.fancyTab:hover {
	background-color:#f9f9f9;
	box-shadow: 0 0 0 1px #ddd;
}

.nav-tabs > li.fancyTab.active:hover {
  background-color:#fff;
  box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
}

.nav-tabs > li.fancyTab:hover a {
	border-color:transparent;
}

.nav.nav-tabs .fancyTab a[data-toggle="tab"] {
  background-color:transparent;
  border-bottom:0;
}

.nav-tabs > li.fancyTab:hover a {
  border-right: 1px solid transparent;
}

.nav-tabs > li.fancyTab > a {
	margin-right:0;
	border-top:0;
  padding-bottom: 30px;
  margin-bottom: -30px;
}

.nav-tabs > li.fancyTab {
	margin-right:0;
	margin-bottom:0;
}

.nav-tabs > li.fancyTab:last-child a {
  border-right: 1px solid transparent;
}

.nav-tabs > li.fancyTab.active:last-child {
  border-right: 0px solid #ddd;
	box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
}

.fancyTab:last-child {
  box-shadow: 0 0 0 1px #ddd;
}

.tabs .nav-tabs li.fancyTab.active a {
	box-shadow:none;
  top:0;
}


.fancyTab.active {
  background: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
  padding-bottom:30px;
}

.arrow-down {
	display:none;
  width: 0;
  height: 0;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-top: 22px solid #ddd;
  position: absolute;
  top: -1px;
  left: calc(50% - 20px);
}

.arrow-down-inner {
  width: 0;
  height: 0;
  border-left: 18px solid transparent;
  border-right: 18px solid transparent;
  border-top: 12px solid #fff;
  position: absolute;
  top: -22px;
  left: -18px;
}

.fancyTab.active .arrow-down {
  display: block;
}

@media (max-width: 1200px) {
  
  .fancyTab .fa {
  	font-size: 36px;
  }
  
  .fancyTab .hidden-xs {
    font-size:22px;
	}
		
}
	
	
@media (max-width: 992px) {
    
  .fancyTab .fa {
  	font-size: 33px;
  }
    
  .fancyTab .hidden-xs {
  	font-size:18px;
    font-weight:normal;
  }
		
}
	
	
@media (max-width: 768px) {
  ul.nav.nav-tabs.fancyTabs{
  	display : none;
  } 
   
  .fancyTab > a {
    font-size:18px;
  }
    
  .nav > li.fancyTab > a {
    padding:15px 0;
    margin-bottom:inherit;
  }
    
  .fancyTab .fa {
    font-size:30px;
  }
    
  .nav-tabs > li.fancyTab > a {
    border-right:1px solid transparent;
    padding-bottom:0;
  }
    
  .fancyTab.active .fa {
    color: #333;
	}
		
}
</style>
</head>
<body>

<div class="container"> 
<section id="fancyTabWidget" class="tabs t-tabs">
        <ul class="nav nav-tabs fancyTabs" role="tablist">
        			
        			<c:choose>
					<c:when test="${ sessionScope.uid ne null }">
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>	
                        <a href="/myInfo"><span class="hidden-xs">내정보</span></a>
                    	<div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/updateForm"><span class="hidden-xs">정보수정</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/cart/list"><span class="hidden-xs">장바구니</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/jjim/list"><span class="hidden-xs">찜</span></a>
                        <div class="whiteBlock"></div>
                    </li> 
                         
                    <li class="tab fancyTab active" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/pay/MyList"><span class="hidden-xs">결제내역</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/userDeleteForm"><span class="hidden-xs">회원탈퇴</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    </c:when>
                    <c:otherwise>
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/cart/list"><span class="hidden-xs">장바구니</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    
                    <li class="tab fancyTab" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/jjim/list"><span class="hidden-xs">찜</span></a>
                        <div class="whiteBlock"></div>
                    </li> 
                         
                    <li class="tab fancyTab active" style="margin:0;">
                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
                        <a href="/pay/MyList"><span class="hidden-xs">결제내역</span></a>
                        <div class="whiteBlock"></div>
                    </li>
                    </c:otherwise>
                    </c:choose>
                    
        </ul>
        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
                                                         
                    <div class="tab-pane  fade active in" id="tabBody4" role="tabpanel" aria-labelledby="tab4" aria-hidden="true" tabindex="0">
                    <div class="row">
                        <div class="col-md-12">
                                  
                                  <div class = "container">
<br>
<br>
	<h2>결제내역</h2>
	<br>
	
	<div class="col-sm-12">
	
	<table class="table text-center table-hover container">
	<c:if test="${empty payMyList }">
	<p>주문 내역이 없습니다.</p>
	</c:if>
	<thead>
	 <tr class="scrollLocation"><th>주문번호</th>
		<th>상품명</th>
		<th>합계금액</th>
		<th>배송상태</th>
		<th></th></tr>
	</thead>
	
	<tbody>
	<c:forEach items="${payMyList}" var="pay">
	<tr class="listToChange">
		<td class="scrolling" data-pay_no="${pay.pay_no}">${pay.pay_no}</td>
		<td align="left"><img src="/resources/${pay.productVO.p_file}"/>
		<a href="/pay/Detail/${pay.pay_no}">${pay.productVO.p_name}</a></td>
		<td>${pay.total}</td>
		<td id = state>
			<c:choose>
	 			<c:when test="${pay.state eq 1 }">
	 				배송 준비 
	 			</c:when>
				 <c:when test="${pay.state eq 2 }">
				 	 배송 중
				 </c:when>
				 <c:when test="${pay.state eq 3 }">
				 	 배송 완료 
				 </c:when>
			</c:choose>
		</td>
		<td><button class="delbtn" value = "${pay.pay_no}">
			<c:choose>
	 			<c:when test="${pay.state eq 1 }">
	 				주문 취소
	 			</c:when>
				 <c:when test="${pay.state eq 2 }">
				 	 취소 불가
				 </c:when>
				 <c:when test="${pay.state eq 3 }">
				  	내역 삭제
				 </c:when>
			</c:choose>
			</button></td>
	</tr>	
</c:forEach>
	</tbody>
	</table>
	</div>
	</div>
                                  
                                </div>
                            </div>
                    </div>                    
        </div>

    </section>
</div>
<script>

$(document).ready(function() {
  

	  
    var numItems = $('li.fancyTab').length;
		
	
			  if (numItems == 12){
					$("li.fancyTab").width('8.3%');
				}
			  if (numItems == 11){
					$("li.fancyTab").width('9%');
				}
			  if (numItems == 10){
					$("li.fancyTab").width('10%');
				}
			  if (numItems == 9){
					$("li.fancyTab").width('11.1%');
				}
			  if (numItems == 8){
					$("li.fancyTab").width('12.5%');
				}
			  if (numItems == 7){
					$("li.fancyTab").width('14.2%');
				}
			  if (numItems == 6){
					$("li.fancyTab").width('16.666666666666667%');
				}
			  if (numItems == 5){
					$("li.fancyTab").width('20%');
				}
			  if (numItems == 4){
					$("li.fancyTab").width('25%');
				}
			  if (numItems == 3){
					$("li.fancyTab").width('33.3%');
				}
			  if (numItems == 2){
					$("li.fancyTab").width('50%');
				}
		  
	 

	
		});

$(window).load(function() {

  $('.fancyTabs').each(function() {

    var highestBox = 0;
    $('.fancyTab a', this).each(function() {

      if ($(this).height() > highestBox)
        highestBox = $(this).height();
    });

    $('.fancyTab a', this).height(highestBox);

  });
});
</script>









<script>
$(document).ready(function(){
  $(".nav-tabs a").click(function(){
    $(this).tab('show');
  });
  $('.nav-tabs a').on('shown.bs.tab', function(event){
    var x = $(event.target).text();         // active tab
    var y = $(event.relatedTarget).text();  // previous tab
    $(".act span").text(x);
    $(".prev span").text(y);
  });
});
</script>	
<script>
$('.delbtn').on("click", function(){
	let state = $.trim($(this).text());
	let no = $(this).val();
	console.log(no)
	if (state == "취소 불가"){alert("현재 배송중이므로 취소 불가능합니다.")}
	if(state == "주문 취소"){if(confirm("정말 취소하시겠습니까?")){location.href="/pay/Delete/"+no; alert("주문이 취소 되었습니다.");}}
	if(state == "내역 삭제"){if(confirm("정말 삭제하시겠습니까?")){location.href="/pay/Delete/"+no; alert("내역이 삭제 되었습니다.");}}
	});
	
var lastScrollTop = 0;
var easeEffect = 'easeInQuint';
$(window).scroll(function(){
	var currentScrollTop = $(window).scrollTop();
	if(currentScrollTop - lastScrollTop > 0){console.log("다운 스크롤");
	if($(window).scrollTop() >= ($(document).height() - $(window).height()) ){
		var lastpay_no = $(".scrolling:last").attr("data-pay_no");
		$.ajax({
			type : 'post',
			url : 'infiniteScrollDown',
			headers : {
				"Content-Type" : "application/json",
				"X-HTTP-Method-Override" : "POST"
			},
			dataType : 'json',
			data : JSON.stringify({pay_no:lastpay_no}),
			timeout: 5000,
			success : function(data){
				var str ="";
				var button="";
				if(data !=""){
					$(data).each(function(){
						console.log(this);
						if(this.state == "1"){this.state = "배송 준비"; button = "주문 취소";}
						if(this.state == "2"){this.state = "배송 중"; button = "취소 불가";}
						if(this.state == "3"){this.state = "배송 완료"; button = "내역 삭제";}
						str += "<tr class=" + "'listToChange'" + ">"
							+		"<td class=" + "'scrolling'" + " data-pay_no='" + this.pay_no + "'>" + this.pay_no + "</td>"
							+		"<td align=" + "'left'" + ">" + "<img src=" + "/resources/" + this.productVO.p_file + "/>"
							+		"<a href=" + "'/pay/Detail/" + this.pay_no + "''>" + this.productVO.p_name + "</a>" + "</td>"
							+		"<td>" + this.total + "</td>"
							+		"<td class=" + "'state'" + ">"
							+		this.state
							+		"</td>"
							+		"<td>" + "<button class=" +"'delbtn'" + " value=" + this.pay_no +">" + button + "</td>"
							+ "</tr>";
					});

					$(".listToChange").empty();
					$(".scrollLocation").after(str);
					$('.delbtn').on("click", function(){
						let state = $.trim($(this).text());
						let no = $(this).val();
						if (state == "취소 불가"){alert("현재 배송중이므로 취소 불가능합니다.")}
						if(state == "주문 취소"){if(confirm("정말 취소하시겠습니까?")){location.href="/pay/Delete/"+no; alert("주문이 취소 되었습니다.");}}
						if(state == "내역 삭제"){if(confirm("정말 삭제하시겠습니까?")){location.href="/pay/Delete/"+no; alert("내역이 삭제 되었습니다.");}}
						});
				}
				else{alert("불러올 내역이 없습니다.")}
			}
		});
		var position = $(".listToChange:first").offset();
		$('html,body').stop().animate({scrollTop : position.top }, 600, easeEffect);
		}
	}
	else{console.log("업 스크롤");
	if ($(window).scrollTop() <= 0 ){
	var firstpay_no = $(".scrolling:first").attr("data-pay_no");
	$.ajax({
		type : 'post',
		url : 'infiniteScrollUp',
		headers : {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : "POST"
		},
		dataType : 'json',
		data : JSON.stringify({pay_no:firstpay_no}),
		success : function(data){
			var str ="";
			var button="";
			if(data !=""){
				$(data).each(function(){
					console.log(this);
					if(this.state == "1"){this.state = "배송 준비"; button = "주문 취소";}
					if(this.state == "2"){this.state = "배송 중"; button = "취소 불가";}
					if(this.state == "3"){this.state = "배송 완료"; button = "내역 삭제";}
					str += "<tr class=" + "'listToChange'" + ">"
						+		"<td class=" + "'scrolling'" + " data-pay_no='" + this.pay_no + "'>" + this.pay_no + "</td>"
						+		"<td align=" + "'left'" + ">" + "<img src=" + "/resources/" + this.productVO.p_file + "/>"
						+		"<a href=" + "'/pay/Detail/" + this.pay_no + "''>" + this.productVO.p_name + "</a>" + "</td>"
						+		"<td>" + this.total + "</td>"
						+		"<td class=" + "'state'" + ">"
						+		this.state
						+		"</td>"
						+		"<td>" + "<button class=" +"'delbtn'" + " value=" + this.pay_no + ">" + "주문 취소" + "</td>"
						+ "</tr>";
				});
				$(".listToChange").empty();
				$(".scrollLocation").after(str);
				$('.delbtn').on("click", function(){
					let state = $.trim($(this).text());
					let no = $(this).val();
					if (state == "취소 불가"){alert("현재 배송중이므로 취소 불가능합니다.")}
					if(state == "주문 취소"){if(confirm("정말 취소하시겠습니까?")){location.href="/pay/Delete/"+no; alert("주문이 취소 되었습니다.");}}
					if(state == "내역 삭제"){if(confirm("정말 삭제하시겠습니까?")){location.href="/pay/Delete/"+no; alert("내역이 삭제 되었습니다.");}}
					});
			}
		}
	});
	}
	lastScrollTop = currentScrollTop;
	}
});

</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>