<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css">
<title>장바구니</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

	function fnClear() {
		if (confirm("장바구니를 비우시겠습니까?") == true) {
			location.href = "/cart/deleteAll";
		}
	}
	
	/*function orderB() {
		if (confirm("선택하신 상품이 없습니다.") == false) {
			return;
		}else{
			document.form.submit();
		}
	}
	*/
	
	function fnGo() {
		location.href = "#";
	}



	
</script>

<style>
tbody img {width:120px; height:120px; border-radius: 15%}
th {text-align: auto;}
td {text-align : left; align-items: center;}
#pageBox{text-align:center;}
.clear{clear:both;}

.container {
  margin-top:30px;
}

h1, h2, h3, h4, h5, h6 {
  font-family: 'Source Sans Pro';
  
}

.fancyTab {
	text-align: center;
  padding:15px 0;
  background-color: #eee;
	box-shadow: 0 0 0 1px #ddd;
	top:15px;	
  transition: top .2s;
}


.fancyTab.active {
  top:0;
  transition:top .2s;
}

.whiteBlock {
  display:none;
}

.fancyTab.active .whiteBlock {
  display:block;
  height:2px;
  bottom:-2px;
  background-color:#fff;
  width:99%;
  position:absolute;
  z-index:1;
}

.fancyTab a {
  font-family: 'Source Sans Pro';
  color:#333;
}

/*.fancyTab .hidden-xs {
  white-space:nowrap;
}*/

.fancyTabs {
  border-bottom:2px solid #ddd;
  margin: 15px 0 0;
  display : flex;
}

li.fancyTab a {
  padding-top: 15px;
  top:-15px;
  padding-bottom:0;
}

li.fancyTab.active a {
  padding-top: inherit;
}

.fancyTab .fa {
  font-size: 40px;
	width:100%;
	padding: 15px 0 5px;
  color:#666;
}

.fancyTab.active .fa {
  color: #cfb87c;
}

.fancyTab a:focus {
	outline:none;
}

.fancyTabContent {
  border-color: transparent;
  box-shadow: 0 -2px 0 -1px #fff, 0 0 0 1px #ddd;
  padding: 30px 15px 15px;
  position:relative;
  background-color:#fff;
}

.nav-tabs > li.fancyTab.active > a, 
.nav-tabs > li.fancyTab.active > a:focus,
.nav-tabs > li.fancyTab.active > a:hover {
	border-width:0;
}

.nav-tabs > li.fancyTab:hover {
	background-color:#f9f9f9;
	box-shadow: 0 0 0 1px #ddd;
}

.nav-tabs > li.fancyTab.active:hover {
  background-color:#fff;
  box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
}

.nav-tabs > li.fancyTab:hover a {
	border-color:transparent;
}

.nav.nav-tabs .fancyTab a[data-toggle="tab"] {
  background-color:transparent;
  border-bottom:0;
}

.nav-tabs > li.fancyTab:hover a {
  border-right: 1px solid transparent;
}

.nav-tabs > li.fancyTab > a {
	margin-right:0;
	border-top:0;
  padding-bottom: 30px;
  margin-bottom: -30px;
}

.nav-tabs > li.fancyTab {
	margin-right:0;
	margin-bottom:0;
}

.nav-tabs > li.fancyTab:last-child a {
  border-right: 1px solid transparent;
}

.nav-tabs > li.fancyTab.active:last-child {
  border-right: 0px solid #ddd;
	box-shadow: 0px 2px 0 0px #fff, 0px 0px 0 1px #ddd;
}

.fancyTab:last-child {
  box-shadow: 0 0 0 1px #ddd;
}

.tabs .nav-tabs li.fancyTab.active a {
	box-shadow:none;
  top:0;
}


.fancyTab.active {
  background: #fff;
	box-shadow: 1px 1px 0 1px #fff, 0 0px 0 1px #ddd, -1px 1px 0 0px #ddd inset;
  padding-bottom:30px;
}

.arrow-down {
	display:none;
  width: 0;
  height: 0;
  border-left: 20px solid transparent;
  border-right: 20px solid transparent;
  border-top: 22px solid #ddd;
  position: absolute;
  top: -1px;
  left: calc(50% - 20px);
}

.arrow-down-inner {
  width: 0;
  height: 0;
  border-left: 18px solid transparent;
  border-right: 18px solid transparent;
  border-top: 12px solid #fff;
  position: absolute;
  top: -22px;
  left: -18px;
}

