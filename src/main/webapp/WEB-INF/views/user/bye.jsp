<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %>
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>sessionLogout</title>
</head>
<body>
<%
session.invalidate(); 
%>
<script>
alert("탈퇴되었습니다. 이용해주셔서 감사합니다");
location.href='<%= request.getContextPath() %>/';
</script></body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>
