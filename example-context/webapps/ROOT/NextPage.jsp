<jsp:useBean id="user" class="user.UserData" scope="session"/> 
<%@ page language="java" import="java.sql.*"%>
<HTML>
<BODY>
You entered<BR>
Name: <%= user.getUsername() %><BR>
Email: <%= user.getEmail() %><BR>
Age: <%= user.getAge() %><BR>


<%
        try {
 	    Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            out.println("<h1>Driver not found:" + e + e.getMessage() + "</h1>" );
        }
	try {
	    Connection conn = DriverManager.getConnection (
	    	"jdbc:postgresql://db.doc.ic.ac.uk/g1227118_u",
		"g1227118_u", "JwveU76nxZ" );

            Statement stmt = conn.createStatement();
            ResultSet rs;

            rs = stmt.executeQuery("SELECT * FROM Typer");
	    out.println( "<table border=1>" );
            while ( rs.next() ) {
                String id = rs.getString("UserID");
                out.println("<tr><td>"+id+"</td></tr>" );
            }
	    out.println( "</table>" );

            conn.close();
        } catch (Exception e) {
            out.println( "<h1>exception: "+e+e.getMessage()+"</h1>" );
        }
%>

</BODY>
</HTML>
