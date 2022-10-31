<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style>
input[type='number']::-webkit-inner-spin-button, 
input[type='number']::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0;}
img {width:120px; height:120px; border-radius: 15%;}
#delbtn{display : inline-block;}
</style>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>상품 목록</h3>
	<table class="table table-hover">
		<c:set var="total" value ="0"/>
		<tr><td>이미지</td><td>상품명</td><td>가격</td><td>수량</td><td>총금액</td></tr>
		<c:forEach items="${payNoList}" var="pay">
		<c:set var = "total" value = "${total + pay.total}"/>
		<tr><td class="imgTD"><img class="img" src="/resources/${pay.productVO.thumbfile}" alt="${pay.productVO.thumbfile}상품의 이미지" title="${pay.productVO.thumbfile} 이미지"/></td><td>${pay.p_name}</td><td><fmt:formatNumber value="${pay.productVO.price}" pattern="#,### 원" /></td><td>${pay.qty}개</td><td class="totalV"><fmt:formatNumber value="${pay.total}" pattern="#,### 원" /></td></tr>
		</c:forEach>
	</table>
<form method="post" id = "addrInfo" name="addrInfo" action = "/pay/Up/${payNoList[0].merchant_uid}">
주문번호 : <input type="text" name="merchant_uid" value="${payNoList[0].merchant_uid}" readonly><br>
받으실 분 : <input type="text" name="uname" value="${payNoList[0].uname}"><br>
연락처 : <input type="number" name="uphone" value="${payNoList[0].uphone}"><br>
<input type="hidden" name="total" value="${total}" readonly>
총 금액 : <input type="text" name="total2" value="${total}" readonly id = "totalprice"><br>
우편 번호 : <input type="text" id="sample4_postcode" name="postcode" value="${payNoList[0].postcode}" placeholder="우편번호"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-warning"><br>
도로 명 : <input type="text" id="sample4_roadAddress" name="roadaddr" value="${payNoList[0].roadaddr}" placeholder="도로명"><span id="guide" style="color:#999;display:none"></span><br>
지번 주소 : <input type="text" id="sample4_jibunAddress" name="jibunaddr" value="${payNoList[0].jibunaddr}" placeholder="지번주소"><br>
상세 주소 : <input type="text" id ="sample4_detailAddress" name="detailaddr" value="${payNoList[0].detailaddr}" placeholder="상세주소"><br>
기타 주소 : <input type="text" id="sample4_extraAddress" name="extraaddr" value="${payNoList[0].extraaddr}" placeholder="기타 주소"><br>
결제일 : <input type="text" name="date" value="${payNoList[0].pay_date}" readonly><br>
주문 상태 : <span id=delState></span><br><br>
<button id = udtbtn type = 'submit' class="btn btn-warning" >배송정보 수정</button>
</form>
<br>
<button id = delbtn class="btn btn-danger">:></button>
</body>
<script>
$().ready(function(){	
	if(${payNoList[0].state} == 1){ $("#delState").text("배송 준비");$('#delbtn').text("주문 취소"); }
	else if(${payNoList[0].state} == "2") {$("#delState").text("배송 중");$('#delbtn').text("배송 조회"); $("#udtbtn").hide();}		
	else if (${payNoList[0].state} == 3) {$("#delState").text("배송 완료"); $('#delbtn').text("환불 신청"); $("#udtbtn").hide();}
	else if (${payNoList[0].state} == 4) {$("#delState").text("환불 요청 중"); $('#delbtn').text("환불 신청 취소"); $("#udtbtn").hide();}
	else if (${payNoList[0].state} == 5) {$("#delState").text("환불 완료"); $('#delbtn').text("내역 삭제"); $("#udtbtn").hide();}
	else { $("#delState").text("배송 완료");}
	});
$('#delbtn').on("click", function(){
	let delState = $("#delState").text();
	if(delState == "배송 중"){alert("배송 조회 창 나올 예정");}
	if(delState == "배송 준비"){if(confirm("정말 취소하시겠습니까?")){payCancle(); location.href="/pay/Delete/"+ "${payNoList[0].merchant_uid}"; alert("주문이 취소 되었습니다.");}}
	if(delState == "배송 완료"){if(confirm("환불 신청하시겠습니까?")){location.href="/pay/stateUpdate/"+ "${payNoList[0].merchant_uid}" + "/3"; alert("환불 신청되었습니다.");}}
	if(delState == "환불 요청 중"){if(confirm("환불 요청을 취소하시겠습니까?")){location.href="/pay/stateUpdate/"+ "${payNoList[0].merchant_uid}" + "/4"; alert("환불 요청이 취소되었습니다.");}}
	if(delState == "환불 완료"){if(confirm("정말 삭제하시겠습니까?")){location.href="/pay/Delete/"+"${payNoList[0].merchant_uid}"; alert("내역이 삭제 되었습니다.");}}
	});	
$('#udtbtn').on("click", function(){
	if(confirm("배송 정보를 수정하시겠습니까?")){ alert("배송 정보가 수정되었습니다.")}
	});
function payCancle(){
	let token = "${token}";
	let uid = "${payNoList[0].merchant_uid}";
	$.ajax({
			url : "/pay/paycancle",
			type :"post",
		    dataType : "json",
		    contentType : "application/json; charset=utf-8",
		    data : JSON.stringify({"merchant_uid" : uid,
			        "amount": "${total}",
			        "tax_free" : "0",
			        "checksum" : '${payNoList[0].total}',
			        "reason" : "테스트"}),
		success : function(data){
			console.log(data);}
		});//ajax
}; //버튼 클릭
function addrUpdate(){
	let merchant_uid ="${payNoList[0].merchant_uid }";
	console.log(merchant_uid);
	let addr = "/pay/addrUpdate/";
	let addr2 = addr + merchant_uid;
	console.log(addr2);
	document.addrInfo.action=addr2;
	document.addrInfo.submit();
}
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
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
            },
	        onclose: function(state) {
	            //state는 우편번호 찾기 화면이 어떻게 닫혔는지에 대한 상태 변수 이며, 상세 설명은 아래 목록에서 확인하실 수 있습니다.
	            if(state === 'FORCE_CLOSE'){
	                //사용자가 브라우저 닫기 버튼을 통해 팝업창을 닫았을 경우, 실행될 코드를 작성하는 부분입니다.
	
	            } else if(state === 'COMPLETE_CLOSE'){
	                //사용자가 검색결과를 선택하여 팝업창이 닫혔을 경우, 실행될 코드를 작성하는 부분입니다.
	                //oncomplete 콜백 함수가 실행 완료된 후에 실행됩니다.
	            }
	        }
        }).open();
    }
    
    $().ready(function(){
    	let totalprice = "${total}" * 1; 	
    	console.log(totalprice);
    	let commaprice = totalprice.toLocaleString('ko-KR');
    	console.log(commaprice);
    	$('#totalprice').val(commaprice + "원");
    });	
</script>

<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>