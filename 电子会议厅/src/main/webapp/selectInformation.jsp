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
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="Electronic_conference_room.css">

</head>
<body>
		<form action="dealWithSelectInformation.jsp" method="post" >
        <p>请输入您要查找的班级事务号：</p>事务号
        &nbsp;  
        <input type="text" name="ino">
       <input type="submit"value="查询" > 
        </form>
</body>
</html>