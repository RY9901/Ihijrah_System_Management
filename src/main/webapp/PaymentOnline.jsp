<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %> 
<!DOCTYPE html> 
<html> 
<title>Online Payment</title> 
<meta name="viewport" content="width=device-width, initial-scale=1"> 
<head><link rel="stylesheet" href="style.css"> 
<style> 
 
.navbar { 
padding-top:30px; 
  overflow: hidden; 
  background-color: #102e44; 
} 
 
.navbar a { 
  float: right; 
  font-size: 16px; 
  color: white; 
  text-align: center; 
  padding: 16px 14px; 
  text-decoration: none; 
  background-color: #102e44; 
   
} 
 
.dropdown { 
  float: right; 
  overflow: hidden; 
} 
 
.dropdown .dropbtn { 
  font-size: 16px;   
  border: none; 
  outline: none; 
  color: white; 
  padding: 16px 14px; 
  background-color: inherit; 
  font-family: inherit; 
  margin: 0; 
} 
 
.navbar a:hover, .dropdown:hover .dropbtn { 
  background-color: green; 
} 
 
.dropdown-content { 
  display: none; 
  position: absolute; 
  background-color: white; 
  min-width: 160px; 
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2); 
  z-index: 1; 
} 
 
.dropdown-content a { 
  float: none; 
  color: black; 
  padding: 12px 16px; 
  text-decoration: none; 
  display: block; 
  text-align: left; 
  background-color: white; 
} 
 
.dropdown-content a:hover { 
  background-color: #ddd; 
} 
 
.dropdown:hover .dropdown-content { 
  display: block; 
} 
.notification .badge { 
  position: absolute; 
  top: 30px; 
  right: 12px; 
  padding: 5px 10px; 
  border-radius: 50%; 
  background-color: red; 
  color: white; 
} 
 
input[type=text]{ 
  width: 30%; 
  padding: 12px 20px; 
  margin: 8px 0; 
  display: inline; 
  border: 1px solid #ccc; 
  box-sizing: border-box; 
} 
 
button { 
  background-color: grey; 
  color: white; 
  padding: 14px 20px; 
  margin: 8px 0; 
  border: none; 
  cursor: pointer; 
  width: 30%; 
} 
 
button:hover { 
  opacity: 0.8; 
} 
</style> 
</head> 
 
<body> 
 
 
<!-- SIDEBAR --> 
<div class="container" style="padding:0; margin:0; height:100%;width:200px;background-color:#353c49;position:fixed!important;z-index:1;overflow:hidden"> 
<img class="logo" alt="" src="IHijrahLogo.PNG"> 
<h3 style="text-align: center; color: white;">WELCOME</h3> 
<a href="Registration.jsp" class="btn2" style="display:block;padding:50px;">REGISTER COURSE</a> 
<a href="SchedulePartBaru.jsp" class="btn4" style="display:block;padding:50px;">CLASS SCHEDULE</a> 
<a href="PartAnnouncement.jsp" class="btn6" style="display:block;padding:50px;">ANNOUNCEMENT</a> 
<a href="AccountParticipantBARU.jsp" class="btn6" style="display:block;padding:50px;">ACCOUNT</a> 
<form name="action" method="post" style="background-color:#353c49; border: 0px; margin: 0px; padding:0px; ">
<input type="hidden" name="action" value="logout">
<a href="WelcomePage.jsp" class="btn8" style="display:block;padding:50px;">LOGOUT</a> </form> 
 
 
</div>  
<!-- SIDEBAR --> 
 
<!-- TOPBAR -->       
 <div style=" background-color: #102e44; height:100px; color:blue; padding-left:70px; "> 
  
 </div> 
 <!-- TOPBAR --> 
	<%! 
		String registration_id;
		String participant_id;
	%>
	<%
		participant_id = session.getAttribute("participant_id").toString();
		registration_id = session.getAttribute("registration_id").toString();
	%>
	
		<sql:setDataSource	var="Ihijrah" driver="org.postgresql.Driver"
						url="jdbc:postgresql://ec2-176-34-215-248.eu-west-1.compute.amazonaws.com/delu1t92658u0"
						user="zaiaryvqbpwwcb"
						password="731fafeb016f84ea7f87300cbd19a24ba3e96adbaaf92504bc8d945d0302489b" />
						
	<sql:query dataSource="${Ihijrah}" var="result">
		SELECT * FROM registration WHERE participant_id = <%=participant_id%>
	</sql:query>
   
  <div class="container" style="margin: 20px 10px 0px 210px; background-color:white; height:100%; "> 
     
  <p style="font-size:30px;text-align:center;"><b>ONLINE PAYMENT </b></p> 
  
  
   <p style="text-align:center;"> 
   <img src="qr.png" style="height:200px;"></p><br> 
   <p style="text-align:center;">Account Number: <b>162830481023</b><br> 
   Recipient Name: Masjid Sultan Salahuddin Abdul Aziz<br> 
   Bank Name: Maybank</p><br> 
     
     
                 <form method="post" action="PaymentServlet" enctype="multipart/form-data">
                <label for="myFile">Please upload your payment receipt here:</label>
                 
                 <label style="text-align:center;"><b>Bank Name:</b></label> 
    			<input type ="text" placeholder="Enter Bank Name" name="BankName" required>
                
                <input type="file" id="myFile" name="payimage" accept="image/jpeg, image/png, image/jpg">
                 <input type="hidden" id="myFile" name="action" value="savefile">
                 
                 
                 <input type="hidden" id="myFile" name="registration_id" value="<%=registration_id%>">
                
                <input type="submit">Submit</button>
            </form>
            
  
             
 