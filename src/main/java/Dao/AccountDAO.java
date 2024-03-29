package Dao;

import static java.lang.System.out;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Model.Account;


public class AccountDAO {
	String dbURL = "jdbc:postgresql://localhost:5432/postgres";
    String user = "postgres";
    String pass = "system";
    //accdao
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
    
    public void addAcc (Account part) throws SQLException {

        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement
                     ("insert into participant(participant_name,participant_email,participant_phoneno,participant_password) values(?,?,?,?)"))
        {

            ps.setString(1, part.getPartName());
            ps.setString(2, part.getPartEmail());
            ps.setString(3, part.getPartPhone());
            ps.setString(4, part.getPartPass());
            
            out.println(ps);
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    public boolean deleteAcc(String participant_id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("delete from topic where topicid=?");) {
            statement.setString(1, participant_id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }
    
    public void updateAcc (Account part) throws SQLException {
    
        try (Connection con = getConnection();
             PreparedStatement ps = con.prepareStatement("update participant set participant_name=?,participant_email=?,participant_phoneno=?,participant_password WHERE participant_id = ?"))
        {

            ps.setString(1, part.getPartName());
            ps.setString(2, part.getPartEmail());
            ps.setString(3, part.getPartPhone());
            ps.setString(4, part.getPartPass());
            ps.executeUpdate();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
}
