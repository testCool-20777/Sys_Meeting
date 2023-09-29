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
<%
request.setCharacterEncoding("utf-8");
dao dao1= new dao();

String sno=request.getParameter("sno");
String sname=request.getParameter("sname");
String name=request.getParameter("userName");
String pass=request.getParameter("userPass");
String permission=request.getParameter("permission");


int t=dao1.addUser(name, pass,Integer.parseInt(permission));
int t1=dao1.addStudent(Integer.parseInt(sno), sname, name);

if(t+t1>0)
{
	 %>
	<script>
       alert("添加失败！");
       history.go(-1);
      </script>
	<%
}
else
{
	%>
<script>
alert("添加成功！");
history.go(-1);
</script>
<%
}

%>
</body>
</html>