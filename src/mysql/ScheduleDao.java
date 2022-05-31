package mysql;

import beans.ReservationDto;
import beans.ScheduleDto;


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

    public int insertSchedule(String schedule_name, String schedule_lectureroom_num, String schedule_class_stime, String schedule_class_etime, String schedule_week, String sDate, String eDate){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "INSERT INTO schedule (schedule_name, schedule_lectureroom_num, schedule_class_stime," +
                "schedule_class_etime, schedule_week, schedule_Sdate, schedule_Edate) VALUES (?,?,?,?,?,?,?)";
        try{
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, schedule_name);
            pstmt.setString(2, schedule_lectureroom_num);
            pstmt.setString(3, schedule_class_stime);
            pstmt.setString(4, schedule_class_etime);
            pstmt.setString(5, schedule_week);
            pstmt.setString(6, sDate);
            pstmt.setString(7, eDate);
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

    public List<ScheduleDto> selectSchedule(String room, String date, String mon, String fri){
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT * From schedule " +
                "WHERE schedule_lectureroom_num=? AND " +
                "((? BETWEEN schedule_Sdate AND schedule_Edate) OR (schedule_Sdate BETWEEN ? AND ?))" +
                "                   ORDER BY schedule_week;  ";
        ResultSet rs = null;
        ArrayList<ScheduleDto> list = new ArrayList<>();
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return null;
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, room);
            pstmt.setString(2, date);
            pstmt.setString(3, mon);
            pstmt.setString(4, fri);
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

    public int scheduleCheck(String room, int week, int start, int end, String date){
        int rt = 0;
        Connection conn = null;
        PreparedStatement pstmt = null;
        String query = "SELECT COUNT(*) cnt FROM schedule WHERE schedule_week=?" +
                "                AND schedule_lectureroom_num=?" +
                "                AND ((? >= CONVERT(SUBSTR(schedule_class_Stime,1, INSTR(schedule_class_stime,':')-1), signed integer) AND ? < CONVERT(SUBSTR(schedule_class_Etime,1, INSTR(schedule_class_Etime,':')-1), signed integer))" +
                "                OR (? >= CONVERT(SUBSTR(schedule_class_Stime,1, INSTR(schedule_class_stime,':')-1), signed integer) AND ? < CONVERT(SUBSTR(schedule_class_Etime,1, INSTR(schedule_class_Etime,':')-1), signed integer))" +
                "                OR (? <= CONVERT(SUBSTR(schedule_class_Stime,1, INSTR(schedule_class_stime,':')-1), signed integer) AND ? >= CONVERT(SUBSTR(schedule_class_Etime,1, INSTR(schedule_class_Etime,':')-1), signed integer)))" +
                "AND (schedule_Edate >= ? AND ? >= schedule_Sdate)";
        ResultSet rs = null;
        try {
            conn = DatabaseUtil.getConnection();
            if (conn == null) return rt;
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, week);
            pstmt.setString(2, room);
            pstmt.setInt(3, start);
            pstmt.setInt(4, start);
            pstmt.setInt(5, end);
            pstmt.setInt(6, end);
            pstmt.setInt(7, start);
            pstmt.setInt(8, end);
            pstmt.setString(9, date);
            pstmt.setString(10, date);
            rs = pstmt.executeQuery();
            while(rs.next()){
                rt = rs.getInt("cnt");
            }


            return rt;
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
        return rt;
    }

//    public List<ScheduleDto> getSchedulePaging(int startRow, int endRow){
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        String query = "";
//        ResultSet rs = null;
//        ArrayList<ReservationDto> list = new ArrayList<>();
//        try {
//            conn = DatabaseUtil.getConnection();
//            if (conn == null) return null;
//            if(id.equals("")){
//                query = "SELECT * FROM reservation ORDER BY reservation_date DESC, reservation_state LIMIT ?, ?";
//                pstmt = conn.prepareStatement(query);
//                pstmt.setInt(1, startRow);
//                pstmt.setInt(2, endRow);
//            }else {
//                query = "SELECT * FROM reservation WHERE reservation_id=? ORDER BY reservation_date DESC, reservation_state LIMIT ?, ?";
//                pstmt = conn.prepareStatement(query);
//                pstmt.setString(1, id);
//                pstmt.setInt(2, startRow);
//                pstmt.setInt(3, endRow);
//            }
//            rs = pstmt.executeQuery();
//
//            while(rs.next()){
//                ReservationDto dto = new ReservationDto.Builder()
//                        .id(rs.getString("reservation_id"))
//                        .lectureroomNum(rs.getString("reservation_lectureroom_num"))
//                        .startTime(rs.getString("reservation_startTime"))
//                        .endTime(rs.getString("reservation_endTime"))
//                        .seat(rs.getString("reservation_seat"))
//                        .date(rs.getString("reservation_date"))
//                        .state(rs.getString("reservation_state"))
//                        .build();
//                list.add(dto);
//            }
//            return list;
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (pstmt != null) pstmt.close();
//                if (conn != null) conn.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return null;
//    }
//
//    public int getCount(){
//        int count = 0;
//        Connection conn = null;
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        String sql = "SELECT count(*) FROM reservation";
//        try {
//            conn = DatabaseUtil.getConnection();
//            pstmt = conn.prepareStatement(sql);
//            rs = pstmt.executeQuery();
//            if(rs.next()){
//                count = rs.getInt(1);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            try {
//                if (rs != null) rs.close();
//                if (pstmt != null) pstmt.close();
//                if (conn != null) conn.close();
//            } catch (Exception e) {
//                e.printStackTrace();
//            }
//        }
//        return count; // 총 레코드 수 리턴
//    }

}
