<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<title>찜!</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
$('.cartButton').click(function(){
	 if (confirm("장바구니에 담으시겠습니까?") == true){
	 }else{
	     return false;
	 }
});



let jjim = false
button.addEventListener("click", () => {
if (jjim) {

jjim = false
else {

jjim = true
}} 




</script>
<style>
img {
	width: 120px;
	height: 120px;
	border-radius: 15%
}



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
        <%if (session.getAttribute("fid") == null) {%>
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
	                    
	                    <li class="tab fancyTab active" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/jjim/list"><span class="hidden-xs">찜</span></a>
	                        <div class="whiteBlock"></div>
	                    </li> 
	                         
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/pay/MyList"><span class="hidden-xs">결제내역</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/userDeleteForm"><span class="hidden-xs">회원탈퇴</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    <%} else {%>
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/cart/list"><span class="hidden-xs">장바구니</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab active" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/jjim/list"><span class="hidden-xs">찜</span></a>
	                        <div class="whiteBlock"></div>
	                    </li> 
	                         
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/pay/MyList"><span class="hidden-xs">결제내역</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    <%}%>
	        </ul>
	 
	        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
	                    <div class="tab-pane  fade active in" id="tabBody2" role="tabpanel" aria-labelledby="tab2" aria-hidden="true" tabindex="0">
	                        <div class="row">
	                                <div class="col-md-12">
	
					

<h2>나의 찜 목록</h2>
<div class="col-sm-12">
	<table id="productTable" class="table table-hover">	
	<tbody>
	<c:forEach items="${jjimList}" var="jjim">		
	<tr>
	<td align="left"><img src="/resources/${jjim.p_file}"/>	<a href="/product/productDetail/${jjim.no}">${jjim.p_name}</a></td>
	<td>${jjim.price}</td>
	<td><a class="deletebtn" href="/jjim/delete/${jjim.jjim_no}">삭제</a></td>
	<td><form action="/cart/${jjim.no}" method="post"><input type="hidden" id="productNoValue" value="${jjim.no}"/>
		<input type="hidden" value="1" id="qty" name="qty"/>
		<input type="submit" class="cartButton" value="장바구니에 담기"/>
		</form></td></tr>
		</c:forEach>
		</tbody></table></div>
						</div>	</div>		</div>                                           	                                                            	   </div>                          	      </section>                </div>
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

</body>
<script>
function setTotalInfo() {

	let totalCount = 0; // 총 갯수


	$(".cart_info_td").each(
			function(index, element) {
					// 총 갯수
					totalCount += parseInt($(element).find(
							".individual_bookCount_input").val());
				}

			});
</script>
</html>