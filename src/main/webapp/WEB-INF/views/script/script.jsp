<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
$(function(){
   let checkList = [];
   let total = 0;
   $('.check').click(function(){
      if(checkList.indexOf(this.value) == -1){
         checkList.push(this.value);
         total = total + parseInt(this.nextSibling.value)*parseInt(document.getElementById('number').value);
      }else{
         checkList.splice(checkList.indexOf(this.value),1);
         total = total - parseInt(this.nextSibling.value)*parseInt(document.getElementById('number').value);
      }
      let checkListString = checkList.join();
      document.getElementById('checkListValue').value = checkListString;
      document.getElementById('totalValue').value = total;
   });
   $('#orderButton').click(function(){
      let checkListValue = document.getElementById('checkListValue').value;
      if(confirm('주문하시겠습니까?')==true){
         location.href='/pay/order/'+checkListValue+'/'+total;
      }else{
         return false;
      }
      
   });
   
});
</script>
<script type="text/javascript">



function fnGo(){
   location.href = "#";
}

function selectAll(selectAll)  {
     const checkboxes 
        = document.querySelectorAll('input[type="checkbox"]');
     
     checkboxes.forEach((checkbox) => {
       checkbox.checked = selectAll.checked
     })
   }
   
</script>

<!-- 회원 탈퇴 -->
<script>
   function check(){
      if(document.deleteform.upwd.value==""){
         alert('비밀번호를 입력하세요.');
         return;
      }
      if(confirm('정말 탈퇴하시겠습니까?')) {
   
         document.deleteform.action = '/userDelete';
         document.deleteform.submit();
      }
   }
</script>

<!-- 회원가입, 내정보수정 -->
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
var userpwdChk = false;
var inputPwdCfmChk = false;
var usernameChk = false;
var emailChk = false;
var uphoneChk = false;
var addrChk = false;
var codeChk = false;


//아이디 중복체크
function idcheck() {
      var id = $("#uid").val();
      var idd =  document.getElementById('uid');
      
       if (idd.value.length > 0) {
      
      if (!space.exec(idd.value)===false) {
      $('#uidChk').html('공백사용 불가');
      $('#uidChk').css('color','red');
         console.log('1');
         return false;
      }      
      if(!noko.test(idd.value)===true) {
         $('#uidChk').html('아이디는 영어와 숫자만 사용 가능합니다.');
         $('#uidChk').css('color','red');
         console.log('id :'+ id);
         return false;
      }
   }

   
    if ( id.length < 5 && id.length >= 1 ){
        $('#uidChk').html('5글자 이상 입력해 주세요.');
      $('#uidChk').css('color','red');
      
    } else if (id.length < 1 ){ 
        $('#uidChk').html('필수 입력 사항입니다');
      $('#uidChk').css('color','red');
      
    } else if (id.length > 4) {
         $.ajax({
            url : "idChk",
            type : "post",
            dataType : "json",
            data : {"uid" : $("#uid").val()},
            success : function(data){
               if(data == 1){
                  $('#uidChk').html('중복된 아이디입니다');
                  $('#uidChk').css('color','red');
                  console.log('3');
                  useridChk = false;
               }else if(data == 0){
                  $('#uidChk').html('사용가능한 아이디입니다');
                  $('#uidChk').css('color','green');
                  useridChk = true;
            }
         }
      })
   }return useridChk;
}




//비밀번호확인
function pwdCheck() {
       var pw = $('#upwd').val();
       var confirmPW = $('#USER_PWD2').val();
   
       if (pw.length < 4 || pw.length > 20) {
      $('#pwChk').html('비밀번호는 4글자 이상 이용 가능합니다.');
      $('#pwdResult').html(' ');
      $('#pwChk').css('color','red');
      }else if(pw === confirmPW) {
         $('#pwChk').html('비밀번호가 일치합니다.');
         $('#pwChk').css('color','green');
         $('#pwdResult').html('비밀번호가 일치합니다.');
         $('#pwdResult').css('color','green');
         userpwdChk = true;
      } else {
         $('#pwChk').html('비밀번호가 일치하지 않습니다.');
         $('#pwChk').css('color','red');
         $('#pwdResult').html('비밀번호가 일치하지 않습니다.');
         $('#pwdResult').css('color','red');
         userpwdChk = false;
      } return userpwdChk;
} 
   
