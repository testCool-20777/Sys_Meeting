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
        <link rel="stylesheet" type="text/css" href="Electronic_conference_room.css">
</head>
<body>
<%
    dao dao1= new dao();
    String userName = request.getParameter("userName");
    session.setAttribute("name", userName);
   	int sno=0;
   	String sname="";
    List<student>types= dao1.selectStudentByUserName(userName);
    for(student type:types)
    {
    	sno=type.getSno();
    	sname=type.getSname();
    }
	

%>
       <div id="main">
            <div id="header" align="center"><%="<td>"+"欢迎学号为"+sno+"姓名为"+sname+"的管理员进入网络192班的电子会议厅！"+"</td>"%></div>
            <div id="menuBar" align="center" > 
                <a href="adminForAdministrator.jsp?sname=<%=sname%>&sno=<%= sno%>" class="textMenu" >修改系统信息</a>&nbsp;&nbsp;
                <a href="adminForUser.jsp?name=<%=userName%>&sno=<%= sno%> " class="textMenu">修改个人信息</a>&nbsp;&nbsp;
                <a href="login.jsp" class="textMenu" >放回登陆界面</a> &nbsp;&nbsp;        
            </div>
            <div id="leftMenu">
                <p align="middle" vertical-align：baseline;><font size="6px" face='黑体' >参与班级事务</font></p>
                <ul style="list-style-type: none;font-family: '黑体'; ">
                    <li><a href="startDiscuss.jsp?sno=<%=sno%>" target="iframe_a" style="text-decoration: none;" onClick="showText1()">讨论班级事务</a></li>
                    <li><a href="all_InformationForAdmin.jsp" target="iframe_a" style="text-decoration: none;" onClick="showText2()">浏览班级事务</a></li>
                    <li><a href="selectInformation.jsp" target="iframe_a" style="text-decoration: none;" onClick="showText3()">查询班级事务</a></li>
                    <li><a href="updateMyDiscuss.jsp?sno=<%=sno%> " target="iframe_a" style="text-decoration: none;" onClick="showText3()">讨论信息维护</a></li>
                    <li><a href="addInfotmation.jsp" target="iframe_a" style="text-decoration: none;" onClick="showText2()">发布班级事务</a></li>
                </ul>
            </div>

            <div id="content">
                
                 <div id="show">
                     <br>
                     <br>
                    &nbsp;<span id="t2"></span>
                 </div>
                 <div> <iframe name="iframe_a"  frameborder="0"  height="300px" width="1000px" >               
                </iframe></div>          
                

            </div>
            <div id="footer"> 
                当前日期：<input type="text" id="mydate" value="" size="15" readonly="true" style="border: 0;background-color:  #b3d3e5;">
                当前时间：<input type="text" id="clock" readonly="true" size="10 " style="border: 0;background-color:  #b3d3e5;">
                系统使用时间：<input type="text" id="clock2" readonly="true" size="10 " style="border: 0;background-color:  #b3d3e5;">
            </div>
            <script type="text/javascript" >
                var timeStr="",deteStr="";
                var intervalID;
                var star;
                var end;
                var tid;
                function date()
                {
                   
                    now = new Date();
                    day=now.getDate();
                    month=now.getMonth()+1;
                    year=now.getFullYear();
                    dateStr=year+"年"+month+"月"+day+"日";
                    document.getElementById("mydate").value=dateStr;
                }
                function showTime() {
                    var d = new Date();
                    document.getElementById("clock").value = d.toLocaleTimeString();
                } 
                var sum=0;
                function sumtime()
                {
                    
                    document.getElementById("clock2").value = sum+"秒";
                    sum++;
                   
                }      
                date();
                intervalID = setInterval(showTime, 500);
                intervalID = setInterval(sumtime, 500);
            </script>
                
        </div>
</body>
</html>