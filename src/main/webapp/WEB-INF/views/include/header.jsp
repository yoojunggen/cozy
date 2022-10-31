<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>COZY</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Allerta+Stencil">
  
  
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
  
  <% String uid = (String)session.getAttribute("uid"); %>
  <% String fid = (String)session.getAttribute("fid"); %>
  <style>
  body {
  	  letter-spacing: 2px;
  	  font-family: "Allerta Stencil",'Jua' Sans-serif;
  	  opacity:0.9;
  }
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
      background-color: white !important;
      border: solid 1px white !important;
      border-bottom:1px solid #eee !important;
      padding: 30px 30px 14px 30px;
    }
   	
    .row.content {height: 450px}
    
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    
    @media screen and (max-width: 768px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
    
    .tab{ color:#444 !important; font-size: 30px !important; margin-top:20px; margin-left: 35px; font-family: 'Jua', sans-serif !important;}
    .tab:hover{color:#fcaa06 !important;}
    .log{ color:#444 !important; font-size: 21px !important; margin-top:20px; font-family: 'Jua', sans-serif !important; opacity:0.75 !important;}
    .log:hover{color:#fcaa06 !important;}
    .logo{color:#fcaa06 !important; font-size: 75px !important; font-family: "Allerta Stencil", Sans-serif !important; margin-right:30px; margin-bottom:23px;}
    .talk{border-radius:15px;}
    .toggle{background-color:#fcaa06 !important; color:white; border: 2px solid #fcaa06 !important; padding: 8px 14px;}
    .toggle:hover{background-color:white !important; color:#fcaa06; border: 2px solid #fcaa06;}
    .toggle:active{background-color:white !important; color:#fcaa06 !important; border: 2px solid #fcaa06 !important;}
    
    
  </style>
</head>
<body onload="noBack();" onpageshow="if(event.persisted) noBack();" onunload="">

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="glyphicon glyphicon-menu-hamburger hamburger"></span>
      </button>
    <c:choose>
    <c:when test="${ sessionScope.uid eq 'admin' }">
    	<a class="navbar-brand logo" href="/ad">Co2Y</a>
    </c:when>
    <c:when test="${ sessionScope.uid eq null }">
    	<a class="navbar-brand logo" href="/">Co2Y</a>
    </c:when>
    <c:when test="${ sessionScope.fid eq null }">
    	<a class="navbar-brand logo" href="/">Co2Y</a>
    </c:when>
    <c:otherwise>
    	<a class="navbar-brand logo" href="/">Co2Y</a>
    </c:otherwise>
    </c:choose>
    </div>
    
    <div class="collapse navbar-collapse" id="myNavbar">

	<c:choose>
	<c:when test="${ sessionScope.uid ne 'admin' }">
        <ul class="nav navbar-nav ul">
        	<li><a class="tab" href="/product/list/feed">사료</a></li>
        	<li><a class="tab" href="/product/list/snack">간식</a></li>
        	<li><a class="tab" href="/product/list/clean">위생용품</a></li>
        	<li><a class="tab" href="/product/list/living">생활용품</a></li>
        	<li><a class="tab" href="/product/list/healthy">건강용품</a></li>
        </ul>
    	<c:choose>
    	<c:when test="${sessionScope.uid ne null or sessionScope.fid ne null}">
        <ul class="nav navbar-nav navbar-right">
        	<li><a class="log" href="/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>
        	<li><a class="log" href="/myInfo"><span class="glyphicon glyphicon-user"></span>&nbsp;마이페이지</a></li>
        	<li><a class="log" href="/cart/list"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;장바구니</a></li>
        </ul>
		</c:when>
		<c:otherwise>
        <ul class="nav navbar-nav navbar-right">
        	<li><a class="log" href="/loginForm"><span class="glyphicon glyphicon-log-in"></span>&nbsp;로그인</a></li>
        	<li><a class="log" href="/joinForm"><span class="glyphicon glyphicon-user"></span>&nbsp;회원가입</a></li>
        </ul>
        </c:otherwise>
        </c:choose>
	</c:when>
	<c:otherwise>
        <ul class="nav navbar-nav">
        	<li><a class="tab" href="/ad">통계</a></li>
        	<li><a class="tab" href="/aduserList">회원 리스트</a></li>
        	<li><a class="tab" href="/pay/admin/list">주문 / 결제</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
        	<li><a class="log" href="/logout"><span class="glyphicon glyphicon-log-out"></span>&nbsp;로그아웃</a></li>
        </ul>
	</c:otherwise>
	</c:choose>
    </div>
  </div>
</nav>
<div style="position: fixed; right: 5%; bottom: 5%; z-index: 99;"><a href="javascript:void kakaoChatStart()" class="kakaoChatPc hidden-md hidden-sm hidden-xs">
    <img class="talk" src="/resources/gly.PNG" height="64px">
</a>

<!-- 모바일 카카오톡 상담 버튼 -->
<a href="javascript:void kakaoChatStart()" class="kakaoChatMob hidden-lg">
    <img class="talk" src="/resources/gly.PNG" height="48px">
</a>


<!-- 카카오톡 채널 스크립트 -->
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type='text/javascript'>
    Kakao.init('c089c8172def97eb00c07217cae17495'); // 사용할 앱의 JavaScript키를 입력해 주세요.
    function kakaoChatStart() {
        Kakao.Channel.chat({
            channelPublicId: '_BCiTxj' // 카카오톡 채널 홈 URL에 명시된 ID를 입력합니다.
        });
    }
    
    
    
    
    window.history.forward(); function noBack(){ 
  	  window.history.forward();
  	}
    
</script></div>

</body>
</html>
