<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@include file='header.jsp' %>


<%
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "test";
String userId = "root";
String password = "";

if(request.getMethod().toLowerCase().equals("get") && request.getParameter("cat_id") !=null){

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection con = null;
Statement s = null;
ResultSet rs = null;
try {
con = DriverManager.getConnection(
connectionUrl + dbName, userId, password);

} catch (Exception e) {
e.printStackTrace();
}
int cat_id = Integer.parseInt(request.getParameter("cat_id"));
String sql = "select * from demo where cat_id='"+cat_id+"'";
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>
<form action="update.jsp" method="post">
<table border="1">
<%
while( rs.next() ){
%><tr>
<td><input type='text' value='<%= rs.getInt("cat_id") %>' name="cat_id"></td>
<td><input type='text' value='<%= rs.getInt("parent_id") %>' name="p_id"></td>
<td><input type='text' value='<%= rs.getString("cat_name") %>' name="fname"></td>
</tr>
<%
}
%>
</table>

<input type="submit" value="update">
</form>
<%
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}
}else if(request.getMethod().toLowerCase().equals("post")){
	try {
		Class.forName(driverName);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection con = null;
		Statement s = null;
		try {
		con = DriverManager.getConnection(
		connectionUrl + dbName, userId, password);

		} catch (Exception e) {
		e.printStackTrace();
		}
		int cat_id = Integer.parseInt(request.getParameter("cat_id"));
		int p_id = Integer.parseInt(request.getParameter("p_id"));
		String name = request.getParameter("fname");
		
		String sql = "update demo set cat_id = '"+cat_id+"',parent_id='"+p_id+"',cat_name='"+name+"' where cat_id='"+cat_id+"'";
		try{
		s = con.createStatement();
		int i=s.executeUpdate(sql);
		if(i==1){
			out.print("<script>alert('Data Inserted Successfully!');</script>");
		}
		}
		catch(Exception e){e.printStackTrace();}
		finally{
		if(s!=null) s.close();
		if(con!=null) con.close();
		}
		
}
%>
<body>
</html>