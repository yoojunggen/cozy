<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{width:100%;}
table td{width:20%;}
img{width:100%;}
.clear{clear:both;}
</style>
</head>
<body>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	결제 성공
	
	<h1>주문 내역서</h1>
	<h4>주문 번호 : ${orderInfo[0].merchant_uid}</h4>
	<h3>상품 목록</h3>
	<table class="table table-hover">
		<tr><td>이미지</td><td>상품명</td><td>가격</td><td>수량</td><td>총금액</td></tr>
		<c:forEach items="${orderInfo}" var="order">
		<tr><td><img src="/resources/product/${order.thumbfile}" alt="${order.p_file}상품의 이미지" title="${order.p_file} 이미지"/></td><td>${order.p_name}</td><td>${order.price}</td><td>${order.qty}</td><td class="totalV">${order.total}</td></tr>
		</c:forEach>
	</table>
	<h3>배송지 정보</h3>
	<table>
		<tr><td>이름</td><td>${orderInfo[0].uname}</td></tr>
		<tr><td>전화번호</td><td>${orderInfo[0].uphone}</td></tr>
		<tr><td>우편번호</td><td>${orderInfo[0].postcode}</td></tr>
		<tr><td>도로명주소</td><td>${orderInfo[0].roadaddr}</td></tr>
		<tr><td>지번주소</td><td>${orderInfo[0].jibunaddr}</td></tr>
		<tr><td>상세주소</td><td>${orderInfo[0].detailaddr}</td></tr>
		<tr><td>기타주소</td><td>${orderInfo[0].extraaddr}</td></tr>
	</table>
	</div>
	<div class="col-md-2"></div>
	</div>
	<div class="clear"></div>
</body>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>