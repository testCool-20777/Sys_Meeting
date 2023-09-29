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
    String oldUserName = request.getParameter("oldUserName");
    String oldSno=request.getParameter("oldSno");
    String oldSname=request.getParameter("oldSname");
    String oldUserPass=request.getParameter("oldUserPass");
    
    String newUserName = request.getParameter("newUserName");
    String newSno=request.getParameter("newSno");
    String newSname=request.getParameter("newSname");
    String newUserPass=request.getParameter("newUserPass");
	int t=0;
    if(oldSname.equals(newSname))
    {
    	newSname=oldSname;
    }
    else
    {
    	t=dao1.updateStudentName(Integer.parseInt(oldSno), newSname);
    	if(t>0)
    	{
      		 %>
    			<script>
    		       alert("修改失败！");
    		       history.go(-1);
    		      </script>
    			<%
    	}
    }
    
    if(oldSno.equals(newSno))
    {
    	newSname=oldSname;
    }
    else
    {
    	t=dao1.updateStudentSno(Integer.parseInt(oldSno), Integer.parseInt(newSno));
    	if(t>0)
    	{
      		 %>
    			<script>
    		       alert("修改失败！");
    		       history.go(-1);
    		      </script>
    			<%
    	}
    	else
    	{
    		t=dao1.updateDiscusserSno(Integer.parseInt(oldSno), Integer.parseInt(newSno));
        	if(t>0)
        	{
          		 %>
        			<script>
        		       alert("修改失败！");
        		       history.go(-1);
        		      </script>
        			<%
        	}
    	}
    }
    
    if(oldUserName.equals(newUserName))
    {
    	newUserName=oldUserName;
    }
    else
    {
    	t=dao1.updateUserName(oldUserName, newUserName);
    	if(t>0)
    	{
      		 %>
    			<script>
    		       alert("修改失败！");
    		       history.go(-1);
    		      </script>
    			<%
    	}
    	else
    	{
    		t=dao1.updateStudentUserName(Integer.parseInt(newSno), newUserName);
        	if(t>0)
        	{
          		 %>
        			<script>
        		       alert("修改失败！");
        		       history.go(-1);
        		      </script>
        			<%
        	}
    	}
    }
    
    if(oldUserPass.equals(newUserPass))
    {
    	newUserPass=oldUserPass;
    }
    else
    {
    	t=dao1.updateUserPass(newUserName, newUserPass);
    	if(t>0)
    	{
      		 %>
    			<script>
    		       alert("修改失败！");
    		       history.go(-1);
    		      </script>
    			<%
    	}
    }
    
    	
    if(t<1)
    {
 		 %>
			<script>
		       alert("修改成功！");
		       history.go(-2);
		      </script>
			<%
    }

%>

</body>
</html>