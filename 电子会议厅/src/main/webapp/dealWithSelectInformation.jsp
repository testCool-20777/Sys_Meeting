<%@page import="mod.information"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.user"%>
<%@page import="Dao.dao"%>
<%@page import="mod.*"%>
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
    int t=0;
	String ino=request.getParameter("ino");
	String iname="";
	int sno=0;
	int sum=0;
	dao dao1=new dao();
	List<information>types=dao1.selectiInformation(Integer.parseInt(ino));
	for(information type :types)
	{
		iname=type.getIname();
		t=1;
	}
	
	List<discuss>types1=dao1.selectAlldDiscusses(Integer.parseInt(ino));
	for(discuss type :types1)
	{
		sum++;
		
	}
	if(t>0)
	{
		 %>
			<script>
		       alert("查找成功！");
		      </script>
			<%

			
	out.println("查询到以下信息");%><br>
	<%out.println("班级事务号："+ino);%><br>
	<%out.println("班级事务名："+iname);%><br>
    <%out.println("班级事务讨论度："+sum);%><br>
    <%
	if(sum<1)
		out.print("该班级事务还没有人讨论，快去讨论吧！");
	else if(sum<5)
		out.print("该班级事务的讨论度太低，快去探讨吧！");
	
	}
	else
	{
		 %>
			<script>
		       alert("查找失败！没有该事务！请检查输入的事务号是否正确");
		       history.go(-1);
		      </script>
			<%
	}
	
	
	
%>
<p align="center"><button type="button" onclick="window.history.go(-1)">返回</button></p>
</body>
</html>