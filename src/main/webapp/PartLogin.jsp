<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
  margin: 24px 0 12px 0;
  background: white;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
  background: white;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
   
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
.grid-container {
  display: grid;
  grid-template-columns: auto auto ;
  background-color: white;
  height: 100%;
  
}

.grid-container > div {
  background-color: white;
  text-align: center;
  padding: 20px 0;
  font-size: 30px;
  height: 100%;
}
.item1 {

  grid-row-start: 1;
  grid-row-end: 1;
}
.item1 {

 height: 250px;
}
</style>
</head>
<body>


<div class="grid-container">

 <div class="item1">

 	<div class="imgcontainer">
    <img src="pic4.jpg" style="width:80%;height:500px;">
  </div>
</div>

<form action="PLogin" method="post">
	<div class="item1">
 <h2 style="text-align:center;">Login</h2>
  <br>
  		<div class="partL">
			<label><b>Email</b></label> 
			<input type="text" name="participant_email" required>
		</div>
		<br><br>
		<div class="partL">
			<label><b>Password</b></label> 
			<input type="password" name="participant_password" required>
		</div>
		<br><br><br><br>
		<div>
			<input type="hidden" name="action" value="login" >
			<button type="submit">LOGIN</button>
		</div>
</div>
</form>

  </div>
</body>
</html>

    