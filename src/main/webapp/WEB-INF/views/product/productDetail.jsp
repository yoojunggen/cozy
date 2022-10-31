<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<style type="text/css">
.proimg {
		margin-top:1em;
		width : 750px;
		height : 100%;
		border : 1px solid #F6F6F6;}
body {font-size : 11pt; color: #888888;}
.detaildiv {
		margin : 10px;
		width : 700px;}
#padiv {width: 100%;
    margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
		}
#bindiv{margin : 30px;}
.procnt{number-align : "right";
width: 40px;
}
a { color : black;}
.minusbtn, .plusbtn {color : #888888;
background-color : white;
border-color:#888888;
cursor: pointer;
margin:0;}
input[type='number']::-webkit-inner-spin-button, 
input[type='number']::-webkit-outer-spin-button { 
    -webkit-appearance: none;
    margin: 0;
}
#clear {clear : both;}
.p_file{width : 100%;
 margin: auto;
    display: flex;
    align-items: center;
    justify-content: center;
    flex-wrap: wrap;
}
.btns{margin : auto;}
</style>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>CoZy</title>
</head>
<body>

<div id = padiv>
<img class = proimg src="/resources/${productDetail.thumbfile}" class="col-md-6 col-sm-12"><br>
<div class = detaildiv class="col-md-6 col-sm-12">
<br>
<h3 style ="color : black">${productDetail.p_name}</h3><br>
제품코드 ${productDetail.no} <br><br> 
가격 <span id = "pricespan">${productDetail.price}원 </span><br><br>
배송비 3,000원 (3만원 이상 구매시 무료)<br><br>
상세설명 : <br>${productDetail.text}<br><br>
<div>
<form method = "post" id="payform" name = "payform">
<div class="price">수량 : 
	<span class="count">
	<button type="button" class="minusbtn">&minus;</button>
		<input type="number" name = "qty"  id="numberValue" min = 1 max="999" value = "1" class = "procnt">
	<button type="button" class="plusbtn">&plus;</button>
	</span><br><hr>	
<span class = "totalprice" style ="color : black">합계금액 :</span><br><br> </div>
<input type="hidden" name="no" value="${productDetail.no}">
<input type="hidden" name="p_name" value="${productDetail.p_name}">
<input type="hidden" name="price" value="${productDetail.price}">
<input type="hidden" name="totalprice" id = "totalprice">
<input type="hidden" name="procnt" value=procnt.value>
<input type="hidden" name="qty" id="qty" class="qty" value="1">
<input type="hidden" name="p_file" value="${productDetail.thumbfile}">
<input type="hidden" name="uid" value= <%=session.getAttribute("uid")%>>
<input type="hidden" name="merchant_uid" id = "merchant_uid">

<button type="button" class="btn btn-info" onclick="go(1)">장바구니</button>
<button type="button" class="btn btn-warning" onclick="go(2)">바로 구매</button>
<button type="submit" class="btn btn-outline-info" onclick="payform.action='/jjim/${productDetail.no}'">찜</button>
</form>
</div>
</div>
</div>
<div id=clear></div>
<div id = bindiv></div>
<div class = container>
<div id="p_file">
	    <c:forEach var="imageFileName" items="${productDetail.p_file}">
			<img class = p_file src="/resources/${imageFileName}" alt="${imageFileName}"title="${imageFileName}" id="detailimg">
			<br>
			<br>
		</c:forEach>
</div>
</div>	
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
	$("#merchant_uid").val("merchant_" + new Date().getTime())
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

function go(index){
	if(index==1){document.payform.action="/cart/${productDetail.no}";}
	if(index==2){document.payform.action="/pay/paysheet";}
	document.payform.submit();
}




function like_func(){
	  var frm_read = $('#frm_read');
	  var boardno = $('#boardno', frm_read).val();
	  //var mno = $('#mno', frm_read).val();
	  //console.log("boardno, mno : " + boardno +","+ mno);
	  
	  $.ajax({
	    url: "../liketo/like.do",
	    type: "GET",
	    cache: false,
	    dataType: "json",
	    data: 'boardno=' +boardno,
	    success: function(data) {
	      var msg = '';
	      var like_img = '';
	      msg += data.msg;
	      alert(msg);
	      
	      if(data.like_check == 0){
	        like_img = "./images/dislike.png";
	      } else {
	        like_img = "./images/like.png";
	      }      
	      $('#like_img', frm_read).attr('src', like_img);
	      $('#like_cnt').html(data.like_cnt);
	      $('#like_check').html(data.like_check);
	    },
	    error: function(request, status, error){
	      alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	  });


</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>