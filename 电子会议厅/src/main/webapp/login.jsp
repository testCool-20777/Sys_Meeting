<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.user"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%
    JdbcUtil jdbc=new JdbcUtil();
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	request.setCharacterEncoding("utf-8");
	String userName = request.getParameter("userName");
	String userPass = request.getParameter("userPass");
			if(userName!=null && userPass!=null && !"".equals(userName) && !"".equals(userPass))
			{
				String name="";
			    String pass="";
			    int permission=0;
			     int flag=0;
				String sql="select * from user";			
				List<user> arr= jdbc.queryPreparedStatement(sql, user.class);	
				for(user type1:arr)
				{
					name=type1.getName();
					pass= type1.getPass();
					if(name.equals(userName)&&pass.equals(userPass))
					{
						flag=1;
						permission=type1.getPermission();
						break;
					}
					
				}
				if(flag>0)
				{
					%>
					
					<script type="text/javascript" language="javascript">
		             alert("登陆成功！");
		               </script>
					<%
					if(permission<1)
					{
					%>
						<jsp:forward page="user.jsp" />　
					<%
					}
					else
					{
					%>
						<jsp:forward page="admin.jsp" />　
					<%
					}
				}
				else
				{
					%>
					
					<script type="text/javascript" language="javascript">
		             alert("您输入的用户名或密码错误");
		               </script>
					<%
				}
			}

	


		


%>
        <table class="table1" width="100%" cellspacing="0">
            <tr height="35">
              <td ><font face='宋体' size='6px' >电子会议厅-登陆界面</font></td>         
            </tr>        
        </table>
        <form action="login.jsp" method="post" name="from1" >
        <p>请输入用户名和密码：</p>
        <p>用户名
        &nbsp;  
        <input type="text" name="userName">
        </p>
        <p>密码  
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="password" name="userPass">
        </p>
        <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <button type="button" onclick="window.location.href='register.jsp';">注册</button>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"value="登陆" name="login"> 
        </form>

</body>
</html>