.fancyTab.active .arrow-down {
  display: block;
}

@media (max-width: 1200px) {
  
  .fancyTab .fa {
  	font-size: 36px;
  }
  
  .fancyTab .hidden-xs {
    font-size:22px;
	}
		
}
	
	
@media (max-width: 992px) {
    
  .fancyTab .fa {
  	font-size: 33px;
  }
    
  .fancyTab .hidden-xs {
  	font-size:18px;
    font-weight:normal;
  }
		
}
	
	
@media (max-width: 768px) {
  ul.nav.nav-tabs.fancyTabs{
  	display : none;
  } 
   
  .fancyTab > a {
    font-size:18px;
  }
    
  .nav > li.fancyTab > a {
    padding:15px 0;
    margin-bottom:inherit;
  }
    
  .fancyTab .fa {
    font-size:30px;
  }
    
  .nav-tabs > li.fancyTab > a {
    border-right:1px solid transparent;
    padding-bottom:0;
  }
    
  .fancyTab.active .fa {
    color: #333;
	}
		
}

img {
	width: 120px;
	height: 120px;
	border-radius: 15%
}

th {
	text-align: auto;
}

td {
	text-align: left;
	align-items: center;
}

.jang2 {
	float: right;
	height: 30px;
}

.orderbtn{
	float: right;
	width: 100px;
	height: 50px;
}

input[type=number]::-webkit-inner-spin-button {
	opacity: 1
}


.clear {
	clear: both;
}

.total_count {
	float: right;
}

.cart {
	display: inline-flex;
	justify-content: center;
	width: 1100px;
	height: 150px;
}


</style>
</head>
<body>

