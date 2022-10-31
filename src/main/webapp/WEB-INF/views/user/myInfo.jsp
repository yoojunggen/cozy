<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>

@import url(https://fonts.googleapis.com/css?family=Karla);

.wrap{
  padding:10px;
  font-size:25px;
  color:#888;
  width:400px;
  font-family:'Karla';
  margin:0 auto;
  text-align:center;
}

input{
  font-weight:300;
  border:0;
  border-bottom:1px solid black;
  width:100%;
  height:70px;
  font-size:26px;
  text-align : center;
}


input:focus{
  outline:none;
  box-shadow:none;
  background:rgba(0, 13, 12, 0.10);
}

button{
  border:0;
  background:transparent;
  padding:5px;
  margin-top:50px;
  position:relative;
  outline:0;
}

.buttonafter:after{
content:'';
display:block;
position:absolute;
top:8px;
left:100%; /*should be set to 100% */
width:0;
height:0;
border-color: transparent transparent transparent #14a03d; /*border color should be same as div div background color*/
border-style: solid;
border-width: 5px;

}

.forgot{
  background:#a0a0a0;
  color:#fff;
  float:left;
}

.login{
  background:#a0a0a0;
  color:#fff;
  float:right;
}

.login.buttonafter {
    background:#14a03d;
}

.form-control {
	font-size:20pt;
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

.input-area {
	margin-top : 20px;
}

.form-control{
	height:50px;
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

<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">






<div class="container"> 
<section id="fancyTabWidget" class="tabs t-tabs">

				<c:choose>
				<c:when test="${ sessionScope.uid ne null }">
        		<ul class="nav nav-tabs fancyTabs" role="tablist">
        
                    <li class="tab fancyTab active" style="margin:0;">
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
        		</ul>
        		</c:when>
        		<c:otherwise>
        		<script>
        		location.href='/cart/list';
        		</script>
        		</c:otherwise>
        		</c:choose>
        		
        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
                    <div class="tab-pane  fade active in" id="tabBody0" role="tabpanel" aria-labelledby="tab0" aria-hidden="false" tabindex="0">
                        <div>
                        	<div class="row">
                            	
                                <div class="col-md-12">
                                <div class='wrap'>
  								<h1>내 정보 확인</h1><br/>
    							<c:forEach var="e" items="${myInfo}">
  								  
  								<div class="input-area"><label>아이디</label>
  								<input class="form-control" type="text" name="uid" id="uid" value="${e.uid}" readonly/></div>
  								
  								<div class="input-area"><label>이름</label>  
  								<input class="form-control" type="text" name="uname" id="uname" value="${e.uname}" readonly/></div>
 								
 								<div class="input-area"><label>연락처</label>
 								<input class="form-control" type="text" name="uphone" id="uphone" value="${e.uphone}" readonly/></div>
 								
 								<div class="input-area"><label>주소</label>
 								<input class="form-control" type="text" name="postcode" id="postcode" value="${e.postcode}" readonly/>
  								<input class="form-control" type="text" name="roadaddr" id="roadaddr" value="${e.roadaddr}" readonly/>
  								<input class="form-control" type="text" name="detailaddr" id="detailaddr" value="${e.detailaddr}" readonly/>
  								<input class="form-control" type="text" name="extraaddr" id="extraaddr" value="${e.extraaddr}" readonly/></div>
  								</c:forEach>	
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



window.history.forward(); function noBack(){ 
	  window.history.forward();
	}

</script>









</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>