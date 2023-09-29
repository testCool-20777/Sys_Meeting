<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.user"%>
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
String userName = request.getParameter("userName");
String sno=request.getParameter("sno");
String sname=request.getParameter("sname");
String pass=request.getParameter("userPass");

int t=dao1.addUser(userName, pass, 0);
int t2=dao1.addStudent(Integer.parseInt(sno),sname, userName);
if(t+t2>0)
{
	 %>
	<script>
       alert("用户表注册失败！");
       history.go(-1);
      </script>
	<%
}
else
{
	%>
<script>
alert("注册成功！");
history.go(-2);
</script>
<%
}
%>

</body>
</html>