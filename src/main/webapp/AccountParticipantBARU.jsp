<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<title>Account</title>
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
<div class="container" style="padding:0; margin:0; height:100%;width:200px;background-color:#353c49;position:fixed!important;z-index:1;overflow:hidden">
<img class="logo" alt="" src="IHijrahLogo.PNG">
<h3 style="text-align: center; color: white;">WELCOME</h3>
<a href="#" class="btn1" style="display:block; padding:42px;">DASHBOARD</a>
<a href="#" class="btn2" style="display:block;padding:42px;">REGISTER COURSE</a>
<a href="#" class="btn4" style="display:block;padding:42px;">CLASS SCHEDULE</a>
<a href="#" class="btn6" style="display:block;padding:42px;">ACCOUNT</a>
<a href="#" class="btn8" style="display:block;padding:42px;">LOGOUT</a>

</div>
<!-- SIDEBAR -->

<!-- TOPBAR -->      
 <div style=" background-color: #102e44; height:100px; color:blue; padding-left:70px; ">
 <div class="navbar">

  <div class="dropdown">
    <button class="dropbtn">Announcement 
      <i class="fa fa-caret-down">
      <a href="#" class="notification">
      <span class="badge">3</span></i></a>
    </button>
    <div class="dropdown-content">
      <a href="#">Class is cancelled</a>
      <a href="#">Class will be held at dataran masjid</a>
      <a href="#">Class is postponed to 3 p.m</a>
    </div>
  </div> 
</div>
 
 </div>
 <!-- TOPBAR -->   

<% Object name = session.getAttribute("participant_name"); 
	Object email = session.getAttribute("participant_email");
	Object phone = session.getAttribute("participant_phoneno");
	Object password = session.getAttribute("participat_password");
	Object status = session.getAttribute("registration_status");%>
	
	<div class="container" style="margin: 20px 10px 0px 210px; background-color:#004a80; height:600px; ">
		
  <p style="font-size:25px;">ACCOUNT
  <button onclick="document.getElementById('id02').style.display='block'" id="myBtn" style="box-shadow: 0 0 30px rgba(0, 0, 0, 0.40);margin-left:950px;background-color: red;color:white;position: relative; left:10px; width: 100px;border-color:grey; padding: 10px; border-radius: 10px;">Deactivate Account</button>
 </p>
   <form method="post" action="AccounServlet" >
		
		<div class="part">
			<label>Name</label> 
			<input type="text" name="partName" style="margin-left:55px;" value=<%=name%>>
		</div>
		<br><br>
		<div class="part">
			<label>Email</label> 
			<input type="text" name="partEmail"style="margin-left:55px;" value=<%=email%>>
		</div>
		<br><br>
		<div class="part">
			<label>Phone Number</label> 
			<input type="text" name="partPhone" value=<%=phone%>>
		</div>
		<br><br>
		<div class="part">
			<label>Status</label> 
			<input type="text" name="status" style="margin-left:55px;" value= <%=status%>>
		</div>
	</form>

  			<input type="hidden" name="action" value="logout" >
			<button type="submit" id="myBtn" style="box-shadow: 0 0 30px rgba(0, 0, 0, 0.40);background-color: #e0b012;color:white;position: relative; left:10px; width: 100px;border-color:grey; padding: 10px; border-radius: 10px;">Log Out</button>
			
			<input type="hidden" name="action" value="updateAcc" >
			<button type="submit" id="myBtn" style="background-color: #e0b012;color:white;position: relative; left:10px; width: 100px;border-color:grey;padding: 10px; border-radius: 10px;margin-left:850px;">Edit Profile</button>

  </div>
            

 
          
<div id="id02" class="modal">
  
  <form class="modal-content animate" action="deleteAcc" method="post">
    
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
     <div class="modal-content">
    <span class="close">&times;</span>
    <h1>ALERT!!!!</h1>
    <p>Are you sure you want to dactivate your account?</p><br><br><br>
    <button id="myBtn" style="background-color: green;color:white;position: relative; right:10px; width: 20%;border-color:green;padding: 10px; border-radius: 10px;margin-left:120px;"a href="proceedRegister.html">Yes</a></button>
  	<button id="myBtn" style="background-color: Red;color:white;position: relative; left:10px; width: 20%;border-color:red;padding: 10px; border-radius: 10px;margin-right:120px;"a href="proceedRegister.html">No</a></button>
  
  </div>
  </form>
    </div>		
</body>

<script>
// Get the modal
var modal = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>
</html>
