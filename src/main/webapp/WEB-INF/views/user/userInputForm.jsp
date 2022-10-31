<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>join</title><link href="<%=request.getContextPath() %>/css/joinform-style.css" rel="stylesheet">
</head><body>
<!-- onsubmit="return validate(); -->
<div class="outer"  style = "min-width :384px;">
	<div id="joinInfoArea">
		<form:form method="post" action="userInsert" modelAttribute="userVO">

				<h1>회원 가입</h1>
								
				<h4> 아이디</h4>
				<span class="input_area">
				
				<form:input path="uid" id="USER_ID" name="USER_ID" class="USER_ID" minlength="5" maxlength="25" required="required"/></span>
				
				 <button id="idcheck" type="button" style= "float:right; width: 72px; color: black; margin-right: 15px;">중복확인</button>
								
				<h4> 비밀번호</h4>	
				<span class="input_area" id = "pw"><form:input path="upwd" maxlength="15"  name="USER_PWD" required="required"/></span>
				
				<h4> 비밀번호 확인</h4>
				<span class="input_area"><input maxlength="15" name="USER_PWD2" required="required"/></span>
				<label id="pwdResult"></label>
				
				<h4> 이름</h4>
				<span class="input_area" id ="name22"><form:input path="uname" maxlength="25" name="USER_NAME" required="required"/></span>
				
				<h4>이메일</h4>
				<span class="input_area" id="bb"><form:input path="umail" name="USER_MAIL" required="required"/></span>
										
				<h4>연락처</h4>
				<span class="input_area"id = "tt"><form:input path="uphone" type="tel" maxlength="11" name="USER_PHONE"	placeholder="(-없이)01012345678" required="required"/></span>
			
				<h4>우편번호</h4>
				<input type="button"  onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
				<form:input path="postcode" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;" name="sample4_postcode" id="sample4_postcode" required="required" placeholder="우편번호"/>
				<form:input path="roadaddr" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;" name="sample4_roadAddress" id="sample4_roadAddress" required="required" placeholder="도로명주소"/>
				<form:input path="jibunaddr" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;" name="sample4_jibunAddress" id="sample4_jibunAddress" required="required" placeholder="지번주소"/><span id="guide" style="color:#999;display:none"></span>
				<form:input path="detailaddr" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;"  name="sample4_detailAddress" id="sample4_detailAddress" required="required" placeholder="상세주소"/>
				<form:input path="extraaddr" style = "border : solid 1px #dadada; padding : 5px 5px 7px 5px; background : white;"  name="sample4_extraAddress" id="sample4_extraAddress" required="required" placeholder="참고항목" />
				<h4></h4>
				
				<div class="btnArea">
					<input type="submit" value="가입하기" id="joinBtn">
				</div>
			</form:form>
		</div>
</div>

	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
 <script>	 
function sample4_execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			var extraRoadAddr = ''; if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){extraRoadAddr += data.bname;}
			if(data.buildingName !== '' && data.apartment === 'Y'){
				extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);}
			if(extraRoadAddr !== ''){extraRoadAddr = ' (' + extraRoadAddr + ')';}
			document.getElementById('sample4_postcode').value = data.zonecode;document.getElementById("sample4_roadAddress").value = roadAddr;document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
			if(roadAddr !== ''){
				document.getElementById("sample4_extraAddress").value = extraRoadAddr;
			} else {
				document.getElementById("sample4_extraAddress").value = '';
				}var guideTextBox = document.getElementById("guide");
				if(data.autoRoadAddress) {
					var expRoadAddr = data.autoRoadAddress + extraRoadAddr;guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';guideTextBox.style.display = 'block';
					} else if(data.autoJibunAddress) {
						var expJibunAddr = data.autoJibunAddress;guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';guideTextBox.style.display = 'block';
						} else {guideTextBox.innerHTML = '';guideTextBox.style.display = 'none';}}}).open();};
 
						
  $('#joinBtn').click(function(){
	  var USER_PWD=$('input[name=USER_PWD]').val();
	  var USER_PWD2=$('input[name=USER_PWD2]').val();
	  if(USER_PWD!=USER_PWD2) {alert('비밀번호가 같아야 합니다.');
		  return false;}
	  return true;});
  
  $('#USER_ID').focusout(function() { idcheck(); });
 	
  function idcheck() {	
	  var USER_ID = document.getElementById('USER_ID').value;
	$.ajax({
		url : "/user/idChk",
		type : "post",
		data : {uid: uid},
		dataType : 'json',
		success : function(result){
			if(result == 0){
					alert('이미 사용중인 아이디 입니다.');
					idflag = false;
					$("#USER_ID").val("")
			}else if ($("#USER_ID").val().length < 5) {
					alert("아이디는 5자 이상으로 설정해야 합니다.");
					$("#USER_ID").val("");			
			return false;	
			}else if($.trim($("#USER_ID").val()) !== $("#USER_ID").val()){alert("공백은 입력이 불가능합니다.");$("#USER_ID").val("");	return false;
			}else if (result == 1) {alert('아이디를 입력해 주세요.');idflag = false;
			}else if (result == 2) {alert('사용가능한 아이디 입니다.');idflag = true;}},
					error : function() { alert('서버요청실패');}});};
					
					
					  //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
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
					                document.getElementById('sample4_postcode').value = data.zonecode;
					                document.getElementById("sample4_roadAddress").value = roadAddr;
					                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
					                
					                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
					                if(roadAddr !== ''){
					                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
					                } else {
					                    document.getElementById("sample4_extraAddress").value = '';
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