//이름
function unamecheck() {
   var uname = $('#uname').val();
   
   if (uname.length===0){
      $('#unameChk').html('이름을 입력해주세요');
      $('#unameChk').css('color','red');
      return false;
   }else if (!Euname2.test(uname)===false) {
      usernameChk = false;
   }else if (Euname.test(uname)===false) {
      $('#unameChk').html('한글 또는 영문 이름만 사용 가능합니다.');
      $('#unameChk').css('color','red');
      usernameChk = false;
   } else {
      $('#unameChk').html(' ');
      usernameChk = true;
   } return usernameChk;
}

//이름 특수문자 제거
$(document).ready(function(){    
      $("#uname").on("keyup", function() {
         $(this).val($(this).val().replace(Euname2,""));
      });
    });


   
//이메일인증
$('#mail-Check-Btn').click(function() {
   const email = $('#umail').val() + $('#umail2').val(); // 이메일 주소값 얻어오기!
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
      $resultMsg.html('인증번호가 불일치 합니다.');
      $resultMsg.css('color','red');
   }
});

//연락처 숫자만 입력
function uphonecheck(){
   var uphone = $('#uphone').val();
   var uphone2 = document.getElementById('uphone');
   
    if (uphone2.value.length > 0){
      if (!Ephone.test(uphone2.value)) {
         $('#uphoneChk').html('숫자만 사용 가능합니다');
         $('#uphoneChk').css('color','red');
         return false;
      }
    }
    
    if (uphone.length < 8 && uphone.length >= 1){
       $('#uphoneChk').html('8자이상 입력해주세요');
      $('#uphoneChk').css('color','red');
      uphoneChk = false;
    } else if (uphone.length < 1) {
       $('#uphoneChk').html('필수입력사항입니다');
      $('#uphoneChk').css('color','red');
      uphoneChk = false;
    } else {
          $('#uphoneChk').html('사용가능');
          $('#uphoneChk').css('color','green');
          uphoneChk = true;
       }return uphoneChk; 
}   




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
    userpwdChk = pwdCheck();
    usernameChk = unamecheck();
    uphoneChk = uphonecheck();
  
 
    if(userpwd != inputPwdCfm){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#USER_PWD2").focus();
        return false; 
    } else {
       inputPwdCfmChk = true;
    }
    
    if(email.length == 0){
        $("#umail").focus();
        return false;
    } else if(emailnum.length == 0){
       $(".mail-check-input").focus();
       alert("인증번호 를 확인해주세요."); 
       emailChk = false;
        codeChk = false;
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
    
    
    if(addr1.length == 0 || addr2.length == 0 || addr3.length == 0 || addr4.length == 0 || addr5.length == 0 ){
       alert('주소를입력해주세요');
       $("#addr4").focus();
        return false;
    } else {
       addrChk = true;
    }
   
    
    if(!useridChk||!userpwdChk||!inputPwdCfmChk||!usernameChk||!emailChk||!uphoneChk||!addrChk||!uphoneChk||!codeChk){
       alert('입력정보를 확인해주세요');
        return false;      
    } else{
    $("#join_form").attr("action", "userInsert");
    $("#join_form").submit();
    alert('회원가입이 완료되었습니다.');
    }
}


//수정폼
function updatechk() {   

      
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
    
    //useridChk = idcheck();
    userpwdChk = pwdCheck();
    usernameChk = unamecheck();
    uphoneChk = uphonecheck();
  
 
    if(userpwd != inputPwdCfm){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#USER_PWD2").focus();
        return false; 
    } else {
       inputPwdCfmChk = true;
    }
    
 
   
    
    if(!userpwdChk||!inputPwdCfmChk||!usernameChk||!uphoneChk){
       alert('입력정보를 확인해주세요');
        return false;      
    } else{
    $("#update_form").attr("action", "/update");
    $("#update_form").submit();
    alert('회원님 정보수정이 완료되었습니다.');
    }
}

//수정폼
function adupdatechk() {   

      
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
    
    //useridChk = idcheck();
    userpwdChk = pwdCheck();
    usernameChk = unamecheck();
    uphoneChk = uphonecheck();
  
 
    if(userpwd != inputPwdCfm){
        alert("비밀번호가 서로 다릅니다. 비밀번호를 확인해 주세요."); 
        $("#USER_PWD2").focus();
        return false; 
    } else {
       inputPwdCfmChk = true;
    }
    
 
   
    
    if(!userpwdChk||!inputPwdCfmChk||!usernameChk||!uphoneChk){
       alert('입력정보를 확인해주세요');
        return false;      
    } else{
    $("#update_form").attr("action", "/adupdate");
    $("#update_form").submit();
    alert('회원님 정보수정이 완료되었습니다.');
    }
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
</body>
</html>