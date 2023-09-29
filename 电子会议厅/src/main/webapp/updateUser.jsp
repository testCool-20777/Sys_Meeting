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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
<%
    dao dao1= new dao();
    String name = request.getParameter("name");
    int sno=Integer.parseInt(request.getParameter("sno"));
    String sname="";
    String pass="";
    String permission1=request.getParameter("permission1");
    int permission=0;
    List<user>types = dao1.selectUser(name);
    for(user type:types)
    {
    	pass=type.getPass();
    	permission=type.getPermission();
    }
    List<student>types1= dao1.selectStudentByUserName(name);
    for(student type:types1)
    {
    	sname=type.getSname();
    }
    
%>
        <table class="table1" width="100%" cellspacing="0">
            <tr height="35">
              <td ><font face='宋体' size='6px' >电子会议厅-用户信息管理界面</font></td>         
            </tr>        
        </table>
        <form action="userUpdate.jsp" method="post" name="from1" >
         <p>当前学号：     
        <input type="text" name="oldSno" readonly="readonly" value="<%=sno%>" >
        </p>
         <p>修改后的学号：     
        <input type="text" name="newSno" value=<%=sno%> >
        </p>
        <p>当前名字：    
        <input type="text" name="oldSname"  value="<%=sname%>" readonly="readonly">
        </p>
        <p>修改后的名字：    
        <input type="text" name="newSname"  value=<%=sname%>>
        </p>
        <p>当前用户名：
        <input type="text" name="oldUserName"  value="<%=name%>"  readonly="readonly" >
        </p>
                <p>修改后的用户名：
        <input type="text" name="newUserName"    value="<%=name%>">
        </p>
        <p>当前密码：&nbsp;&nbsp;&nbsp;   
        <input type="text" name="oldUserPass"  value="<%=pass%>" readonly="readonly">
        </p>
                <p>修改后的密码：&nbsp;&nbsp;&nbsp;   
        <input type="text" name="newUserPass"  value="<%=pass%>" >
        </p>

   
 
            <p>当前账户权限：&nbsp;&nbsp;&nbsp;  
           <input type="text"  value="<%=permission%>" readonly="readonly">
            </p>
               
         <p>修改后的权限（0为普通用户，1为管理员）：&nbsp;&nbsp;&nbsp;   
        <input type="text" name="permission" value="<%=permission%>">
        </p>

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="submit"value="修改" >&nbsp;&nbsp;
		<input type="button" value="返回"onclick="history.go(-1);">
        </form>
</body>
</html>