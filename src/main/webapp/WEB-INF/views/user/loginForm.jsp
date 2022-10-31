<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String referer = request.getHeader("Referer"); %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="<%=request.getContextPath() %>/css/loginpage-style.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link href="<%=request.getContextPath() %>/css/header-style.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <!-- 카카오로그인 -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <meta name="viewport" content="width=device-width,initial-scale=1">
   <!--  네이버로그인 -->
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<!--  구글 로그인  -->
 <script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="207256550266-i2bh521udai3oi6d1me9qijj7ufam87a.apps.googleusercontent.com">
<script src="https://accounts.google.com/gsi/client" async defer></script>
<style>
@import url(https://fonts.googleapis.com/css?family=Karla);
.wrap{
  padding:30px 0;
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
  height:40px;
  font-size:26px;
}

.form-control {
   font-size:20px;
   height:50px;
}



input:focus{
  outline:none;
  box-shadow:none;
  background:rgba(0, 13, 12, 0.10);
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


</style>
</head><body>
<div class='wrap'>
   <div class="wrapper">
       <div class="outer">
          <form class = "loginArea" action = "loginSuccess" method = "post"
          onsubmit="return validate();">
          <input type= "hidden" name = "referer" value = "<%=referer%>">
             <h1>로그인</h1>
             
             <div class="input_area">
             <label for="uid">ID</label>
             <input type="text" name="uid" id="uid" class="form-control" placeholder="아이디를 입력하세요" autofocus>
             </div>
             
             
             <div class="input_area">
             <label for="upwd">Password</label>
             <input type="password" name="upwd" id="upwd" class="form-control" placeholder="비밀번호를 입력하세요"><br>
             </div>
             <h5><span></span></h5> 
                <div style="width: 100%;height: 20px;margin-bottom: 50px;display:flex;align-items:center;">      
                <input style="width:50%; height:45px; margin-right: 15px;"type="submit" class="btn btn-default" value="로그인">
                <button style="width:50%; height:45px; " class="btn btn-default" type="button" onclick="location.href='joinForm'">회원가입</button>
                </div>
                <div style="width: 100%;height: 20px;margin-bottom: 30px;display:flex;align-items:center;">         
                <button style="width:50%; height:45px; margin-right: 15px;" class="btn btn-default" type="button" onclick="location.href='findid'">아이디 찾기</button>
                <button style="width:50%; height:45px;" class="btn btn-default" type="button" onclick="location.href='findpwd'">비밀번호 찾기</button>
                </div>    
                <div style="display: flex; flex-direction: column; align-items: center;"><!-- 카카오로그인 --><a class="p-2" href="https://kauth.kakao.com/oauth/authorize?client_id=9e900ef19d50835b9522ada4275583ff&redirect_uri=http://localhost:8080/login/oauth_kakao&response_type=code"><!-- REST_API키 및 REDIRECT_URi는 본인걸로 수정하세요 --><!-- 저는 redirect_uri을 http://localhost:8080/member/kakaoLogin로 했습니다. --><!-- 본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->   <img src="//mud-kage.kakao.com/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" width="230" height="50"/><!--이미지는 카카오 개발자센터에서 제공하는 login 이미지를 사용했습니다. -->   </a>  <!--  네이버 로그인 --><!-- 네이버 로그인 버튼 생성 위치 --><div id="naverIdLogin"></div><script type="text/javascript">var naverLogin = new naver.LoginWithNaverId({clientId: "ihKyZ45R59n0cGNMEkDu",callbackUrl: "http://localhost:8080/callback",isPopup: false,loginButton: {color: "green", type: 3, height: 50}});naverLogin.init();</script><!--  구글 로그인  --><div id="g_id_onload" style="width:230;"data-client_id="207256550266-i2bh521udai3oi6d1me9qijj7ufam87a.apps.googleusercontent.com"data-login_uri="http://localhost:8080/googleloginForm"data-auto_prompt="false"></div><div class="g_id_signin" data-type="standard" data-size="large"data-theme="outline" data-text="sign_in_with" data-shape="rectangular"data-logo_alignment="left" style="width:230;"></div><script>function handleCredentialResponse(response) {const responsePayload = parseJwt(response.credential);var email = responsePayload.email;var name = responsePayload.name;var accessToken = response.credential;}function parseJwt(token){var base64Url = token.split('.')[1];var base64 = base64Url.replace(/-/g, '+').replace(/_/g,'/');var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c){return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);}).join(''));return JSON.parse(jsonPayload);};window.onload = function() {google.accounts.id.initialize({client_id : "207256550266-i2bh521udai3oi6d1me9qijj7ufam87a.apps.googleusercontent.com",login_uri :"http://localhost:8080/googleloginForm"});google.accounts.id.renderButton(document.getElementById("buttonDiv"), {theme : "outline",size : "large"} );google.accounts.id.prompt();}</script></div>       
                
          </form>
       </div>
    </div>
</div>

 
   
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>