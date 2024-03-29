package Dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Model.Schedule;

public class ScheduleDAO {
    String dbURL = "jdbc:postgresql://localhost:5432/postgres";
    String user = "postgres";
    String pass = "system";

    protected Connection getConnection() {
        Connection con = null;
        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(dbURL, user, pass);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return con;

    }
    public void addSchedule (Schedule stat) throws SQLException {

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into schedule(schedule_time,schedule_date,schedule_description,course_id) values(?,?,?,?)"))
        {

            ps.setDate(2, stat.getSchedule_Date());
            ps.setString(1, stat.getSchedule_Time());
            ps.setString(3, stat.getSchedule_Description());
            ps.setInt(4, stat.getCourse_ID());
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
    }
	public void updateSchedule(Schedule stmt) {
		
        try (Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement
                        ("update schedule set schedule_date=?,schedule_time=?,schedule_description=?,course_id=? where schedule_id=?"))
           {

               ps.setDate(1, stmt.getSchedule_Date());
               ps.setString(2, stmt.getSchedule_Time());
               ps.setString(3, stmt.getSchedule_Description());
               ps.setInt(4, stmt.getCourse_ID());
               ps.setString(5, stmt.getSchedule_ID());

               ps.executeUpdate();
           }
           catch (Exception e) {
               e.printStackTrace();
           }
		
		
		// TODO Auto-generated method stub
		
	}
}
