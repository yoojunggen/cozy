<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/WEB-INF/views/include/header.jsp" %><!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>sessionLogout</title>
</head>
<body>
<%

%>
<% if(session.getAttribute("uid") != null) {  %>
<script>
alert("<%=uid%>님 로그아웃 되었습니다.");
location.href='<%= request.getContextPath() %>/';
</script>
 <% } else {%>
 <script>
alert("<%=fid%>님 로그아웃 되었습니다.");
location.href='<%= request.getContextPath() %>/';
</script>
<% } %>
<%session.invalidate();%>
</body><%@ include file = "/WEB-INF/views/include/footer.jsp" %></html>
