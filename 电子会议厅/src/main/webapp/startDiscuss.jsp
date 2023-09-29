<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
 <%@page import="jdbc.JdbcUtil"%>
<%@page import="mod.user"%>
<%@page import="Dao.dao"%>
<%@page import="mod.information"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.Import"%>
<!DOCTYPE html>
<html lang="zh">
<body>
<%
   String ino="";
   String iname="";
   String sno=request.getParameter("sno");
   dao dao1= new dao();
   List<information>types= dao1.selectAlliInformations();
%>

<table border="1" collspacing="0" collpadding="0" align="center">
			<tr>
				<th colspan="6">班级事务信息</th>
			</tr>
			<tr>
				<th>事务号</th>
				<th>事务名</th>
				<th>操作</th>
			</tr>
			<%
			   for(information type:types)
			   {
			    ino=type.getIno().toString();
			   	iname=type.getIname();
			%>
			   <tr align="center">
				<td><% out.println(ino); %></td>
				<td><% out.println(iname); %></td>
				<td>
					<a href="discuss.jsp?sno=<%=sno%>&ino=<%=ino%>&iname=<%=iname%>">参与<%=ino%>号班级事务 <<%=iname%>> 的讨论</a>
				</td>
			</tr>
			<%	} %>
		</table>
</body>
</html>