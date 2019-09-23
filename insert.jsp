<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
    
    
    <%@include file='header.jsp' %>
<%

if(request.getMethod().toLowerCase().equals("post")){
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
int cat_id = Integer.parseInt(request.getParameter("cat_id"));
int p_id = Integer.parseInt(request.getParameter("p_id"));
String name = request.getParameter("fname");
String sql = "insert into demo values('"+cat_id+"','"+p_id+"','"+name+"')";
try{
s = con.createStatement();
int i=s.executeUpdate(sql);
if(i==1){
	out.print("<script>alert('Data Inserted Successfully!');</script>");
}

}
catch(Exception e){e.printStackTrace();}
finally{
if(rs!=null) rs.close();
if(s!=null) s.close();
if(con!=null) con.close();
}
}
%>
<form name="test" action="insert.jsp" method="post">
<p>  CAT ID: <input type="text" name="cat_id"></p>
<p>  PID: <input type="text" name="p_id"></p>
<p>  Name: <input type="text" name="fname"></p>
  <input type="submit" value="Submit">
  <br>
 <!--  Name: <input type="text" name="fname">
  <input type="submit" value="Update"> -->
</form>
</body>
</html>