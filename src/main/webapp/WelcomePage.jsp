<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
    pageEncoding="ISO-8859-1"%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="ISO-8859-1"> 
<title>User</title> 
<style> 
input[type=text], input[type=password] { 
  width: 100%; 
  padding: 12px 20px; 
  margin: 8px 0; 
  display: inline-block; 
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
  width: 100%; 
} 
 
button:hover { 
  opacity: 0.8; 
} 
 
 
.imgcontainer { 
  text-align: center; 
  
  background: #353c49; 
} 
 
img.avatar { 
  width: 40%; 
  border-radius: 50%; 
} 
 
.container { 
  background: #353c49; 
  height:900px;
} 
 
span.psw { 
  float: right; 
  
} 
 
/* Change styles for span and cancel button on extra small screens */ 
@media screen and (max-width: 300px) { 
  span.psw { 
    
     float: none; 
  } 
 
} 
.grid-container { 
  display: grid; 
  grid-template-columns: auto auto ; 
  background-color: white; 
  height: 900px; 
   
} 
 
.grid-container > div { 
  background-color: white; 
  text-align: center; 
  font-size: 30px; 
  height: 100%; 
} 
.item1 { 
 
  grid-row-start: 1; 
  grid-row-end: 1; 
} 

</style> 
</head> 
<body> 
 
 
<div class="grid-container"> 
 
 <div class="item1"> 
  <div class="imgcontainer"> 
    <img src="pic2.jpg" style="width:950px;height:900px;"> 
  </div> 
</div> 
<div class="item1"> 
  <div class="container"> 
  <img class="logo" alt="" src="IHijrahLogo.PNG" style="width:170px;border-radius: 50%;"> 
  <p style="font-size:30px;font-family:Georgia,serif;text-align: center;color:white;">Masjid Sultan Salahuddin Abdul Aziz Shah</p> 
          <br> 
          <p style="text-align: center;color:white;font-size:15px;">'The knolls of Safa and Marwah are among the rites decreed by God. Anyone who observes Hajj or Umrah commits no error by  
          traversing the distance between them. If one volunteers nore righteous works, then God is appreciative, Omniscient., - Quran 2:158</p> 
     
     
    <img src="user.png" style="width:100px;margin-right:110px;"> 
    <img src="user.png" style="width:100px;margin-left:80px;"> 
    <br> 
    <form action=""> 
    <input style="width:100px;margin-right:60px; background-color:#C3C6C8; padding:10px 16px; cursor: pointer; text-align:center;" onclick="window.location='StaffLogin.jsp'" value="Staff"> 
    <input style="width:100px;margin-left:95px; background-color:#C3C6C8; padding:10px 16px; cursor: pointer; text-align:center;" onclick="window.location='PartLogin.jsp'" value="Participant"> 
    </form> 
     
   
     
  </div>   
</div> 
  
  </div> 
</body> 
</html>