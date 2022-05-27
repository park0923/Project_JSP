package mysql;

import beans.ReservationDto;
import beans.ScheduleDto;

import java.time.LocalDateTime;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ScheduleDao {
    public static int SCHEDULE_EXISTENT = 1;
    public static int SCHEDULE_NONEXISTENT = 2;
    public static int SCHEDULE_INSERT_SUCCESS = 3;
    public static int SCHEDULE_DELETE_SUCCESS = 4;
    public static int SCHEDULE_LOGIN_FAIL = 5;
    public static int SCHEDULE_UPDATE_SUCCESS = 6;
    public static int SCHEDULE_UPDATE_FAIL = 7;

    private static ScheduleDao instance = new ScheduleDao();
    public static ScheduleDao getInstance() {
        return instance;
    }

    public int getScheduleId(){
        int id = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT max(schedule_index) from schedule";
        try{
            conn = DatabaseUtil.getConnection();
            if(conn == null )return id;
            pstmt=conn.prepareStatement(query);
            ResultSet resultSet = pstmt.executeQuery();
            if(resultSet.next()){
                id=resultSet.getInt("max(schedule_index)")+1;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return id;
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

    public int insertSchedule(String schedule_name, String schedule_lectureroom_num, String schedule_class_stime, String schedule_class_etime, String schedule_week){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO schedule (schedule_name, schedule_lectureroom_num, schedule_class_stime," +
                "schedule_class_etime, schedule_week) VALUES (?,?,?,?,?)";
        try{
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, schedule_name);
            pstmt.setString(2, schedule_lectureroom_num);
            pstmt.setString(3, schedule_class_stime);
            pstmt.setString(4, schedule_class_etime);
            pstmt.setString(5, schedule_week);
            pstmt.executeUpdate();
            rt = SCHEDULE_INSERT_SUCCESS;
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            try{
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();;
            }catch (Exception e){
                e.printStackTrace();;
            }
        }
        return rt;
    }

    public List<ScheduleDto> selectSchedule(String room){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT * From schedule WHERE schedule_lectureroom_num=? ORDER BY schedule_week";
        ResultSet rs = null;
        ArrayList<ScheduleDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, room);
            rs = pstmt.executeQuery();
            while(rs.next()){
                ScheduleDto dto = new ScheduleDto.Builder()
                        .schedule_name(rs.getString("schedule_name"))
                        .schedule_week(rs.getInt("schedule_week"))
                        .schedule_class_Stime(rs.getString("schedule_class_stime"))
                        .schedule_class_Etime(rs.getString("schedule_class_etime"))
                        .build();
                list.add(dto);

            }
            return list;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }

//    public List<ScheduleDto> selectSchedule(String sTime, String eTime, String room){
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        String query = "SELECT schedule_name, schedule_week From schedule WHERE schedule_class_stime=? AND schedule_class_eTime=? AND schedule_lectureroom_num=? ORDER BY schedule_week";
//        ResultSet rs = null;
//        ArrayList<ScheduleDto> list = new ArrayList<>();
//        try {
//            conn = DatabaseUtil.getConnection();
//            if (conn == null) return null;
//            pstmt = conn.prepareStatement(query);
//            pstmt.setString(1, sTime);
//            pstmt.setString(2, eTime);
//            pstmt.setString(3, room);
//
//            rs = pstmt.executeQuery();
//            while(rs.next()){
//                ScheduleDto dto = new ScheduleDto.Builder()
//                        .schedule_name(rs.getString("schedule_name"))
//                        .schedule_week(rs.getInt("schedule_week"))
//                        .build();
//                list.add(dto);
//
//            }
//            return list;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
}
