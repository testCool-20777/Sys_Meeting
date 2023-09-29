<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.*"%>
<%@page import="Dao.dao"%>
<%@page import="mod.student"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html lang="zh">
<head>
 <meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("utf-8"); %>
<form name="thisform"method="post"  action="dealWith_update_information.jsp">
修改的事务号是<input type="text" readonly name="ino" value="<%=request.getParameter("ino")%>" >
<br>
<br>
修改后的事务名：
<br>
<input type="text" name="iname" >
<input type="submit" value="修改">
<input type="button" value="返回"onclick="history.go(-1);">
</form>
</body>
</html>