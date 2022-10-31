<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String referer = request.getHeader("Referer"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link href="<%=request.getContextPath() %>/css/loginpage-style.css" rel="stylesheet"></head><body>

	<div class="wrapper">
    	<div class="outer">
    		<form class = "loginArea" action = "<%=request.getContextPath() %>/SomuserLoginAction.som" method = "post"
    		onsubmit="return validate();">
    		<input type= "hidden" name = "referer" value = "<%=referer%>">
    			<h1>로그인</h1>
    			<h4>아이디</h4>
    			<span class="input_area">
    				<input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요">
    			</span>
    			<h4>비밀번호</h4>
    			<span class="input_area">
    				<input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요"><br>
    			</span>
    			<h5><span></span></h5>
    			<span class="input_area">
    				<input type="submit" value="로그인">
    			</span>
    		</form>
    		<a href="joinForm">회원가입</a>
    	</div>
    </div>
    
    <script>
    //아이디, 비밀번호 칸이 입력 되어 있을때만 submit
    	function validate(){
    		let userId = document.getElementById('userId');
    		let userPwd = document.getElementById('userPwd');
    		if(userId.value.length <= 0){alert("아이디를 입력해주세요!");userId.select();return false;}
    		if(userPwd.value.length <= 0){alert("비밀번호를 입력해주세요!");userPwd.select();return false;}return true;}
    </script>
   
   
</body>
</html>