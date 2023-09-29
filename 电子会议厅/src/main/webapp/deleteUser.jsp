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
    String userName = request.getParameter("name");
    String sno=request.getParameter("sno");
    int t1=dao1.deleteStudent(Integer.parseInt(sno));
    	if(t1>0)
    	{
   		 %>
   			<script>
   		       alert("删除失败！");
   		       history.go(-1);
   		      </script>
   			<%
    	}
    	else
	    {
		 %>
			<script>
		       alert("删除成功！");
		       history.go(-1);
		      </script>
			<%
	  }
    
    

    
    
%>
 
</body>
</html>