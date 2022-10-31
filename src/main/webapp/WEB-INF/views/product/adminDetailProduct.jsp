<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ page import="java.lang.String.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ page import="java.util.regex.*" %>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<head>
<style type="text/css">
#detailimgbox{width: 100%; height:100%;}
#detailimg{width: 100%;}
#updateButton{background-color:#A283E5;  border:1px solid #A283E5; width:150px; height:32px; border-radius: 8px; color:white;}
#updateButton:hover{background-color: #953acd;}
#deleteButton{background-color:#E56059;  border:1px solid #A283E5; width:150px; height:32px; border-radius: 8px; color:white;}
#deleteButton:hover{background-color: #F5291E;}
#thuimg{}
body {font-size : 11pt; color: #888888;}
#detaildiv {float : right; width : 100%;}
#bindiv{margin : 30px;}
.procnt{number-align : "right";width: 40px;}
.minusbtn, .plusbtn {color : #888888;background-color : white;border-color:#888888;cursor: pointer;margin:0;}
input[type='number']::-webkit-inner-spin-button, 
input[type='number']::-webkit-outer-spin-button { -webkit-appearance: none; margin: 0;}
#clear {clear : both;}
</style>
<script type="text/javascript">
		function del() {
  		if (confirm(${productDetail.no }+"번 제품을 삭제하시겠습니까?"))
	  	document.list.submit();
 		}
</script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>상품상세정보</title>
</head>
<body><div id = padiv>
<img id=thuimg src="/resources/product/${productDetail.thumbfile}" class="col-md-6 col-sm-12">
<div id = detaildiv class="col-md-6 col-sm-12">
<br>
<h3 style ="color : black">${productDetail.p_name}</h3><hr><br>
제품코드 ${productDetail.no} <br><br> 
가격 <span id = "pricespan"><fmt:formatNumber value="${productDetail.price}" pattern="#,### 원" /> </span><br><br>
배송비 3,000원 (3만원 이상 구매시 무료)<br><br>
상세설명 : <br>${productDetail.text}<br><hr><br>
<div>
<form method = "post" id="payform" name = "payform">
<div class="price">수량 : 
	<span class="count">
	<button type="button" class="minusbtn">&minus;</button>
		<input type="number" name = "procnt"  id="procnt" min = 1 max="999" value = "1" class = "procnt">
	<button type="button" class="plusbtn">&plus;</button>
	</span><br><hr>	
<span class = "totalprice" style ="color : black">합계금액 :</span><br><br> </div>
<button type="button" class="btn btn-outline-primary" onclick="#">장바구니</button>
<button type="button" class="btn btn-outline-info" onclick="#">바로 구매</button>
</form>
</div></div></div>
<div id=clear></div>
<div id="detailimgbox">
	    <c:forEach var="imageFileName" items="${productDetail.p_file}">
			<img src="/resources/product/${imageFileName}" alt="${imageFileName}"title="${imageFileName}" id="detailimg">
			<br>
			<br>
		</c:forEach>
</div>	


<button id="updateButton"onclick="location.href='/product/admin/productupdate/${productDetail.no}'">상세수정</button>

	<input type="button" onclick="del();" id="deleteButton" value="상품삭제" />
	<form id="list" name="list" method="post" action="/product/admin/productdelete/${productDetail.no}/${nowPage.nowPage }">
		<input type="hidden" name="p_file" value="${productDetail.p_file }">
		<input type="hidden" name="thumbfile" value="${productDetail.thumbfile }">
	</form>
	<br>
<div id=clear></div>
<div id = bindiv></div>
</body>
<script>
$().ready(function(){
	let price = "${productDetail.price}" * 1;
	let prodPrice = price.toLocaleString('ko-KR');
	$("#pricespan").text(prodPrice + "원");
	if (price < 30000){
		price ="${productDetail.price}" * 1 + 3000;}
	priceComma = price.toLocaleString('ko-KR');
	$("#totalprice").val(price);
	$(".totalprice").text("합계금액 " + priceComma + "원");
	$("#merchant_uid").val("merchant_uid" + new Date().getTime())
	});

$(".plusbtn").on("click", function(){
	let quantity = $(".procnt").val();
	if(quantity < 999){
		$(".procnt").val(++quantity);
	}
	let price = "${productDetail.price}" * quantity;
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
	$(".qty").val(quantity);
});
$(".minusbtn").on("click", function(){
	let quantity = $(".procnt").val();
	if(quantity > 1){
		$(".procnt").val(--quantity);
	}
	let price = "${productDetail.price}" * quantity
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
	$(".qty").val(quantity);
});
$(".procnt").on("change", function(){
	let quantity = $(this).val();
	if(quantity%1 !=0){
		quantity = Math.floor(quantity);
		$(this).val(quantity);
	}
	if(quantity > 999 || quantity < 0.1){
		alert("수량을 다시 확인해주세요(최대 999개까지 구매 가능합니다.)")
		quantity = 1
		$(this).val(quantity);
	}	
	let price = "${productDetail.price}" * quantity
	let fee = 3000;
	if(price >= 30000){
		fee = 0;
	}
	let prifee = price + fee
	priceComma =  prifee.toLocaleString('ko-KR');
	$("#totalprice").val(price+fee);
	$(".totalprice").text("합계금액 " + priceComma + "원");
	$(".qty").val(quantity);
});
</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>