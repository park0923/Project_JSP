package mysql;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.DatabaseUtil;

public class testDAO {
    private static testDAO instance = new testDAO();

    public static testDAO getInstance() {
        return instance;
    }

    Connection conn = DatabaseUtil.getConnection();

    public int join(String schedule_name, String schedule_lectureroom_num, String schedule_class_Stime, String schedule_class_Etime, String schedule_week) {
        String SQL = "INSERT INTO schedule VALUES (?,?,?,?,?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, schedule_name);
            pstmt.setString(2, schedule_lectureroom_num);
            pstmt.setString(3, schedule_class_Stime);
            pstmt.setString(4, schedule_class_Etime);
            pstmt.setString(5, schedule_week);

            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;
    }

    public ResultSet getSchedule() {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String query = "SELECT * FROM schedule";

        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rs;
            pstmt = conn.prepareStatement(query);
            rs = pstmt.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rs;
    }
}