<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style type="text/css">
img {width:200px; height:200px; border-radius: 15%}
form > p{display : inline-block;
		widht : 176px;}
#lastPrice, #tp {font-weight : 700;}
input[type='number']::-webkit-inner-spin-button, 
input[type='number']::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    margin: 0;
}
.container{text-align : center}
#protable{text-align : center; width : 100%}
.sheetTitle{text-align : center;}

</style>
<head>
<meta charset="UTF-8">
<title>Co2y</title>
</head>
<body>
<br>
<div class = "container">
<h2 class="sheetTitle">주문/결제</h2><br>
<table id = protable>
		<tr><td>이미지</td><td>상품명</td><td>가격</td><td>수량</td></tr>
		<tr><td><img id = proimg src="/resources/<%=request.getParameter("p_file")%>"></td><td><%=request.getParameter("p_name")%></td> <td><fmt:formatNumber value="${param.price}" pattern="#,###원 " /></td><td><%=request.getParameter("procnt")%>개</td></tr>
	</table>
<form name = payform>
<hr>
<h3 class=sheetTitle>주문자 정보</h3><br>
<span id="jumunja">주문하시는 분 : ${userselect.uname}</span><br><br>
<span id="yeonrak">연락처 : ${userselect.uphone} </span><br><hr>
<h3 class=sheetTitle>배송지 정보</h3><br>
<div id="test">
받으시는 분<input type="text" name="uname" value="${userselect.uname}" required placeholder ="받으시는 분" id="uname"><br>
연락처<input type="number" name="uphone" value="${userselect.uphone}" required placeholder ="연락처" id="uphone"><br>
우편번호<input type="text" name="postcode" id="sample4_postcode" value="${userselect.postcode}" required id="postcode" placeholder ="우편번호"><input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class = "btn btn-warning"><br>
도 로 명<input type="text" name="roadaddr" id="sample4_roadAddress" value="${userselect.roadaddr}" required id="roadaddr" placeholder ="도로 명"><span id="guide" style="color:#999;display:none"></span><br>
지번주소<input type="text" name="jibunaddr" id="sample4_jibunAddress" value="${userselect.jibunaddr}" required id="jibunaddr" placeholder ="지번 주소"><br>
상세주소<input type="text" name="detailaddr" id ="sample4_detailAddress" value="${userselect.detailaddr}" required id="detailaddr" placeholder ="상세 주소"><br>
기타주소<input type="text" name="extraaddr" id="sample4_extraAddress" value="${userselect.extraaddr}" required id="extraaddr" placeholder ="기타 주소"><br>
</div>
<hr>
<p>제품가격</p><%=request.getParameter("price") %><br>
<p>배송비</p> <p class="delFee">배송비 자리</p><br>
<p>최종가격</p><p id = "tp">총가격 자리<p>
<input type="hidden" name="uid" value="${param.uid}">
<input type="hidden" name="price" value=<%=request.getParameter("price")%>>
<input type="hidden" name="no" value=<%=request.getParameter("no")%>>
<input type="hidden" name="qty" value=<%=request.getParameter("procnt")%>>
<input type="hidden" name="P_file" value=<%=request.getParameter("p_file")%>>
<input type="hidden" name="P_name" value=<%=request.getParameter("p_name")%>>
<input type="hidden" name="merchant_uid" value=<%=request.getParameter("merchant_uid")%>>
<input type="hidden" name="delfee" id = "delfee">
<input type="hidden" name="total" value = "<%=request.getParameter("totalprice")%>">
<input type="hidden" name="totalpay" id = "totalpay">
<hr>
</form>
<p>구매하기</p>
<input type="image" src="/resources/kakako_pay_icon.png" id="paybtn"/><input type="image" src="/resources/kg.jpg" id="paybtn2"/>
</div>
</body>
<!-- 스크립트 영역 -->
<script>
$().ready(function(){
	let fid = "<%=session.getAttribute("fid")%>";
	let uid = '${userselect.uname}';
	if(uid == ''){
		$('#jumunja').text("주문하시는 분 : " + fid);
		$('#yeonrak').css('display','none');}
	let fee = 3000;
	let price = <%=request.getParameter("totalprice")%>;
	if (price > 30000){
		fee = 0;}
	let prototal = price.toLocaleString('ko-KR');
	let delfee = fee.toLocaleString('ko-KR');
	$('.delFee').text(delfee);
	$('#delfee').val(delfee);
	$('#tp').text(prototal);
	$('#prototal').val(price);
	$('#totalpay').val(prototal);
	});
