<%@page import="mod.discuss"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.*"%>
<%@page import="Dao.dao"%>
<%@page import="java.sql.*"%>
<%@page import="mod.information"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
        <link rel="stylesheet" type="text/css" href="Electronic_conference_room.css">

</head>
<body>
	<%
	
	String ino=request.getParameter("ino");
	String time=request.getParameter("time").substring(0,20);
	String sno=request.getParameter("sno");
	out.println(ino);
	out.print(time);
	out.print(sno);
	dao dao1= new dao();
	int t=dao1.deleteThisDiscuss(Integer.parseInt(sno),Integer.parseInt(ino),time);
	if(t<1)
	{
		 %>
			<script>
		       alert("删除成功！");
		       history.go(-1);
		      </script>
			<%
	}
	else
	{
		 %>
			<script>
		       alert("删除失败！");
		       history.go(-1);
		      </script>
			<%
	}
	%>
</body>
</html>