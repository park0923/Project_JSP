package mysql;

//import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.*;

public class DatabaseUtil {
    public static Connection getConnection(){
        try {
            String dbURL = "jdbc:mysql://18.117.173.151:3306/jspdb?serverTimezone=UTC";
            String dbID = "root";
            String dbPW = "rootpassword";
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(dbURL, dbID, dbPW);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
