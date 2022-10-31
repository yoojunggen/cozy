<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>join</title>
<style>
@import url(https://fonts.googleapis.com/css?family=Karla);
.wrap{
  padding:30px 0;
  font-size:20px;
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

label{margin:0px; float:left;}

.form-control{height:40px; font-size:20px;}

.input_area{margin:40px 0px 0px;}


#joinBtn{font-size:26px;
margin:25px 0px;}

input:focus{
  outline:none;
  box-shadow:none;
  background:rgba(0, 13, 12, 0.1);
}
.input-group{
   margin:40px 0px 0px;
   width:100%;
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

span.Chk{opacity:0.6; float:left;}

</style>
</head><body>
<!-- onsubmit="return validate(); -->
<div class='wrap'>
<div class="outer"  style = "min-width :384px;">
   <div id="joinInfoArea">
   <!-- action="userInsert" -->
      <form:form id="join_form" method="post" modelAttribute="userVO">
            <h1>회원 가입</h1><br>
            
            <div class="input_area"><label for="uid">아이디</label><input type="text" class="form-control" id="uid" name="uid" maxlength="15" required="required" placeholder="ID" value="" onkeyup="idcheck()"></div>
            <span id="uidChk" class="Chk"></span>
                        
                           
            <div class="input_area" id = "pw"><label for="upwd">비밀번호</label><input type="password" maxlength="20" id="upwd" class="form-control" name="upwd" placeholder="PassWord" required="required" onkeyup="pwdCheck()"></div>
            <span id="pwChk" class="Chk"></span>
            
    
            <div class="input_area"><label for="USER_PWD2">비밀번호 확인</label><input type="password" maxlength="20" id="USER_PWD2" class="form-control" name="USER_PWD2" placeholder="PassWord Check" required="required" onkeyup="pwdCheck()"/></div>
            <span id="pwdResult" class="Chk"></span>
            

            <div class="input_area" id ="name22"><label for="uname">이름</label><input type="text" id="uname" maxlength="25" class="form-control" name="uname" placeholder="Name" required="required" onkeyup="unamecheck()"></div>
            <span id="unameChk" class="Chk"></span>
            
            
            <div class="input_area" id = "tt"><label for="uphone">연락처</label><input type="text" id="uphone" maxlength="11" class="form-control" name="uphone"   placeholder="(-없이)01012345678" required="required" onkeyup="uphonecheck();"></div>
            <span id="uphoneChk" class="Chk"></span>
                        
                        
            <div class="form-group email-form input-area">            
            <div class="input-group">
            <label for="umail">이메일</label>
            <input type="text" class="form-control" name="umail" id="umail" placeholder="Email">
            
            <select class="form-control" name="umail2" id="umail2" >
            <option>@naver.com</option>
            <option>@daum.net</option>
            <option>@gmail.com</option>
            <option>@hanmail.com</option>
            <option>@yahoo.co.kr</option>
            </select>
            </div>                      
             
            <div class="input-group-addon">
               <button type="button" class="btn btn-default" id="mail-Check-Btn">본인인증</button>
            </div>
            <div class="mail-check-box">
               <input type="text" id="mail-check-input" class="form-control mail-check-input" required placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
            </div>
               <span id="mail-check-warn" class="Chk"></span>
            </div>
            
            <div class="input_area">
            <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
            <input type="text" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;" name="postcode" id="postcode"  placeholder="우편번호" required readonly>
            <input type="text" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;" name="roadaddr" id="roadaddr" placeholder="도로명주소" required readonly>
            <input type="text" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;" name="jibunaddr" id="jibunaddr" placeholder="지번주소"  ><span id="guide" style="color:#999;display:none"></span>
            <input type="text" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;"  name="detailaddr" id="detailaddr" placeholder="상세주소" required>
            <input type="text" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;"  name="extraaddr" id="extraaddr" placeholder="참고항목" >
            <span id="addrChk" class="Chk"></span>
            </div>
            
            <div class="btnArea">
               <button type="button" id="joinBtn" class="btn btn-default" onclick="joinchk()">가입하기</button>
            </div>
         </form:form>     
      </div>
</div>
</div>
<%@ include file = "/WEB-INF/views/script/script.jsp" %>
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>