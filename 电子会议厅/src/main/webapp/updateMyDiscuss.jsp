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
<%

request.setCharacterEncoding("utf-8");
int t=0;
String sno=request.getParameter("sno");
String iname="";
String message="";
String time="";
int ino=0;
int sum=0;
dao dao1=new dao();
List<discuss>types=dao1.selectDisscus(Integer.parseInt(sno));

%>
<body>
		<table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="6">个人参与讨论的信息</th>
			</tr>
			<tr>
				<th>参与的班级事务编号</th>
				<th>参与的班级事务名</th>
				<th>发布的讨论内容</th>
				<th>发布的时间</th>
				<th>操作</th>
			</tr>
			<%
				for(discuss type:types){
					
					ino=type.getIno();
					message=type.getMessage();
					time=type.getTime();
					List<information>types1= dao1.selectiInformation(ino);
					  for(information type1:types1)
					  {
					    	iname=type1.getIname();
					    }
					
			%>
			<tr align="center">
				<td><% out.print(ino); %></td>
				<td><% out.print(iname); %></td>
				<td><% out.print(message); %> </td>
				<td><% out.print(time); %></td>
				<td>
					<button onclick="window.location.href='updateDiscuss.jsp?ino=<%=ino %>&sno=<%=sno %>&time=<%=time %>&message=<%=message%>';">修改</button>
					<button onclick="window.location.href='deleteDiscuss.jsp?ino=<%=ino %>&sno=<%=sno %>&time= <%=time %>';">删除</button>

				
				
				</td>
			</tr>
			<%	} %>
		</table>
         <script type="text/javascript" >
         function reload() {
             history.go(0) 
        }
       var intervalID = setInterval(reload, 3000);
            </script>
</body>
</html>