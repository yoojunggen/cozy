<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="text-align:center;"> <p>결제가 완료 되었습니다.</p></div>
<div>
<form method = "post" id="payform" name = "payform">
<input type="hidden" name="p_name" value=<%=request.getParameter("P_name")%>>
<input type="hidden" name="p_file" value=<%=request.getParameter("P_file")%>>
<input type="hidden" name="price" value=<%=request.getParameter("price")%>>
<input type="hidden" name="qty" value=<%=request.getParameter("qty")%>>
<input type="hidden" name="delfee" value=<%=request.getParameter("delfee")%>>
<input type="hidden" name="uname" value=<%=request.getParameter("uname")%>>
<input type="hidden" name="uphone" value=<%=request.getParameter("uphone")%>>
<input type="hidden" name="postcode" value=<%=request.getParameter("postcode")%>>
<input type="hidden" name="totalpay" value=<%=request.getParameter("totalpay")%>>
<input type="hidden" name="roadaddr" value=<%=request.getParameter("roadaddr")%>>
<input type="hidden" name="jibunaddr" value=<%=request.getParameter("jibunaddr")%>>
<input type="hidden" name="detailaddr" value=<%=request.getParameter("detailaddr")%>>
<input type="hidden" name="extraaddr" value=<%=request.getParameter("extraaddr")%>>
</form>
</div>
</body>
<script>
function startPage(){go();}
window.onload = function(){
setTimeout("startPage()", 1);}

function go(){
document.payform.action="/pay/pay2";
	document.payform.submit();}
</script>
</html>