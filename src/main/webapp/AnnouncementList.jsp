<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>Staff List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<head><link rel="stylesheet" href="style.css">
<style>
.styled-table {
    border-collapse: collapse;
    margin: 25px 0;
    font-size: 0.9em;
    font-family: sans-serif;
    min-width: 400px;
    box-shadow: 0 0 30px rgba(0, 0, 0, 0.40);
    background-color: white;
}
.styled-table thead tr {
    background-color: #007c98;
    border-radius: 10px;
    color: #ffffff;
    text-align: left;
}
.styled-table th,
.styled-table td {
    padding: 12px 15px;
}
.styled-table tbody tr {
    border-bottom: 1px solid #dddddd;
}


.styled-table tbody tr:last-of-type {
    border-bottom: 2px solid #008198;
}

tr:hover {
color: #5b0363;
font-weight: bold;}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 0px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
  padding:10px;
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>

<body>


<!-- SIDEBAR -->
<div class="container" style="padding:0; margin:0; height:100%;width:200px;background-color:#353c49;position:fixed!important;z-index:1;overflow:hidden;">
<img class="logo" alt="" src="IHijrahLogo.PNG">
<h3 style="text-align: center; color: white; padding-bottom:2em;">WELCOME</h3>
<a href="VerifiedList.jsp" class="btn2" style="display:block; font-size:13px;">PAYMENT VERIFICATION </a>
<a href="schedulelist.jsp" class="btn4" style="display:block; font-size:13px;">CLASS SCHEDULE</a>
<a href="AnnouncementList.jsp" class="btn5" style="display:block; font-size:13px;">ANNOUNCEMENT</a>
<a href="Account.jsp" class="btn6" style="display:block; font-size:13px;">ACCOUNT</a>
<a href="WelcomePage.jsp" class="btn7" style="display:block; font-size:13px;">LOGOUT</a>

</div>
<!-- SIDEBAR -->

<!-- TOPBAR -->      
<div style=" background-color: #102e44; height:100px; color:blue; padding-left:70px; "></div> 
 <!-- TOPBAR -->
 
 <div class="container" style="margin: 20px 10px 0px 210px; background-color:lightgrey; height:500px; ">
  
  
    
    <!-- FILL IN FORM -->
    <p style=" text-align: center;font-size:30px;"><b>ANNOUNCEMENT LIST</b></p><br><br>
    
    <!-- FILL IN FORM -->
    
    
    <%session.getAttribute("Staff_ID");%>
       <table class="styled-table" style="position: relative; right:-5px; width:99%">
   <thead>
       <tr>
         <th style=" text-align: center; ">No.</th>
         <th style=" text-align: center; ">Name</th>
         <th style=" text-align: center; ">Action</th>
         
         </tr>
    </thead>
    <tbody>
 
       <%
        String DB_DRIVER = "org.postgresql.Driver";
     String DB_CONNECTION = "jdbc:postgresql://localhost:5432/postgres";
     String DB_USER = "postgres";  
     String DB_PASSWORD = "system";

       Connection con = null;
       Statement stat = null;
       ResultSet res = null;
       
       Class.forName(DB_DRIVER);
       con = DriverManager.getConnection(DB_CONNECTION,DB_USER,DB_PASSWORD);
       stat = con.createStatement();
       String data = "select * from announcement order by announcement_id";
       res = stat.executeQuery(data);
       while(res.next()){
       %>
       <tr>
         <td style=" text-align: center; border: solid grey 1px;"><%=res.getString("announcement_id")%></td>
         <td style=" text-align: center; border: solid grey 1px;"><%=res.getString("announcement_detail")%></td>

         <td class="text-center" style=" text-align: center; border: solid grey 1px;">
           <a href='ViewAnnouncement.jsp?u=<%=res.getString("announcement_id")%>' class="btn btn-warning" style= "padding:10px;border-radius:20px; background-color:#4B6FE8;font-size:15px;">Edit</a>
           <a onclick="checkDelete()" href='DeleteAnnouncement.jsp?d=<%=res.getString("announcement_id")%>' id="myBtn" style= "padding:10px;border-radius:20px;font-size:15px; background-color: #e60000;border-color:#e60000;">Delete</a>
           
           
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
<br><br>
 <a href='CreateAnnouncement.jsp?id= <%session.getAttribute("Staff_ID");%>' style="  margin-left:10px;font-size:15px;text-align: left; background-color: #353c49; border-radius: 10px; padding:20px;">Add Announcement</a>
    <br><br>
  </div>
   
  
</body>

</body>
<script>
//Get the modal


function checkDelete() {
	var result = confirm('Sure want to delete?');
	if (result == false) {
		event.preventDefault();
	}
}
</script>

</html>