<div class="container"> 
<section id="fancyTabWidget" class="tabs t-tabs">
        <ul class="nav nav-tabs fancyTabs" role="tablist">
        <%if (session.getAttribute("fid") == null) {%>
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>	
	                        <a href="/myInfo"><span class="hidden-xs">내정보</span></a>
	                    	<div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/updateForm"><span class="hidden-xs">정보수정</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab active" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/cart/list"><span class="hidden-xs">장바구니</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/jjim/list"><span class="hidden-xs">찜</span></a>
	                        <div class="whiteBlock"></div>
	                    </li> 
	                         
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/pay/MyList"><span class="hidden-xs">결제내역</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/userDeleteForm"><span class="hidden-xs">회원탈퇴</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    <%} else {%>
	                    <li class="tab fancyTab active" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/cart/list"><span class="hidden-xs">장바구니</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/jjim/list"><span class="hidden-xs">찜</span></a>
	                        <div class="whiteBlock"></div>
	                    </li> 
	                         
	                    <li class="tab fancyTab" style="margin:0;">
	                    <div class="arrow-down"><div class="arrow-down-inner"></div></div>
	                        <a href="/pay/MyList"><span class="hidden-xs">결제내역</span></a>
	                        <div class="whiteBlock"></div>
	                    </li>
	                    <%}%>
	        </ul>
	 
	        <div id="myTabContent" class="tab-content fancyTabContent" aria-live="polite">
	                          				<div class="jang2">
						<span class ="text"><strong>01 장바구니</strong> >  02 주문결제 > 03 결제완료</span>
						
					</div>
	                    
	                    <div class="tab-pane  fade active in" id="tabBody2" role="tabpanel" aria-labelledby="tab2" aria-hidden="true" tabindex="0">
	                        <div class="row">
	                                <div class="col-md-12">
	
					<form id="orderForm" name="orderForm" action="/pay/order" method="post">
						<table class="table text-center table-hover container">
							<thead>
								<tr>
								
									<th><input type="checkbox" id="cboxAll" name="cboxAll" class="checkRow" onclick="checkAll();" value='${cart.cart_num}' checked="checked"></th>
									<th>상품 정보</th>
									<th>상품 금액</th>
									<th>수량</th>
									<th>합계 금액</th>
									<th>삭제</th>
								</tr>
							</thead>
	
							<tbody>
								<c:forEach items="${cartList}" var="cart">
									<tr>
										<td class="td_width_1 cart_info_td"><input type="checkbox" class="checkRow" name="check"  value='${cart.cart_num}' checked="checked"><input type="hidden" class="individual_bookPrice_input" value="${cart.price}">
										<input type="hidden" class="individual_bookCount_input"	value="${cart.qty}"> 
										<input type="hidden" class="individual_totalPrice_input" value="${cart.price * cart.qty}">
										<input type="hidden" class="individual_bookId_input" value="${cart.no}"></td>
										<td align="left"><img src="/resources/${cart.p_file}" /><a href="/product/productDetail/${cart.no}">${cart.p_name}</a></td>
										<td><fmt:formatNumber value="${cart.price}"	pattern="#,### 원" /></td>
	<td ><input type="number" id="number" name="qty" value="${cart.qty}" min="1" max="200" /><input type="hidden" id="cartNumberValue" value="${cart.cart_num}"/><input type="button" class="cartButton" value="변경"/></td>
										<td><fmt:formatNumber value="${cart.price * cart.qty}" pattern="#,### 원" /></td>
										<td><input type='button' value='X' onclick="location.href='/cart/delete/${cart.cart_num}';" ></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						    <c:if test="${empty cartList }">
								<a class="cart" style="text-decoration-line: none;">
								<img id="cartimg" src="/resources/icon/cart.svg">
								</a>
  								 <p align="center">장바구니에 담긴 상품이 없습니다.</p>
  							</c:if>
						
						<!--  가격 종합 -->
						<div class="well">
							<table style="width: 45%">
							<tbody>
								<tr>
									<td style="font-size : 20px; width: 40%">총 <span class="totalCount_span"></span>개의 상품 금액	</td>
									<td style="font-size : 20px; width: 5%">+</td>
									<td style="font-size : 20px; width: 20%">배송비</td>
									<td style="font-size : 20px; width: 10%">=</td>
									<td style="font-size : 20px; width: 20%">주문 금액</td>
								</tr>
								<tr>
									<td><span class="totalPrice_span"></span> 원</td>
									<td></td>
									<td><span class="delivery_price"></span> 원</td>
									<td></td>
									<td><span class="finalTotalPrice_span"></span> 원</td>
									<td><input type='submit' id="orderButton" value='주문하기' onclick='orderB()' ></td>
								</tr>
								
								</tbody>
							</table>
							
						</div>
						
					</form>
	
	
						<input type="hidden" id="checkListValue" name="cart_num_list" /> 
						<input type="hidden" id="totalValue" name="total" /> 
						<input type='button' value='쇼핑 계속하기' onclick='fnGo()' /> 
						<input type='button' value='장바구니 비우기' onclick='fnClear()' />
				</div>
		
		
		<!-- 수량 수정폼 
		<form action="/cart/update/${cart.cart_num}" method="post" class="quantity_update_form">
				<input type="hidden" name="cart_num" class="update_cartId" value="${cart.cart_num}">
				<input type="hidden" name="qty" class="update_bookCount" value="${cart.qty}">
		</form>
	-->
		</div>
	</div>
                                    
                                    	
                                    	
                                    	
                                    	
                                    	
                                    	
                                    	
                                    	
                                    	
                                    	
                                    
                                </div>
                                 </section>
                            </div>

   
</body>


<script>

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

$(document).ready(function() {
 
    var numItems = $('li.fancyTab').length;
		
	
			  if (numItems == 12){
					$("li.fancyTab").width('8.3%');
				}
			  if (numItems == 11){
					$("li.fancyTab").width('9%');
				}
			  if (numItems == 10){
					$("li.fancyTab").width('10%');
				}
			  if (numItems == 9){
					$("li.fancyTab").width('11.1%');
				}
			  if (numItems == 8){
					$("li.fancyTab").width('12.5%');
				}
			  if (numItems == 7){
					$("li.fancyTab").width('14.2%');
				}
			  if (numItems == 6){
					$("li.fancyTab").width('16.666666666666667%');
				}
			  if (numItems == 5){
					$("li.fancyTab").width('20%');
				}
			  if (numItems == 4){
					$("li.fancyTab").width('25%');
				}
			  if (numItems == 3){
					$("li.fancyTab").width('33.3%');
				}
			  if (numItems == 2){
					$("li.fancyTab").width('50%');
				}
		  
	 

	
		});

