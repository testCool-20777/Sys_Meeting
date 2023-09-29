<%@page import="mod.discuss"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.*"%>
<%@page import="Dao.dao"%>
<%@page import="mod.information"%>
<%@page import="java.util.*"%>
<%@page import="java.util.TimeZone"%>
<%@page import="java.text.*"%>
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
<%request.setCharacterEncoding("utf-8"); %>
<form name="thisform"method="post">
要修改的内容<input type="text" name="message1" value="<%=request.getParameter("message")%>">
<input type="button" value="修改"onclick="update()">
<input type="button" value="返回"onclick="history.go(-1);">
</form>
<script language="javascript">
function update(){
document.thisform.submit();
}
</script>

<%
if(request.getParameter("message1")!=null)
{
Date time = new Date();
SimpleDateFormat ft=new SimpleDateFormat("yyyy-MM-dd kk:mm:ss ");
ft.setTimeZone(TimeZone.getTimeZone("Asia/Shanghai"));
request.setCharacterEncoding("utf-8");
String message=request.getParameter("message1");
String ino=request.getParameter("ino");
String sno=request.getParameter("sno");
String oldTime=request.getParameter("time");
String hour=ft.format(time).substring(11, 13);
if(hour.equals("24"))
	hour="00";
 dao dao1=new dao();
 int t=dao1.updateDiscuss( ft.format(time).substring(0,11)+hour+ft.format(time).substring(13,20),message,Integer.parseInt(ino),Integer.parseInt(sno),oldTime.substring(0,20)); 
 
 

 if(t<1)
 {
	 %>
		<script>
	       alert("修改成功！");
	       history.go(-2);
	      </script>
		<%
 }
 else
 {
	 %>
		<script>
	       alert("修改失败！");
	       history.go(-2);
	      </script>
		<%
 }
}

 %>
</body>
</html>