$("#paybtn").click(function () {
	if (addrCheck() == true){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp42484742'); 
	// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
	// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
	IMP.request_pay({
		pg: 'kakaopay',
		pay_method: 'card',
		merchant_uid: '<%=request.getParameter("merchant_uid")%>',
		/* 
		 *  merchant_uid에 경우 
		 *  https://docs.iamport.kr/implementation/payment
		 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
		 */
		name: '<%=request.getParameter("p_name")%>',
		// 결제창에서 보여질 이름
		// name: '주문명 : ${auction.a_title}',
		// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
		amount: $("#tp").text(),
		// amount: ${bid.b_bid},
		// 가격 
		buyer_name: '${userselect.uname}',
		// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
		// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
		buyer_postcode: ('${userselect.postcode}'),
		}, function (rsp) {
			console.log(rsp);
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			msg += '빠르게 고객님께 전달드리겠습니다.';
			let payform = document.payform;
			payform.method = "post";
			payform.target ="_self";
			payform.action = "/pay/Success"
			payform.submit();
			success.submit();
			alert(msg);
			// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
			// 자세한 설명은 구글링으로 보시는게 좋습니다.
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}
		
	});
	}else{alert("배송 정보를 다시 입력해주세요");}
});
	$("#paybtn2").click(function () {
		if (addrCheck() == true){
		var IMP = window.IMP; // 생략가능
		IMP.init('imp42484742'); 
		// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
		// ''안에 띄어쓰기 없이 가맹점 식별코드를 붙여넣어주세요. 안그러면 결제창이 안뜹니다.
		IMP.request_pay({
			pg: 'html5_inicis',
			pay_method: 'card',
			merchant_uid: '<%=request.getParameter("merchant_uid")%>',
			/* 
			 *  merchant_uid에 경우 
			 *  https://docs.iamport.kr/implementation/payment
			 *  위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
			 */
			name: '<%=request.getParameter("p_name")%>',
			// 결제창에서 보여질 이름
			// name: '주문명 : ${auction.a_title}',
			// 위와같이 model에 담은 정보를 넣어 쓸수도 있습니다.
			amount: '<%=request.getParameter("totalprice")%>',
			// amount: ${bid.b_bid},
			// 가격 
			buyer_name: '${userselect.uname}',
			 buyer_email : '${userselect.umail}',//테스트용 이메일이라 나중에 사용자 이메일로 바꿔야 함
			// 구매자 이름, 구매자 정보도 model값으로 바꿀 수 있습니다.
			// 구매자 정보에 여러가지도 있으므로, 자세한 내용은 맨 위 링크를 참고해주세요.
			  buyer_tel : '${userselect.uphone}',
		    buyer_addr : '(${userselect.postcode}) ${userselect.roadaddr} ${userselect.jibunaddr} ${userselect.detailaddr} ${userselect.extraaddr}',
			buyer_postcode: ('${userselect.postcode}'),
			}, function (rsp) {
				console.log(rsp);
			if (rsp.success) {				
				var msg = '결제가 완료되었습니다.';
				msg += '빠르게 고객님께 전달드리겠습니다.';
				alert(msg);
				let payform = document.payform;
				payform.method = "post";
				payform.target ="_self";
				payform.action = "/pay/Success"
				payform.submit();
				success.submit();
				// 결제 성공 시 정보를 넘겨줘야한다면 body에 form을 만든 뒤 위의 코드를 사용하는 방법이 있습니다.
				// 자세한 설명은 구글링으로 보시는게 좋습니다.
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
				alert(msg);
			}
		});
		}else{alert("배송 정보를 다시 입력해주세요");}
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
    function addrCheck(){
    	let cheakData = [];
    	let nullData =[];
    	let j = 0;
    	cheakData[0] = $("#uname").val();
    	cheakData[1] = $("#uphone").val();
    	cheakData[2] = $("#postcode").val();
    	cheakData[3] = $("#roadaddr").val();
    	cheakData[4] = $("#jibunaddr").val();
    	cheakData[5] = $("#detailaddr").val();
    	cheakData[6] = $("#extraaddr").val();
    	for (var i =0; i < cheakData.length; i++){
    		if(cheakData[i] == ""){nullData[j] = cheakData[i]; j = j+1;}
    	}
    	console.log(nullData);
    	if (nullData.length == 0){return true;}
    	else {return false;}
    }
</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>