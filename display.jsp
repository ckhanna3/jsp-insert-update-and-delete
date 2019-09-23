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
String sql = "select * from demo";
try{
s = con.createStatement();
rs = s.executeQuery(sql);
%>
<table border="1">
<%
while( rs.next() ){
%><tr>
<td><%= rs.getInt("cat_id") %></td>
<td><%= rs.getInt("parent_id") %></td>
<td><%= rs.getString("cat_name") %></td>
<td><a href="./update.jsp?cat_id=<%= rs.getInt("cat_id")  %>"><button>UPDATE</button></a></td>

<td><a href="./delete.jsp?cat_id=<%= rs.getInt("cat_id")  %>"><button>DELETE</button></a></td>
</tr>
<%
}
%>
</table>
<%
}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}
%>


</body>
</html>