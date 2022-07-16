package Dao;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Model.Schedule;

public class ScheduleDAO {
    String dbURL = "jdbc:postgresql://ec2-176-34-215-248.eu-west-1.compute.amazonaws.com/delu1t92658u0";
    String user = "zaiaryvqbpwwcb";
    String pass = "731fafeb016f84ea7f87300cbd19a24ba3e96adbaaf92504bc8d945d0302489b";

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
                     ("insert into schedule(schedule_date,schedule_time,schedule_description,schedule_availability,course_id) values(?,?,?,?,?)"))
        {

            ps.setDate(1, stat.getSchedule_Date());
            ps.setString(2, stat.getSchedule_Time());
            ps.setString(3, stat.getSchedule_Description());
            ps.setString(4, stat.getAvailability());
            ps.setInt(5, stat.getCourse_ID());
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        
    }
	public void updateSchedule(Schedule stmt) {
		
        try (Connection con = getConnection();
                PreparedStatement ps = con.prepareStatement
                        ("update schedule set schedule_date=?,schedule_time=?,schedule_description=?,schedule_availability=?,course_id=? where schedule_id=?"))
           {

               ps.setDate(1, stmt.getSchedule_Date());
               ps.setString(2, stmt.getSchedule_Time());
               ps.setString(3, stmt.getSchedule_Description());
               ps.setString(4, stmt.getAvailability());
               ps.setInt(5, stmt.getCourse_ID());
               ps.setString(6, stmt.getSchedule_ID());

               ps.executeUpdate();
           }
           catch (Exception e) {
               e.printStackTrace();
           }
		
		
		// TODO Auto-generated method stub
		
	}
}
/*
    public boolean deleteAnnouncement(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from announcement where announcementid=?");) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    public boolean updateAnnouncement(Announcement anc) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement ps = connection.prepareStatement("update announcement set announcementpicture=?,announcementtitle=?,announcementdesc=?,announcementdate=?,announcementtime=? where announcementid=?");) {

            ps.setString(1, anc.getPicture());
            ps.setString(2, anc.getTitle());
            ps.setString(3, anc.getDescr());
            ps.setDate(4, anc.getDate());
            ps.setString(5, anc.getTime());
            ps.setInt(6, anc.getId());
            rowUpdated = ps.executeUpdate() > 0;
        }
        return rowUpdated;
    }

*/