$(window).load(function() {

  $('.fancyTabs').each(function() {

    var highestBox = 0;
    $('.fancyTab a', this).each(function() {

      if ($(this).height() > highestBox)
        highestBox = $(this).height();
    });

    $('.fancyTab a', this).height(highestBox);

  });
});
</script>
<script>
	$(document).ready(function() {
		$('.cartButton').click(function(){
			let qty = parseInt($(this).prev().prev().val());
			let cart_num = parseInt($(this).prev().val());
				alert("cart_num : "+cart_num + "qty : "+qty);
			doFormRequest('/cart/update/'+cart_num,'post',{'qty':qty});
		});
		
		$(".nav-tabs a").click(function() {
			$(this).tab('show');
		});
		$('.nav-tabs a').on('shown.bs.tab', function(event) {
			var x = $(event.target).text(); // active tab
			var y = $(event.relatedTarget).text(); // previous tab
			$(".act span").text(x);
			$(".prev span").text(y);
		});
	});
</script>
<script>

	$(document).ready(function() {
		/* 종합 정보 섹션 정보 삽입 */
		setTotalInfo();
	});
	
	/* 체크여부에따른 종합 정보 변화 */
	$(".checkRow").on("change", function() {
		/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
		setTotalInfo($(".cart_info_td"));
	});

	$().ready(function() {
		let fee = 3000;
		let price = parseInt(document.getElementById('totalPrice').value);
		if (price > 30000) {
			fee = 0;
		}
		let prototal = price.toLocaleString('ko-KR');
		let delfee = fee.toLocaleString('ko-KR');
		$('.delFee').text(delfee);
		$('#tp').text(prototal);
		$('#prototal').val(price);
	});

	/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
	function setTotalInfo() {

		let totalPrice = 0; // 총 가격
		let totalCount = 0; // 총 갯수
		let deliveryPrice = 0; // 배송비
		let finalTotalPrice = 0; // 최종 가격(총 가격 + 배송비)

		$(".cart_info_td").each(
				function(index, element) {

					if ($(element).find(".checkRow").is(":checked") === true) { //체크여부
						// 총 가격
						totalPrice += parseInt($(element).find(
								".individual_totalPrice_input").val());
						// 총 갯수
						totalCount += parseInt($(element).find(
								".individual_bookCount_input").val());
					}

				});

		/* 배송비 결정 */
		if (totalPrice >= 30000) {
			deliveryPrice = 0;
		} else if (totalPrice == 0) {
			deliveryPrice = 0;
		} else {
			deliveryPrice = 3000;
		}

		finalTotalPrice = totalPrice + deliveryPrice;

		/* ※ 세자리 콤마 Javscript Number 객체의 toLocaleString() */

		// 총 가격
		$(".totalPrice_span").text(totalPrice.toLocaleString());
		// 총 갯수
		$(".totalCount_span").text(totalCount);
		// 배송비
		$(".delivery_price").text(deliveryPrice);
		// 최종 가격(총 가격 + 배송비)
		$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
	}


	
	function checkAll() {
		if($("#cboxAll").is(':checked')) {
			$("input[name=check]").prop("checked", true);
		} else {
			$("input[name=check]").prop("checked", false);
		}
	}
	
	$(document).on("click", "input:checkbox[name=check]", function(e) {
		
		var chks = document.getElementsByName("check");
		$("input[name='check']:checked").length
		var chksChecked = 0;
		
		for(var i=0; i<chks.length; i++) {
			var check = chks[i];
			
			if(check.checked) {
				chksChecked++;
			}
		}
		
		if(chks.length == chksChecked){
			$("#cboxAll").prop("checked", true);
		}else{
			$("#cboxAll").prop("checked",false);
		}
		
	});
	
	


	$(function() {
		let checkList = [];
		$('#cboxAll').change(function() {
			if ($('#cboxAll').prop("checked") == true) {
				$('.check').prop("checked", true).change();
			} else {
				$('.check').prop("checked", false).change();
			}
		});

		let total = 0;
		$('.check')
				.click(
						function() {
							if (checkList.indexOf(this.value) == -1) {
								checkList.push(this.value);
								total = total + parseInt(this.nextSibling.value) * parseInt(this.parentNode.nextElementSibling.nextElementSibling.nextElementSibling.childNodes[1].childNodes[1].value);
							} else {
								checkList.splice(checkList.indexOf(this.value),1);
								total = total - parseInt(this.nextSibling.value) * parseInt(this.parentNode.nextElementSibling.nextElementSibling.nextElementSibling.childNodes[1].childNodes[1].value);
							}
							let checkListString = checkList.join();
							document.getElementById('checkListValue').value = checkListString;
							document.getElementById('totalValue').value = total;
							alert('알람창 활성화'+ total);
						});

	});
	
</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>