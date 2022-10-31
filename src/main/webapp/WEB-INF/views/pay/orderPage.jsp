<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
$(function(){
	$('#payButton').click(function(){
		if($('#sample4_jibunAddress').val() == ''){
			$('#sample4_jibunAddress').val('-');
		}
		if($('#sample4_extraAddress').val() == ''){
			$('#sample4_extraAddress').val('-');
		}
		if($('#detailaddrF').val() == ''){
			$('#detailaddrF').val('-');
		}
		if(confirm('결제하시겠습니까?')==true){
			iamport();
		}else{
			return false;
		}
	});	
});
</script>
<style>
#productTable{width:100%;}
#productTable td{width:20%;}
img{width:100%;}
#userTable td{width: 150px;}
.clear{clear:both;}
</style>
</head>
<body>
	<div class="clear"></div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	<h2>주문/결제</h2>
	<div class="col-xs-6">
	<table id="productTable" class="table table-hover">
		<tr><td>이미지</td><td>상품명</td><td>가격</td><td>수량</td><td>총금액</td></tr>
		<c:set var="total" value="0"/>
		<c:forEach items="${orderInfo}" var="order">
		<tr><td><img src="/resources/product/${order.p_file}" alt="${order.p_name}상품의 이미지" title="${order.p_name} 이미지"/></td><td>${order.p_name}</td><td>${order.price}</td><td>${order.qty}</td><td class="totalV">${order.price*order.qty}</td></tr>
		<c:set var="total" value="${total+ order.price*order.qty}"/>
		</c:forEach>
	</table>
	</div>
	<div class="col-xs-6">
	<h3>주문자 정보</h3>
	<p>
		${orderInfo[0].uid}<br/>${orderInfo[0].uname}<br/>${orderInfo[0].uphone}
	</p>
	<h3>배송지 정보</h3>
	<!-- <form action="/pay/complete" method="post" id="payform" name = payform> -->
	<form name = payform>
	<table id="userTable">
	<tr><td><label for="uname">이름</label></td><td><input type="text" id="unameF" value="${orderInfo[0].uname}"/></td></tr>
	<tr><td><label for="uphone">전화번호</label></td><td><input type="text" id="uphoneF" value="${orderInfo[0].uphone}" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></td></tr>
	<tr><td><label for="postcode" >우편번호</label></td><td><input type="text" id="sample4_postcode" name="postcode" value="${orderInfo[0].postcode}"/><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br></td></tr>
	<tr><td><label for="roadaddr" >도로주소</label></td><td><input type="text" id="sample4_roadAddress" name="roadaddr" value="${orderInfo[0].roadaddr}"/><span id="guide" style="color:#999;display:none"></span></td></tr>
	<tr><td><label for="jibunaddr" >지번주소</label></td><td><input required type="text" id="sample4_jibunAddress" name="jibunaddr" value="${orderInfo[0].jibunaddr}"/></td></tr>
	<tr><td><label for="detailaddr" >상세주소</label></td><td><input type="text" id="detailaddrF" name="detailaddr" value="${orderInfo[0].detailaddr}"/></td></tr>
	<tr><td><label for="extraaddr" >기타주소</label></td><td><input type="text" id="sample4_extraAddress" name="extraaddr" value="${orderInfo[0].extraaddr}"/></td></tr>
	</table>
	<input type="hidden" id="checkList" name="checkList" value="${checkList}"/>
	<h3>주문 금액</h3>
	<p id = "tp">총가격 자리<p>
	
	<input type="text" id="totalPrice" name="totalPrice" value="${total}">
	<input type="hidden" id="uid" name="uid" value="${orderInfo[0].uid}">
	<input type="hidden" id="uphone" name="uphone" value="${orderInfo[0].uphone}">
	<input type="hidden" id="total" name="total" value=#tp.text id=prototal>
	<input type="hidden" id="postcode" name="postcode" value="${orderInfo[0].postcode}">
	<input type="hidden" id="roadaddr" name="roadaddr" value="${orderInfo[0].roadaddr}">
	<input type="hidden" id="jibunaddr" name="jibunaddr" value="${orderInfo[0].jibunaddr}">
	<input type="hidden" id="detailaddr" name="detailaddr" value="${orderInfo[0].detailaddr}">
	<input type="hidden" id="extraaddr" name="extraaddr" value="${orderInfo[0].extraaddr}">
	</form>
	<input type="image" src="/resources/kakako_pay_icon.png" id="paybtn"/>
	<button id="payButton">결제하기</button>
	<button id="tossButton" onclick="iamtoss()">결제하기</button>
	</div>
	</div>
	<div class="col-md-2"></div>
	</div>
	<div class="clear"></div>
