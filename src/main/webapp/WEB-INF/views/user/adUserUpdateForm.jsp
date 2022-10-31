<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>

<!DOCTYPE html><html><head><meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
<link href="<%=request.getContextPath() %>/css/header-style.css" rel="stylesheet"> 
<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css" />
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <link rel="stylesheet" href="css/bootstrap.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head><body>

<div class="container">

<div class="container" align="center" style="margin-top: 10px;">
	<h3 style="margin: 40px;">[내정보 수정]</h3>

	
   <c:forEach var="e" items="${adupdateForm}">
   <form action="/adupdate" method="post">
   <input type="hidden" name="upwd" id="upwd" value="${e.upwd}"> 
   아이디 : <input type="text" name="uid" id="uid" value="${e.uid}" readonly /> <br>
   이름 : <input type="text" name="uname" id="uname" value="${e.uname}" maxlength="25" required="required"/><span id="unameChk"></span><br>
   전화번호 :<input type="text" name="uphone" id="uphone" value="${e.uphone}" required="required"/><br>
   우편번호 : <input type="text" name="postcode" id="postcode" value="${e.postcode}" required="required"/><br>
   <input type="button"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
   주소 : <input type="text" name="roadaddr" id="roadaddr" value="${e.roadaddr}" required="required"/><br>
   지번 : <input type="text" name="jibunaddr" id="jibunaddr" value="${e.jibunaddr }" required="required"/><br><span id="guide" style="color:#999;display:none"></span>
   상세주소 : <input type="text" name="detailaddr" id="detailaddr" value="${e.detailaddr}" required="required"/><br>
   기타주소 : <input type="text" name="extraaddr" id="extraaddr" value="${e.extraaddr}" required="required"/><br>
   <input type="submit" value="수정하기"/>
   <input type="submit" value="취소하기"/>
   </form>
   </c:forEach>
   
</div>

