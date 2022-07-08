<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<title>Announcement List</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<head><link rel="stylesheet" href="ListStyle.css"></head>

<body>


<!-- SIDEBAR -->
<div class="container" style="padding:0; margin:0; height:100%;width:200px;background-color:#353c49;position:fixed!important;z-index:1;overflow:hidden;">
<img class="logo" alt="" src="IHijrahLogo.PNG">
<h3 style="text-align: center; color: white; padding-bottom:2em;">WELCOME</h3>
<a href="VerifiedList" class="btn2" style="display:block; font-size:13px;">PAYMENT VERIFICATION </a>
<a href="schedulelist" class="btn4" style="display:block; font-size:13px;">CLASS SCHEDULE</a>
<a href="AnnouncementList.jsp" class="btn5" style="display:block; font-size:13px;">ANNOUNCEMENT</a>
<a href="dashboardstaff.jsp" class="btn6" style="display:block; font-size:13px;">ACCOUNT</a>
<a href="StaffLogin.jsp" class="btn8" style="display:block; font-size:13px;">LOGOUT</a>

</div>
<!-- SIDEBAR -->

<!-- TOPBAR -->      
 <div style=" background-color: #102e44; height:100px; color:blue; padding-left:70px; "><img class="user" alt="" src="user.jpg"></div>
 <!-- TOPBAR -->   


	<div class="container" style="margin: 20px 10px 0px 210px; background-color:lightgrey; height:600px; ">
	
	
		
		<!-- FILL IN FORM -->
		<h2>ANNOUNCEMENT LIST</h2><br><br>
		 <a href='CreateAnnouncement.jsp?id= <%session.getAttribute("Staff_ID");%>' style="  margin-left:1150px; margin-right:20px; height:5px; text-align: center; background-color: #3366ff; border-radius: 20px; padding:20px;">Add Announcement</a>
		<br><br><br><br>
		<!-- FILL IN FORM -->
		
		<%session.getAttribute("Staff_ID");%>
       <table class="table table-bordered table-striped table-hover" style="margin-left:20px; width:97%; ">
   <thead style="background-color: #000000">
       <tr style="color: white">
         <th>No.</th>
         <th>Name</th>
         <th>Date</th>
         <th>Action</th>
         
         

        </tr>
    </thead>
    <tbody style="border: solid black 1px;">
       <%
       String DB_DRIVER = "org.postgresql.Driver";
   	String DB_CONNECTION = "jdbc:postgresql://ec2-176-34-215-248.eu-west-1.compute.amazonaws.com" +"/delu1t92658u0";
   	String DB_USER = "zaiaryvqbpwwcb";	
   	String DB_PASSWORD = "731fafeb016f84ea7f87300cbd19a24ba3e96adbaaf92504bc8d945d0302489b";

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
         <td style=" text-align: center; border: solid black 1px;"><%=res.getString("announcement_id")%></td>
         <td style=" text-align: center; border: solid black 1px;"><%=res.getString("announcement_detail")%></td>
         <td style=" text-align: center; border: solid black 1px;"><%=res.getString("announcement_date")%></td>

         <td class="text-center" style=" text-align: center; border: solid black 1px;">
           <a href='ViewAnnouncement.jsp?u=<%=res.getString("announcement_id")%>' class="btn btn-warning" style= "padding:20px; background-color:#33cc33 ">Edit</a>
           <a href='DeleteAnnouncement.jsp?d=<%=res.getString("announcement_id")%>' class="btn btn-danger" style= "padding:20px; background-color: #e60000" onclick="ConfirmDelete()" id="id01">Delete</a>
           
         </td>
        </tr>
        <%
       }
        %>
         
    </tbody>
</table>
	</div>
	
	
	
<div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content" action="/action_page.php">
    <div class="modal-container">
      <h1>Delete Announcement</h1>
      <p>Are you sure you want to delete these announcement?</p>
      
    
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="deletebtn">Delete</button>
      </div>
    </div>
  </form>
  

  
</div>
<script>
//Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}

function ConfirmDelete()
{
  return confirm("Are you sure you want to delete?");
}
</script>
</body>
</html>
