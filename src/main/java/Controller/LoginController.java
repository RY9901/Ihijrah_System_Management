package Controller;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Statement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;



/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//try	
        response.setContentType("text/html");
        String action = request.getParameter("action");

        switch (action) {
		   case "signupStaff":
		        signupStaff(request, response);
		        break;
		    case "loginStaff":
		        loginStaff(request, response);
		        break;
		    case "logout":
		    	logout(request, response);
		    	break;
		    case "deleteStaff":
		        deleteStaff(request, response);
		        break;
		    case "updateStaff":
		        updateStaff(request, response);
		        break;
		}
	}
        
	
 

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		  HttpSession session = request.getSession();
	        session.removeAttribute("Staff_ID");
	        session.removeAttribute("Staff_Name");
	        session.invalidate();
	        response.sendRedirect("StaffLogin.jsp");
	}

		// TODO Auto-generated method st
	

	private void signupStaff(HttpServletRequest request, HttpServletResponse response)  {
		
        response.setContentType("text/html");  
		
		String name = request.getParameter("name"); 
		String phonenumber = request.getParameter("telno");
		int managerid = Integer.parseInt(request.getParameter("manid"));
		String password = request.getParameter("pass");
		String role = request.getParameter("role");

		try {
			
			Connection conn = null;
			PreparedStatement stat = null;
		     	Class.forName("org.postgresql.Driver"); 
				String DB_CONNECTION = "jdbc:postgresql://localhost:5432/postgres";
				String DB_USER = "postgres";	
				String DB_PASSWORD = "system";

				conn = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
				String data = "insert into staff(staff_name,staff_password,manager_id,staff_telno,staff_role) values(?,?,?,?,?)";
				stat = conn.prepareStatement(data);
				
				stat.setString(1,name);
				stat.setString(2,password);
				stat.setInt(3,managerid);
				stat.setString(4,phonenumber);
				stat.setString(5,role);
				
				stat.executeUpdate();
				response.sendRedirect("SAStaffList.jsp");
			}
			
			 catch (Exception e){
		            e.printStackTrace();
		            
		        }

    	

		
	}
		
		
		// TODO Auto-generated method stub
		

	private void deleteStaff(HttpServletRequest request, HttpServletResponse response) 
		             {
		        String id = request.getParameter("id");
		        
				try {
					
					Connection conn = null;
					PreparedStatement stat = null;
						String DB_CONNECTION = "jdbc:postgresql://localhost:5432/postgres";
						String DB_USER = "postgres";	
						String DB_PASSWORD = "system";

						conn = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
						String data = "DELETE * staff where staff_id '"+id+"'";
						stat = conn.prepareStatement(data);
						
						
						stat.executeUpdate();
						response.sendRedirect("dasboardstaff.jsp");
					}
					
					 catch (Exception e){
				            e.printStackTrace();
				            
				        }
		    }
	

	private void updateStaff(HttpServletRequest request, HttpServletResponse response) { 
		// TODO Auto-generated method stub
        response.setContentType("text/html");  
		
		int ID = Integer.parseInt(request.getParameter("ID")); 
		String name = request.getParameter("name"); 
		String phonenumber = request.getParameter("telno");
		int managerid = Integer.parseInt(request.getParameter("manid"));
		String password = request.getParameter("pass");
		String role = request.getParameter("role");

		try {
			
			Connection conn = null;
			PreparedStatement stat = null;
				String DB_CONNECTION = "jdbc:postgresql://localhost:5432/postgres";
				String DB_USER = "postgres";	
				String DB_PASSWORD = "system";

				conn = DriverManager.getConnection(DB_CONNECTION, DB_USER, DB_PASSWORD);
				String data = "UPDATE staff set staff_name=?,staff_password=?,manager_id=?,staff_telno=?,staff_role=? where staff_id=?";
				stat = conn.prepareStatement(data);
				
				stat.setString(1,name);
				stat.setString(2,password);
				stat.setInt(3,managerid);
				stat.setString(4,phonenumber);
				stat.setString(5,role);
				stat.setInt(6,ID);

				
				stat.executeUpdate();
				response.sendRedirect("SAStaffList.jsp");
			}
			
			 catch (Exception e){
		            e.printStackTrace();
		            
		        }
	}

	public void loginStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		
		HttpSession session = request.getSession();
        response.setContentType("text/html");  
        
        
              
        String n =request.getParameter("username");  
        String p =request.getParameter("userpass");  
        
        
        try {

            Class.forName("org.postgresql.Driver"); 
            String dbURL = "jdbc:postgresql://localhost:5432/postgres"; 
            String user = "postgres"; 
            String pass = "system"; 
    		Connection conn = DriverManager.getConnection(dbURL, user, pass);
    		
            String sql  ="SELECT * from staff";
            
            Statement statement = conn.createStatement();
            ResultSet rs = statement.executeQuery(sql);

        while (rs.next()) {
       if(n.equals(rs.getString("staff_id")) && (p.equals(rs.getString("staff_password"))))
       {
    	   	if((rs.getString("staff_role").equals("Head Admin"))) {
    	    
        	session.setAttribute("Staff_ID",rs.getString(1));
        	session.setAttribute("Staff_Name",rs.getString(2));
        	session.setAttribute("Staff_Password",rs.getString(3));
        	session.setAttribute("Manager_ID",rs.getInt(4));
        	session.setAttribute("Staff_TelNo",rs.getString(5));
        	session.setAttribute("Staff_Role",rs.getString(6));
        	
        	response.sendRedirect("SAAccount.jsp");}
    	   	
    	   	else{
        	    
            	session.setAttribute("Staff_ID",rs.getString(1));
            	session.setAttribute("Staff_Name",rs.getString(2));
            	session.setAttribute("Staff_Password",rs.getString(3));
            	session.setAttribute("Manager_ID",rs.getInt(4));
            	session.setAttribute("Staff_TelNo",rs.getString(5));
            	session.setAttribute("Staff_Role",rs.getString(6));
            	
            	response.sendRedirect("Account.jsp");}
    	   	
       
    	   }
  
       else{}
        }response.sendRedirect("StaffLogin.jsp");
        
   
        

}
        catch (Exception e){
            e.printStackTrace();
        }        	

	}

}

 







