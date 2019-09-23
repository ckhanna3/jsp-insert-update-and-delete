<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>

<%@include file='header.jsp' %>

<%
if(request.getMethod().toLowerCase().equals("get") && request.getParameter("cat_id") !=null){


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

try {
con = DriverManager.getConnection(
connectionUrl + dbName, userId, password);

} catch (Exception e) {
e.printStackTrace();
}

int cat_id = Integer.parseInt(request.getParameter("cat_id"));
String sql = "DELETE FROM demo where cat_id=" + cat_id;
try{
s = con.createStatement();
int i = s.executeUpdate(sql);

out.print("<h1>Record Deleted! cat ID :"+cat_id+"</h1>");


}
catch(Exception sqe)
{
request.setAttribute("error", sqe);
out.println(sqe);
}

}

%>
</body>
</html>




