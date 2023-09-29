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

String ino=request.getParameter("ino");
String iname=request.getParameter("iname");

int t=dao1.deleteInformation(Integer.parseInt(ino));
int t1=dao1.deleteTheseDiscussByAdmin(Integer.parseInt(ino));
if(t+t1>0)
{
	 %>
	<script>
       alert("删除该班级事务失败！");
       history.go(-1);
      </script>
	<%
}
else
{
	%>
<script>
alert("删除该班级事务成功！");
history.go(-1);
</script>
<%
}

%>

</body>
</html>