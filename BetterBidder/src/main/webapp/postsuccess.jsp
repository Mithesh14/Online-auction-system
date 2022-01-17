<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.BetterBidder.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <meta charset="UTF-8">
    <title>Auction Created Successfully!</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Roboto:300);

        body {
            font-family: "Roboto", sans-serif;
            background-image: url('download.jpg');
            background-attachment: fixed;
            height: 710px;


        }

        h2 {
            color: white;
            margin-left: 42%;
        }

        form {
            margin-top: 70px;
            margin-left: 40%;
            border: 3px solid white;
            border-radius: 5px;
            width: 20%;
            height: 470px;
            padding: 30px 30px;
            background-color: white;
        }

        h3 {
            color: #982bd2;
            font-weight: bold;
        }

        #bt2 {

            border: 1px solid #081285;
            font: 17px;
            padding: 8px 8px 8px 8px;
            border-radius: 2px;
            margin-bottom: 0.5rem;
            width: 270px;
        }

        #bt1 {

            border: 1px solid #081285;
            font: 17px;
            padding: 8px 8px 8px 8px;
            border-radius: 2px;
            margin-bottom: 0.5rem;
        }

        #bt3 {
            border: none;
            background: #473bcd;
            color: white;
            padding: 16px;
            font-size: 16px;
            cursor: pointer;
            text-decoration: none;
        }

        #bt3:hover {
            background: #67cbda;
            color: black;
        }
    </style>
</head>

<body style="background-color:bisque;">
    <div id="form">
        <h2> Your Auction has been created !</h2><br>
        <a id="bt3" href="success.jsp">Return to menu</a>
    </div>

    <%

try {

	//Get the database connection
	ApplicationDB db = new ApplicationDB();
	Connection con = db.getConnection();

	//Create a SQL statement
	Class.forName("com.mysql.jdbc.Driver");
	Statement stmt = con.createStatement();

	String itemID = request.getParameter("int_maxIID");
	String v = "";

	//QUERY 1: determine if assembled_cpu mobile or laptop
	String query1 = ("SELECT * FROM mobile WHERE itemID = " + itemID);
	System.out.println(query1);
	ResultSet result1;
    result1 = stmt.executeQuery(query1);
    if(result1.next()==true){v = "mobile";}
    else
    {
        String query2 = ("SELECT * FROM laptop WHERE itemID = " + itemID);
        System.out.println(query2);
        ResultSet result2;
        result2 = stmt.executeQuery(query2);
        if(result2.next()==true){v = "laptop";}
        else
        {
            String query3 = ("SELECT * FROM assembled_cpu WHERE itemID = " + itemID);
            ResultSet result3;
            System.out.println(query3);
            result3 = stmt.executeQuery(query3);
            if(result3.next()==true){v = "assembled_cpu";}
        }
    }
	//QUERY 2: extract name, type, att1, att2
    String att1, att2;
	if(v.equals("mobile")){att1 = "megapixels"; att2 = "ram";}
	else if(v.equals("laptop")) {att1 = "storage"; att2 = "ram";}
	else {att1 = "storage"; att2 = "ram";}

	ResultSet result4;
	String query4 = "SELECT * FROM " + v + " WHERE itemID = " + itemID;
	System.out.println(query4);
	result4 = stmt.executeQuery(query4);
	result4.next();
	String att1Result = result4.getString(att1);
	String att2Result = result4.getString(att2);
	String type = result4.getString(v + "_type");
	String name = result4.getString("name");

	//QUERY 3: check if this item's fields match that of any alert
	ResultSet result5;
	String query5 = "SELECT * FROM alerts a WHERE (a.name = '' OR a.name = '" + name + "')";
	query5 += "AND (a.type = '' OR a.type = '" + type + "')";
	query5 += "AND (a.att1 = '' OR a.att1 = '" + att1Result + "')";
	query5 += "AND (a.att2 = '' OR a.att2 = '" + att2Result + "')";
	System.out.println(query5);
	result5 = stmt.executeQuery(query5);
	//QUERY 4: if they do, get email of the lucky guy
	ArrayList<String> emails = new ArrayList<String>();
	while(result5.next())
	{
		System.out.println("loop");
		String alertID = result5.getString("alertID");

		ResultSet result6;
		Statement stmt2 = con.createStatement();
		String query6 = "SELECT * FROM hasAlerts WHERE alertID = " + alertID;
		System.out.println(query6);
		result6 = stmt2.executeQuery(query6);
		result6.next();
		emails.add(result6.getString("email"));
		//QUERY 5: add to notification table itemID and body with attributes filled in

	}
	int index = 0;
	while(index<emails.size()){
	String query7 = "INSERT INTO notifications VALUES(0, '" + emails.get(index) + "', " + itemID;
	query7+=", 'An item matching your alert has gone on sale with name: ";
	query7+= name + ", type: " + type + ", " + att1 + ": " + att1Result + ", " + att2 + ": " + att2Result + "')";

	System.out.println(query7);
    stmt.executeUpdate(query7);
    index++;}


    %>

    <br>

    <%
    db.closeConnection(con);
    con.close();
} catch (Exception ex) {
	out.print(ex);
	out.print("<br>Oops!! Sorry, there is some problem!");
}


%>


</body>

</html>