<script>
var code ="";
var Eid = /^[A-Za-z0-9]{5,15}/g;//아이디 정규식
var Ephone = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/g;//연락처 정규식
var Eemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;//이메일 정규식
var Euname = /^[ㄱ-ㅎ|가-힣]|[a-z|A-Z]+$/;//이름 정규식
var Euname2 = /[`~!@#$%^&*()_|+\-=?;:,."\"""\'"<>\{\}\[\]\\\/0-9 ]/gim;//특수문자 정규식

//중복체크


$('#uid').keyup(function() {
      var id = $("#uid").val();    
      console.log(id.length)
       if (id.length < 5 || id.length > 15) {
      $('#uidChk').html('아이디는 영문자 또는 숫자 5~15글자로 작성해주세요');
      $('#uidChk').css('color','red');
      }else if(!Eid.test(id)===false) {
         $('#uidChk').html('아이디는 영문자 또는 숫자 5~15글자로 작성해주세요');
         $('#uidChk').css('color','red');
      } else {
         $.ajax({
            url : "idChk",
            type : "post",
            dataType : "json",
            data : {"uid" : $("#uid").val()},
            success : function(data){
               if(data == 1){
                  $('#uidChk').html('중복된 아이디입니다');
                  $('#uidChk').css('color','red');
               }else if(data == 0){
                  $('#uidChk').html('사용가능한 아이디입니다');
                  $('#uidChk').css('color','green');
            
               }
            }
         })
      }
});



//비밀번호확인
$('#upwd, #USER_PWD2').keyup(function() {
       var pw = $('#upwd').val();
       var confirmPW = $('#USER_PWD2').val();
   
       if (pw.length < 4 || pw.length > 16) {
      $('#pwChk').html('비밀번호는 4글자 이상, 16글자 이하만 이용 가능합니다.');
      $('#pwdResult').html(' ');
      $('#pwChk').css('color','red');
      }else if(pw === confirmPW) {
         $('#pwChk').html('비밀번호가 일치합니다.');
         $('#pwChk').css('color','green');
         $('#pwdResult').html('비밀번호가 일치합니다.');
         $('#pwdResult').css('color','green');
      } else {
         $('#pwChk').html('비밀번호가 일치하지 않습니다.');
         $('#pwChk').css('color','red');
         $('#pwdResult').html('비밀번호가 일치하지 않습니다.');
         $('#pwdResult').css('color','red');
      }
});
   
//이름
$('#uname').keyup(function() {
   var uname = $('#uname').val();
   
   if (uname.length===0){
      $('#unameChk').html('이름을 입력해주세요');
      $('#unameChk').css('color','red');
   }else if (!Euname2.test(uname)===false) {
   
   }else if (Euname.test(uname)===false) {
      $('#unameChk').html('한글 또는 영문 이름만 사용 가능합니다.');
      $('#unameChk').css('color','red');
   } else {
      $('#unameChk').html(' ');
   }
});

//이름 특수문자 제거
$(document).ready(function(){    
      $("#uname").on("keyup", function() {
         $(this).val($(this).val().replace(Euname2,""));
      });
    });


   
//이메일인증
$('#mail-Check-Btn').click(function() {
   const email = $('#umail').val() + $('#umail2').val(); // 이메일 주소값 얻어오기!
   console.log('완성된 이메일 : ' + email); // 이메일 오는지 확인
   const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
   
   if(!Eemail.test($('#umail').val() + $('#umail2').val())) {
      alert("이메일형식이 아님");
   } else{   
   $.ajax({
      type : 'GET',
      url : 'mailCheck?email='+email, // GET방식이라 Url 뒤에 email을 뭍힐수있다.
      success : function (data) {
         console.log("data : " +  data);
         checkInput.attr('disabled',false);
         code =data;
         alert('인증번호가 전송되었습니다.')
      }         
   }); // end ajax
   }
}); // end send eamil

// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
   const inputCode = $(this).val();
   const $resultMsg = $('#mail-check-warn');
   
   if(inputCode === code){
      $resultMsg.html('인증번호가 일치합니다.');
      $resultMsg.css('color','green');
      $('#mail-Check-Btn').attr('disabled',true);
      $('#umail').attr('readonly',true);
      $('#umail2').attr('readonly',true);
      $('#umail2').attr('onFocus', 'this.initialSelect = this.selectedIndex');
        $('#umail2').attr('onChange', 'this.selectedIndex = this.initialSelect');
   }else{
      $resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
      $resultMsg.css('color','red');
   }
});

//연락처 숫자만 입력
function checkInputNum(){
    if ((event.keyCode < 48) || (event.keyCode > 57)){
        event.returnValue = false;
    }
}

function joinchk() {    
   var useridChk = false;
    var userpwdChk = false;
    var inputPwdCfmChk = false;
    var usernameChk = false;
    var emailChk = false;
    var emailCodeChk = false;
    var uphoneChk = false;
    var addrChk = false;
   var codeChk = false;
      
    var userid = $("#uid").val();
    var userpwd = $("#upwd").val();
    var inputPwdCfm = $("#USER_PWD2").val();
    var username = $("#uname").val();
    var email = $("#umail").val();
    var emailChk = $("#mail-check-input").val();
    var uphone = $('#uphone').val();
    var addr1 = $("#postcode").val();
    var addr2 = $("#roadaddr").val();
    var addr3 = $("#jibunaddr").val();
    var addr4 = $("#detailaddr").val();
    var addr5 = $("#extraaddr").val();
    
        
    if(userid.length == 0){
        $('#uidChk').html("아이디를 입력해 주세요"); 
        $('#uidChk').css("color","red"); 
        $("#userid").focus();
    } else if(!Eid.test(userid)===false){
       console.log(userid);
       return false;
    } else {
       useridChk = true;
    }    
    
    if(userpwd.length == 0){
        $('#pwChk').html("비밀번호를 입력해 주세요");
        $('#pwChk').css("color","red"); 
        $("#userpwd").focus();
        return false;
    } else {
       userpwdChk = true;
    }
 
    if(userpwd != inputPwdCfm){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#USER_PWD2").focus();
        return false; 
    } else {
       inputPwdCfmChk = true;
    }
 
    if(username.length == 0){
        $("#username").focus();

        return false;
    } else {
       usernameChk = true;
    }
    
    if(email.length == 0){
        alert("이메일을 입력해주세요");
        $("#umail").focus();
        return false;
    }else if(code != emailChk){
       alert("인증코드를 확인해주세요");
       $("#mail-check-input").focus();
   }else {       
       emailChk = true;
       codeChk = true;
    }
    
    if(uphone.length == 0){
       $("#uphone").focus();
       return false;
    } else if (!Ephone.test(uphone)===false) {
       console.log(uphone);
       $("#uphone").focus();
       return false;
    } else{
       uphoneChk = true;
    }
    
    if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 || addr4.length == 0 || addr5.length == 0 ){
        alert("주소를 입력해주세요");
        $("#addr4").focus();
        return false;
    } else {
       addrChk = true;
    }
    console.log(useridChk,userpwdChk,inputPwdCfmChk,usernameChk,emailChk,addrChk);
    
    if(useridChk&&userpwdChk&&inputPwdCfmChk&&usernameChk&&emailChk&&addrChk&&codeChk){
       $("#join_form").attr("action", "userInsert");
        $("#join_form").submit();       
    }    
    return false;
}



</script>

    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>		   
  function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
	                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadaddr").value = roadAddr;
                document.getElementById("jibunaddr").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("extraaddr").value = extraRoadAddr;
                } else {
                    document.getElementById("extraaddr").value = '';
                }
	                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';
	                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
	                } else {
	                   guideTextBox.innerHTML = '';
	                  guideTextBox.style.display = 'none';
	               }
	           }
	       }).open();
	   }; 
</script>
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>