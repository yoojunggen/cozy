<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %><!DOCTYPE html>
<html><head><meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>join</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Karla);
.wrap{
  padding:120px 0;
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
  border-bottom:1px solid #ff5407;
  width:100%;
  height:70px;
  font-size:26px;
}

input:focus{
  outline:none;
  box-shadow:none;
  background:#ffeae2;
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
<!-- onsubmit="return validate(); -->
<div class='wrap'>
<div class="outer"  style = "min-width :384px;">
   <div id="joinInfoArea">
   <!-- action="userInsert" -->
      <form class = "loginArea" action = "nowfind" method = "post">
            <h1>비밀번호찾기</h1>                        
            <h4> 아이디</h4>
            <span class="input_area">
            <input type="text" id="uid" name="uid" maxlength="15" required="required" value=""></span>
            
            <h4> 이름</h4>
            <span class="input_area">
            <input type="text" id="uname" name="uname" maxlength="25" required="required"></span>
                        
            <div class="form-group email-form">
            <h4 for="umail">이메일</h4>
            <div class="input-group">
            <input type="text" class="form-control" name="umail" id="umail" placeholder="이메일" required="required">
            
            <select class="form-control" name="umail2" id="umail2" >
            <option>@naver.com</option>
            <option>@daum.net</option>
            <option>@gmail.com</option>
            <option>@hanmail.com</option>
            <option>@yahoo.co.kr</option>
            </select>
            </div>   
            </div>
                                                             
            <div class="btnArea">
               <input type="submit" value="본인 확인">
            </div>
         </form>     
      </div>
</div>
</div>
<script>
var code ="";
var Eid = /^[A-Za-z0-9]{5,15}/;//아이디 정규식
var Ephone = /^[0-9]+$/;//연락처 정규식
var Eemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;//이메일 정규식
var Euname = /^[ㄱ-ㅎ|가-힣]|[a-z|A-Z]+$/;//이름 정규식
var Euname2 = /[`~!@#$%^&*()_|+\-=?;:,."\"""\'"<>\{\}\[\]\\\/0-9 ]/gim;//특수문자 정규식
var space = /\s/;
var noko = /^[a-zA-Z0-9]+$/;


var useridChk = false;
var usernameChk = false;
var emailChk = false;
var codeChk = false;


   






function joinchk() {   

      
    var userid = $("#uid").val();
    var userpwd = $("#upwd").val();
    var inputPwdCfm = $("#USER_PWD2").val();
    var username = $("#uname").val();
    var email = $("#umail").val();
    var emailnum = $("#mail-check-input").val();
    var uphone = $('#uphone').val();
    var addr1 = $("#postcode").val();
    var addr2 = $("#roadaddr").val();
    var addr3 = $("#jibunaddr").val();
    var addr4 = $("#detailaddr").val();
    var addr5 = $("#extraaddr").val();
    
    useridChk = idcheck();
    usernameChk = unamecheck();
  
 
    
    if(email.length == 0){
        $("#umail").focus();
        return false;
    } else if(code != emailnum){
       $("#mail-check-input").focus();
       emailChk = false;
       codeChk = false;
       return false;
   } else {       
       emailChk = true;
       codeChk = true;
    }
    
    
   
    console.log(useridChk,usernameChk,emailChk,codeChk);
    
    if(!useridChk||!usernameChk||!emailChk||!codeChk){
       alert('입력정보를 확인해주세요');
        return false;      
    } else{
    $("#join_form").attr("action", "userInsert");
    $("#join_form").submit(); 
    }
}



</script>
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>