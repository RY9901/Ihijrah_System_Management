<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Date" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>Schedule List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<head><link rel="stylesheet" href="style.css"></head>

<body>


<!-- SIDEBAR -->
<div class="container" style="padding:0; margin:0; height:100%;width:200px;background-color:#353c49;position:fixed!important;z-index:1;overflow:hidden;">
<img class="logo" alt="" src="IHijrahLogo.PNG">
<h3 style="text-align: center; color: white; padding-bottom:2em;">WELCOME</h3>
<a href="SAVerifiedList.jsp" class="btn1" style="display:block; font-size:11px;padding:28px;">PAYMENT VERIFICATION </a>
<a href="SAschedulelist.jsp" class="btn2" style="display:block; font-size:11px;padding:28px;">CLASS SCHEDULE</a>
<a href="SAAnnouncementList.jsp" class="btn3" style="display:block; font-size:11px;padding:28px;">ANNOUNCEMENT</a>
<a href="SARegisterStaff.jsp" class="btn4" style="display:block; font-size:11px;padding:28px;">REGISTER STAFF</a>
<a href="SAStaffList.jsp" class="btn5" style="display:block; font-size:11px;padding:28px;">STAFF LIST</a>
<a href="SAAccount.jsp" class="btn6" style="display:block; font-size:11px;padding:28px;">ACCOUNT</a>
<a href="StaffLogin.jsp" class="btn7" style="display:block; font-size:11px;padding:28px;">LOGOUT</a>

</div>
<!-- SIDEBAR -->

<!-- TOPBAR --> 
<div style=" background-color: #102e44; height:100px; color:blue; padding-left:70px; "></div>      
 <!-- TOPBAR --> 
 
 

  <div class="container" style="margin: 20px 10px 0px 210px; background-color:#ffffff; height:800px; ">
  
  <h1 style=text-align:center;>SCHEDULE DETAILS</h1>
    
    <!-- FILL IN FORM -->
    <form action="ScheduleServlet" method="post">
    

      <div class="form" style=""font-size:30px;height:200px;>
        <div class="row"style=;>
            <div class="col-25" style=margin-left:50px;padding-top:30px;>
            <label for="a_date">Date</label>
            </div>
          
            <div class="col-75"style="padding:15px;margin-left:30px;"  >
            <input type="date" id="a_date" name="date" placeholder="DD-MM-YYYY" style=" width:1500px;" required>
            </div>
          </div>
    
        <div class="row">
            <div class="col-25"style=margin-left:50px;>
            <label for="details">Time</label>
            </div>
      
            <div class="col-75"style=padding:15px;margin-left:30px;>
            <input type="time" id="time" name="time" placeholder="" min="09:00" max="18:00" required>
            </div>
        </div>
        
        <div class="row">
            <div class="col-25"style=margin-left:50px;>
            <label for="details">Description</label>
            </div>
      
            <div class="col-75"style=padding:15px;margin-left:30px;>
            <input type="text" id="details" name="description" placeholder="Schedule details" style="height:200px; width:1500px;" required>
            </div>
        </div>
        

        
        
        <label for="cars"style=padding:15px;margin-left:30px;>Choose Course:</label>
        <select name="course" id="course">
          <option value="901">901 - Hajj</option>
          <option value="902">902 - Umrah</option>
        </select>
      
    
        <div class="row">
            <input type="hidden" value="AddSchedule" name="action" >  
          <input type="submit" style="margin-left:20px;">  
          <input type="reset">
          </div>
        </div>
      </form>
      
    <!-- FILL IN FORM --> 
    
  </div>
    
</body>
</html>