<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.user"%>
<%@page import="Dao.dao"%>
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
   String ino="";
   String iname="";
   dao dao1= new dao();
   List<information>types= dao1.selectAlliInformations();


%>
<table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="6">已发布的班级事务信息</th>
			</tr>
			<tr>
				<th>事务号</th>
				<th>事务名</th>
			</tr>
			<%
			   for(information type:types)
			   {
			    ino=type.getIno().toString();
			   	iname=type.getIname();
			%>
			<tr align="center">
				<td><% 	out.println(ino); %></td>
				<td><% out.println(iname); %></td>
			</tr>
			<%	} %>
		</table>
       
       <p></p>
       <p></p>
        <form action="dealWithAddInformation.jsp" method="post" name="from1" >
       <table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="6">想要发表的班级事务信息</th>
			</tr>
			<tr>
				<th>事务号</th>
				<th>事务名</th>
				<th>操作</th>
			</tr>
			<tr align="center">
				<td><input type="text" name="ino"></td>
				<td><input type="text" name="iname"></td>
				<td><input type="submit"value="发布" name="login"></td>				
			</tr>
			
	
		</table>
        </form>

</body>

</html>