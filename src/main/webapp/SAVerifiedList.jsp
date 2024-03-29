<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="ListStyle.css">
<title>Verified List</title>
</head>
<body>

<div class="container" style="padding:0; margin:0; height:100%;width:200px;background-color:#353c49;position:fixed!important;z-index:1;overflow:hidden;">
<img class="logo" alt="" src="IHijrahLogo.PNG">
<h3 style="text-align: center; color: white; padding-bottom:2em;">WELCOME</h3>
<a href="SAVerifiedList.jsp" class="btn1" style="display:block; font-size:11px;padding:30px;">PAYMENT VERIFICATION </a>
<a href="SAschedulelist.jsp" class="btn2" style="display:block; font-size:11px;padding:30px;">CLASS SCHEDULE</a>
<a href="SAAnnouncementList.jsp" class="btn3" style="display:block; font-size:11px;padding:30px;">ANNOUNCEMENT</a>
<a href="SARegisterStaff.jsp" class="btn4" style="display:block; font-size:11px;padding:30px;">REGISTER STAFF</a>
<a href="SAStaffList.jsp" class="btn5" style="display:block; font-size:11px;padding:30px;">STAFF LIST</a>
<a href="ParticipantListAccount.jsp" class="btn5" style="display:block; font-size:11px;padding:30px;">PARTICIPANT LIST</a>
<a href="SAAccount.jsp" class="btn6" style="display:block; font-size:11px;padding:30px;">ACCOUNT</a>
<a href="WelcomePage.jsp" class="btn7" style="display:block; font-size:11px;padding:30px;">LOGOUT</a>

</div>
<!-- TOPBAR -->      
 <div style=" background-color: #102e44; height:100px; color:blue; padding-left:70px; "><img class="user" alt="" src="user.jpg"></div>
 <div class="container" style="margin: 20px 10px 0px 210px; background-color:lightgrey; height:600px; ">
		
    <!-- FILL IN FORM -->
    <h2>VERIFIED LIST</h2><br>
    
         <a href=SANotVerifiedList.jsp style="  margin-left:1500px; margin-right:20px;font-size:20px; height:5px; text-align: center; background-color: #ff0000; border-radius: 20px; padding:20px;">Unverified List</a>


<sql:setDataSource var="ic" driver="org.postgresql.Driver"
                   url="jdbc:postgresql://localhost:5432/postgres"
                   user = "postgres"
                   password="system"/>
<sql:query dataSource="${ic}" var="oc">
    SELECT DISTINCT(registration_id)registration_id,payment_id,payment_date,payment_status,participant_name from registration join payment using (registration_id) join participant using (participant_id) where registration_status != 'Not Verified'
</sql:query>

 <br><br><br>
<table class="table table-bordered table-striped table-hover" style="margin-left:20px; width:97%; ">
   <thead style="background-color: #000000">
       <tr style="color: white">
         <th>Registration ID</th>
         <th>Payment ID</th>
         <th>Participant Name</th>
         <th>Payment Date</th>
         <th>Payment Status</th>
         <th>Payment Receipt</th>
         <th>Remarks</th>
         

        </tr>
    </thead>
    <tbody style="border: solid black 1px;">
               <c:forEach var="register" items="${oc.rows}">
                   <tr>
               
                         <td style=" text-align: center; border: solid black 1px;">
                    <c:out value="${register.Registration_ID}"/>
                   
                </td>
                     <td style=" text-align: center; border: solid black 1px;">
                        <c:out value="${register.Payment_ID}"/>
                    </td>
                     <td style=" text-align: center; border: solid black 1px;">
                        <c:out value="${register.participant_name}"/>
                    </td>
                     <td style=" text-align: center; border: solid black 1px;">
                        <c:out value="${register.Payment_Date}"/>
                    </td>
 					<td style=" text-align: center; border: solid black 1px;">
                         <c:out value="${register.Payment_Status}"/>
                    </td>
  					<td style=" text-align: center; border: solid black 1px;">
                         <a href="PaymentServlet?id=${register.Payment_ID}" style=" color:blue; font-size: 20px; hover:none;">View Receipt</a>
                    </td>
  					<td style=" text-align: center; border: solid black 1px;">
                         <c:out value="${register.Payment_Status}"/>
                    </td>
                    
                    
            
</tr>
            </c:forEach>
                        
            
         </tbody>
            
           
        </table>
        
   
</body>

</html>