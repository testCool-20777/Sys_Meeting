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
   request.setCharacterEncoding("utf-8");
   String sno=request.getParameter("sno");
   String sname=request.getParameter("sname");
   String userName="";
   String  userPass="";
   int permission=0;
   String user="";
   dao dao1= new dao();
   List<student>types= dao1.selectAllStudent();

%>
<%="<p>"+sno+"号管理员 "+sname+" 你好！"+"</p>"%>
<table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="7">管理系统账户</th>
			</tr>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>用户名</th>
				<th>密码</th>
				<th>权限等级</th>
				<th>账户性质</th>
				<th>操作</th>
			</tr>
			<%
			   for(student type:types)
			   {
				   
                sno=type.getSno().toString();
                sname=type.getSname();
                userName=type.getName();
			    
				List<user>types1= dao1.selectUser(userName);
				  for(user type1:types1)
				  {
				    	permission=type1.getPermission();
				    	userPass=type1.getPass();
				    }
				  if(permission<1)
					  user="普通用户";
				  else
					  user="管理员";
			%>
			<tr align="center">
				<td><% out.println(sno); %></td>
				<td><% out.println(sname); %></td>
				<td><% out.println(userName); %></td>
				<td><% out.println(userPass); %></td>
				<td><% out.println(permission); %></td>
				<td><% out.println(user); %></td>
				<td>				
				<a href="deleteUser.jsp?sno=<%=sno%>&name=<%=userName%>">删除该账户</a>
				<a href="updateUser.jsp?sno=<%=sno%>&name=<%=userName%>&permission<%=permission%>">修改账户</a>
				</td>
			</tr>
			<%	} %>
		</table>
		
		<p></p>
		<p></p>
		<p></p>	
	 <form action="dealWith_Add_user.jsp" method="post" name="from1" >
       <table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="6">添加一个新的账户</th>
			</tr>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>用户名</th>
				<th>密码</th>
				<th>权限等级</th>
				<th>操作</th>
			</tr>
			<tr align="center">
				<td><input type="text" name="sno"></td>
				<td><input type="text" name="sname"></td>
				<td><input type="text" name="userName"></td>
				<td><input type="text" name="userPass"></td>
				<td><input type="text" name="permission"></td>
				<td><input type="submit"value="添加" ></td>				
			</tr>
			
	
		</table>
        </form>
		
		
		
		
		<p align="center"><button type="button" onclick="window.history.go(-1)">返回</button></p>
		
</body>

</html>