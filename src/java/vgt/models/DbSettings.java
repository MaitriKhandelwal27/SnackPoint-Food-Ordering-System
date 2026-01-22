package vgt.models;
import java.sql.*;
public class DbSettings {
    public Connection connect()
    {
        Connection cn=null;
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            String dbpath = "jdbc:mysql://localhost:3306/snackers";
            String dbuser = "root";
            String dbpass = "YOUR_DB_PASSWORD";
            cn = DriverManager.getConnection(dbpath, dbuser, dbpass);
        }
        catch(Exception e)
        {
            System.out.println("DbSettings. connect : "+e.getMessage());
        }
        return cn;
    }
}
