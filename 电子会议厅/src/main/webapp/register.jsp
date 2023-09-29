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
        <table class="table1" width="100%" cellspacing="0">
            <tr height="35">
              <td ><font face='宋体' size='6px' >电子会议厅-注册界面</font></td>         
            </tr>        
        </table>
        <form action="dealWithRegister.jsp" method="post" name="from1" >
        <p>请输入以下信息：</p>
        <p>学号
            &nbsp;  
            <input type="text" name="sno">
        </p>
        <p>姓名
            &nbsp;  
            <input type="text" name="sname">
            </p>
        <p>用户名
        &nbsp;  
        <input type="text" name="userName">
        </p>
        <p>密码  
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="password" name="userPass">
        </p>
        <input type="submit"value="注册"> 
        </form>
</body>

</html>