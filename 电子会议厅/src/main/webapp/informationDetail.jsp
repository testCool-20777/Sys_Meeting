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
   String ino=request.getParameter("ino");
   String iname="";
   int sno=0;
   String message="";
   String sname="";
   String  time="";
   dao dao1= new dao();
   List<discuss>types= dao1.selectAlldDiscusses(Integer.parseInt(ino));
  List<information>types2= dao1.selectiInformation(Integer.parseInt(ino));
  for(information type:types2)
  {
  	iname=type.getIname();
  }
%>

<table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="6"><%=ino%>号班级事务<<%= iname%>>具体信息</th>
			</tr>
			<tr>
				<th>学号</th>
				<th>姓名</th>
				<th>讨论内容</th>
				<th>发布时间</th>
			</tr>
			<%
			   for(discuss type:types)
			   {
				   

			   	sno=type.getSno();
			   	message=type.getMessage();
			   	time=type.getTime();
				List<student>types1= dao1.selectStudentBySno(sno);
				  for(student type1:types1)
				  {
				    	sname=type1.getSname();
				    }
			%>
			<tr align="center">
				<td><% out.println(sno); %></td>
				<td><% out.println(sname); %></td>
				<td><% out.println(message); %></td>
				<td><% out.println(type.getTime()); %></td>
			</tr>
			<%	} %>
		</table>
		<p align="center"><button type="button" onclick="window.history.go(-1)">返回</button></p>
         <script type="text/javascript" >
         $(function () {
        	  setInterval(reflush, 1000)	
        	})
        	function reflush() {
        	  $.get(location.pathname, function (data) {
        	    $("#tmp")[0].innerHTML= data    
        	    $("#data").html($("#tmp").find("#data").html()) 
        	    $("#tmp")[0].innerHTML = "" 
        	  })
        	}
            </script>
</body>
</html>