</body>
<script>
function iamport(){
		let uname = document.getElementById('unameF').value;
		let uphone = document.getElementById('uphoneF').value;
		let postcode = document.getElementById('sample4_postcode').value;
		let roadaddr = document.getElementById('sample4_roadAddress').value;
		let jibunaddr = document.getElementById('sample4_jibunAddress').value;
		let detailaddr = document.getElementById('detailaddrF').value;
		let extraaddr = document.getElementById('sample4_extraAddress').value;
		let checkList = document.getElementById('checkList').value;
		
		//가맹점 식별코드
		IMP.init('imp17363174');
		IMP.request_pay({
		    pg : 'html5_inicis',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${orderInfo[0].p_name}' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격 테스트라 100원 해놓음
		    buyer_email : 'vkstkwldnjs@naver.com',//테스트용 이메일이라 나중에 사용자 이메일로 바꿔야 함
		    buyer_name : '${orderInfo[0].uname}',
		    buyer_tel : '${orderInfo[0].uphone}',
		    buyer_addr : '${orderInfo[0].roadaddr}',
		    buyer_postcode : '${orderInfo[0].postcode}'
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				 var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        doFormRequest('/pay/complete', 'post', {'checkList':checkList, 'merchant_uid':rsp.merchant_uid,'uname':uname, 'uphone':uphone, 'postcode':postcode, 'roadaddr':roadaddr, 'jibunaddr':jibunaddr, 'detailaddr':detailaddr, 'extraaddr':extraaddr});
     	 	} else {
    	 	 	var msg = '결제에 실패하였습니다.';
         	 	msg += '에러내용 : ' + rsp.error_msg;
      		}
				alert(msg);
			});
}
function doFormRequest(url, action, json)
{
    var form = document.createElement("form");
    form.action = url;
    form.method = action;
    for (var key in json)
    {
        if (json.hasOwnProperty(key))
        {
            var val = json[key];
            input = document.createElement("input");
            input.type = "hidden";
            input.name = key;
            input.value = val;
            form.appendChild(input)
        }
    }

    document.body.appendChild(form);
    form.submit();

    document.body.removeChild(form);
}

</script>
<script>
function iamtoss(){
		let uname = document.getElementById('unameF').value;
		let uphone = document.getElementById('uphoneF').value;
		let postcode = document.getElementById('sample4_postcode').value;
		let roadaddr = document.getElementById('sample4_roadAddress').value;
		let jibunaddr = document.getElementById('sample4_jibunAddress').value;
		let detailaddr = document.getElementById('detailaddrF').value;
		let extraaddr = document.getElementById('sample4_extraAddress').value;
		let checkList = document.getElementById('checkList').value;
		
		//가맹점 식별코드
		IMP.init('imp11156247');
		IMP.request_pay({
		    pg : 'tosstest',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : '${orderInfo[0].p_name}' , //결제창에서 보여질 이름
		    amount : 100, //실제 결제되는 가격 테스트라 100원 해놓음
		    buyer_email : 'ghdwnsdn128@naver.com',//테스트용 이메일이라 나중에 사용자 이메일로 바꿔야 함
		    buyer_name : '${orderInfo[0].uname}',
		    buyer_tel : '${orderInfo[0].uphone}',
		    buyer_addr : '${orderInfo[0].roadaddr}',
		    buyer_postcode : '${orderInfo[0].postcode}'
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			if (rsp.success) { // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
				 var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			        doFormRequest('/pay/toss', 'post', {'toss':toss, 'merchant_uid':rsp.merchant_uid,'uname':uname, 'uphone':uphone, 'postcode':postcode, 'roadaddr':roadaddr, 'jibunaddr':jibunaddr, 'detailaddr':detailaddr, 'extraaddr':extraaddr});
     	 	} else {
    	 	 	var msg = '결제에 실패하였습니다.';
         	 	msg += '에러내용 : ' + rsp.error_msg;
      		}
				alert(msg);
			});
}
function doFormRequest(url, action, json)
{
    var form = document.createElement("form");
    form.action = url;
    form.method = action;
    for (var key in json)
    {
        if (json.hasOwnProperty(key))
        {
            var val = json[key];
            input = document.createElement("input");
            input.type = "hidden";
            input.name = key;
            input.value = val;
            form.appendChild(input)
        }
    }

    document.body.appendChild(form);
    form.submit();

    document.body.removeChild(form);
}

</script>
<script>
$().ready(function(){
	let fee = 3000;
	let price = parseInt(document.getElementById('totalPrice').value);
	if (price > 30000){
		fee = 0;}
	let prototal = price.toLocaleString('ko-KR');
	let delfee = fee.toLocaleString('ko-KR');
	$('.delFee').text(delfee);
	$('#tp').text(prototal);
	$('#prototal').val(price);
	});
$("#paybtn").click(function () {
	var IMP = window.IMP;
	let procnt = 
	IMP.init('imp42484742');
	IMP.request_pay({
		pg: 'kakaopay',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		name: '${orderInfo[0].p_name}',
		amount: $("#tp").text(),
		buyer_name: '${orderInfo[0].uname}',
		buyer_postcode: ('${orderInfo[0].postcode}'),
		}, function (rsp) {
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '빠르게 고객님께 전달드리겠습니다.';
			let payform = document.payform;
			payform.method = "post";
			payform.target ="_self";
			payform.action = "/pay/paySuccess"
			payform.submit();
			success.submit();
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
});
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
</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>