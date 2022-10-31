<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<style>
img {width:150px; height:150px; border-radius: 15%}
#padiv{margin : auto;
		width: 50%;}
#div2, #div3, #protable, #addrtable {margin: auto;
text-align :center;}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id = "padiv">
<div id = "div2">
	<h1>주문이 완료되었습니다</h1>
	<br>
	<h3>주문 목록</h3>
	<table id="protable">
		<tr><td>이미지</td><td>상품명</td><td>가격</td><td>수량</td><td>배송비</td><td>결제 하신 금액</td></tr>
		<tr><td><img id = proimg src="/resources/<%=request.getParameter("p_file")%>"></td>
		<td><%=request.getParameter("p_name")%></td>
		<td><%=request.getParameter("price")%>원</td>
		<td><%=request.getParameter("qty")%>개</td>
		<td><%=request.getParameter("delfee")%>원</td>
		<td>${param.totalpay}원</td></tr>
	</table>
	<hr>
</div>
<div id="div3">
	<h3>배송지 정보</h3>
	<table id="addrtable">
		<tr><td>받으시는 분</td><td><%=request.getParameter("uname")%></td></tr>
		<tr><td>전화번호</td><td><%=request.getParameter("uphone")%></td></tr>
		<tr><td>우편번호</td><td><%=request.getParameter("postcode")%></td></tr>
		<tr><td>도로명주소</td><td><%=request.getParameter("roadaddr")%></td></tr>
		<tr><td>지번주소</td><td><%=request.getParameter("jibunaddr")%></td></tr>
		<tr><td>상세주소</td><td><%=request.getParameter("detailaddr")%></td></tr>
		<tr><td>기타주소</td><td><%=request.getParameter("extraaddr")%></td></tr>
	</table>
	<br>
	<button type="button" onclick="location.href='/product/list/';">쇼핑 계속하기</button>
	<button type="button" onclick="location.href='/pay/MyList';">주문내역</button>
</div>
</div>
</body>
<script>
function NotReload(){
    if( (event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82)) || (event.keyCode == 116) ) {
        event.keyCode = 0;
        event.cancelBubble = true;
        event.returnValue = false;
        alert("Co2y를 이용해주셔서 감사합니다.\n\nTeam Cozy : 강지원 홍준우 장애리 최승환 오택진 유정근 정문면")
    } 
}
document.onkeydown = NotReload;
</script>
<%@ include file = "/WEB-INF/views/include/footer.jsp" %>
</html>